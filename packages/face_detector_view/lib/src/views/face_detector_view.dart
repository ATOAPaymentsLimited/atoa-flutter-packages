import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
import 'package:image/image.dart' as img;

import '../controllers/face_detector_controller.dart';
import '../utils/permission_status_enum.dart';
import 'kyb_view.dart';

class FaceDetectorView extends StatefulWidget {
  final Widget? bottomSheet;
  final Widget Function(BuildContext context, bool canCapture,
      CameraController? cameraController)? floatingActionButton;
  final PermissionStatus Function()? cameraPermissionError;
  final Image Function()? onCapture;
  final Widget? cameraPermissionDeniedScreen;
  final Widget? errorScreen;
  final Function(XFile) onValidatedImageCapture;

  const FaceDetectorView({
    super.key,
    this.bottomSheet,
    this.floatingActionButton,
    this.cameraPermissionError,
    this.onCapture,
    this.errorScreen,
    this.cameraPermissionDeniedScreen,
    required this.onValidatedImageCapture,
  });

  @override
  State<FaceDetectorView> createState() => _FaceDetectorViewState();
}

class _FaceDetectorViewState extends State<FaceDetectorView>
    with WidgetsBindingObserver {
  late final FaceDetectorController _faceDetectorController;

  @override
  void initState() {
    super.initState();
    _faceDetectorController = FaceDetectorController();
    _checkPermission();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) async {
    if (state == AppLifecycleState.resumed) {
      if (await Permission.camera.isGranted) {
        setState(() {
          _faceDetectorController.permissionStatus =
              PermissionStatusEnum.granted;
        });
      }
    }
  }

  //TODO: Doubt: adding this here gives a 'already disposed' error
  // @override
  // void dispose() {
  //   _faceDetectorController.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => _faceDetectorController,
      child: Selector<FaceDetectorController, PermissionStatusEnum>(
        selector: (_, state) => state.permissionStatus,
        builder: (context, permissionStatus, child) {
          return AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            child: _getChild(permissionStatus),
          );
        },
      ),
    );
  }

  Widget _getChild(PermissionStatusEnum permissionStatus) {
    if (permissionStatus != PermissionStatusEnum.granted) {
      return widget.cameraPermissionDeniedScreen ??
          const Center(
            child: Text('Permission Denied'),
          );
    } else {
      return KybView(
        onValidatedImageCapture: (image) async {
          final img.Image capturedImage =
              img.decodeImage(await File(image.path).readAsBytes())!;
          final img.Image orientedImage = img.bakeOrientation(capturedImage);
          await File(image.path).writeAsBytes(img.encodeJpg(orientedImage));
          widget.onValidatedImageCapture.call(image);
        },
        errorScreen: widget.errorScreen,
        bottomSheet: widget.bottomSheet,
        floatingActionButton: widget.floatingActionButton,
      );
    }
  }

  Future<void> _checkPermission() async {
    _faceDetectorController.permissionStatus = PermissionStatusEnum.checking;

    final status = await Permission.camera.request();

    switch (status) {
      case PermissionStatus.granted:
        _faceDetectorController.permissionStatus = PermissionStatusEnum.granted;
        break;
      case PermissionStatus.denied:
        _faceDetectorController.permissionStatus =
            PermissionStatusEnum.isDenied;
        break;
      case PermissionStatus.permanentlyDenied:
        _faceDetectorController.permissionStatus =
            PermissionStatusEnum.permanantlyDenied;
        break;
      case PermissionStatus.restricted:
        _faceDetectorController.permissionStatus =
            PermissionStatusEnum.restricted;
        break;
      default:
        _faceDetectorController.permissionStatus =
            PermissionStatusEnum.checking;
        break;
    }
  }
}
