import 'package:camera/camera.dart';
import 'package:face_detector_view/src/utils/face_custom_painter.dart';
import 'package:face_detector_view/src/views/default_floating_action_button.dart';
import 'package:face_detector_view/src/views/web_bottom_sheet.dart';
import 'package:flutter/material.dart';

class WebCameraView extends StatefulWidget {
  const WebCameraView({
    super.key,
    required this.cameras,
    required this.onValidatedImageCapture,
    this.bottomSheet,
    this.floatingActionButton,
    this.initialDirection = CameraLensDirection.front,
  });

  final Widget? bottomSheet;
  final Widget Function(BuildContext, bool, CameraController?)?
      floatingActionButton;
  final List<CameraDescription> cameras;
  final Function(XFile) onValidatedImageCapture;
  final CameraLensDirection initialDirection;

  @override
  State<WebCameraView> createState() => WebCameraViewState();
}

class WebCameraViewState extends State<WebCameraView> {
  CameraController? _controller;

  CameraDescription? _selectedCamera;

  @override
  void initState() {
    super.initState();
    initCamera();
  }

  Future<void> initCamera() async {
    WidgetsFlutterBinding.ensureInitialized();

    for (var camera in widget.cameras) {
      if (camera.lensDirection == widget.initialDirection) {
        _selectedCamera = camera;
      }
    }

    _selectedCamera = _selectedCamera ?? widget.cameras.first;

    _controller = CameraController(
      _selectedCamera!,
      ResolutionPreset.medium,
      enableAudio: false,
    );
    _controller!.initialize().then((_) {
      if (!mounted) {
        return;
      }

      setState(() {});
    }).catchError((Object e) {
      if (e is CameraException) {
        switch (e.code) {
          case 'CameraAccessDenied':
            break;
          default:
            break;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: Builder(
          builder: (context) {
            if (_controller == null) {
              return const Center(
                child: Text("Camera Not Ready"),
              );
            }

            final previewSize =
                _controller!.value.previewSize ?? const Size(480, 640);

            return Stack(
              fit: StackFit.expand,
              children: [
                CameraPreview(_controller!),
                Align(
                  alignment: Alignment.center.add(const Alignment(0, -0.25)),
                  child: CustomPaint(
                    size: previewSize,
                    painter: const FaceCutoutPainter(canTakePhoto: false),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: widget.bottomSheet ??
                      WebBottomSheet(
                        button: DefaultFloatingActionButton(
                          enabled: true,
                          cameraController: _controller!,
                          onValidatedImageCapture:
                              widget.onValidatedImageCapture,
                        ),
                      ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
