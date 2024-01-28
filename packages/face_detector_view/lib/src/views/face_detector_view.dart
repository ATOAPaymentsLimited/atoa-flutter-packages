import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:permission_handler/permission_handler.dart';
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
    WidgetsBinding.instance.addPersistentFrameCallback((_) {
      _faceDetectorController.requestCameraPermission();
    });
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) async {
    if (state == AppLifecycleState.resumed) {
      if (_faceDetectorController.value != PermissionStatusEnum.granted) {
        _faceDetectorController.requestCameraPermission();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      builder: (context, _) => ValueListenableBuilder(
        valueListenable: _faceDetectorController,
        builder: (context, permissionStatus, child) {
          return AnimatedSwitcher(
            duration: const Duration(milliseconds: 200),
            child: _getChild(permissionStatus),
          );
        },
      ),
    );
  }

  Widget _getChild(PermissionStatusEnum permissionStatus) {
    if (permissionStatus == PermissionStatusEnum.checking) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    if (permissionStatus != PermissionStatusEnum.granted) {
      return widget.cameraPermissionDeniedScreen ??
          const Center(
            child: Text('Permission Denied'),
          );
    }

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
