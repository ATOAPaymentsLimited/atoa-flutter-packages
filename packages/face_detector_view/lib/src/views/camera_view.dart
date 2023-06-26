import 'dart:developer';
import 'dart:io';

import 'package:camera/camera.dart';
import 'package:face_detector_view/src/utils/face_extension.dart';
import 'package:face_detector_view/src/views/default_floating_action_button.dart';
import 'package:flutter/material.dart';
import 'package:google_mlkit_face_detection/google_mlkit_face_detection.dart';

import '../utils/face_custom_painter.dart';
import 'default_bottom_sheet.dart';

class CameraView extends StatefulWidget {
  const CameraView({
    Key? key,
    required this.cameras,
    required this.onValidatedImageCapture,
    this.bottomSheet,
    this.floatingActionButton,
    this.initialDirection = CameraLensDirection.front,
  }) : super(key: key);

  final Widget? bottomSheet;
  final Widget Function(BuildContext, bool, CameraController?)?
      floatingActionButton;
  final List<CameraDescription> cameras;
  final Function(XFile) onValidatedImageCapture;
  final CameraLensDirection initialDirection;

  @override
  State<CameraView> createState() => _CameraViewState();
}

class _CameraViewState extends State<CameraView> with WidgetsBindingObserver {
  CameraController? _controller;
  int _cameraIndex = -1;

  bool _isBusy = false;
  bool _canCapture = false;
  final FaceDetector _faceDetector = FaceDetector(
    options: FaceDetectorOptions(
      performanceMode: FaceDetectorMode.accurate,
    ),
  );

  CustomPaint? _customPaint = const CustomPaint(
    painter: FaceCutoutPainter(canTakePhoto: false),
  );

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);

    for (var i = 0; i < widget.cameras.length; i++) {
      if (widget.cameras[i].lensDirection == widget.initialDirection) {
        _cameraIndex = i;
        break;
      }
    }

    _startLiveFeed();
  }

  @override
  void reassemble() {
    super.reassemble();
    if (mounted) _controller?.resumePreview();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) async {
    log(state.toString());

    if (state == AppLifecycleState.paused ||
        state == AppLifecycleState.inactive) {
      _controller?.pausePreview();
    }
    if (state == AppLifecycleState.resumed) {
      WidgetsBinding.instance.addPostFrameCallback((_) async {
        _controller?.resumePreview();
      });
    }
  }

  @override
  void dispose() {
    _stopLiveFeed();
    WidgetsBinding.instance.removeObserver(this);
    _faceDetector.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: _liveFeedBody(),
    );
  }

  Widget _liveFeedBody() {
    if (_controller == null || _controller?.value.isInitialized == false) {
      return Container();
    }

    final size = MediaQuery.of(context).size;
    final scale =
        1 / ((_controller?.value.aspectRatio ?? 1.0) * size.aspectRatio);

    return Container(
      color: Colors.black,
      child: Stack(
        children: <Widget>[
          Align(
            alignment: Alignment.topCenter,
            child: Transform.scale(
              scale: scale,
              child: CameraPreview(_controller!),
            ),
          ),
          Align(
            alignment: Alignment.center.add(const Alignment(0, -0.25)),
            child: Container(
              width: 400,
              height: 400,
              padding: const EdgeInsets.all(25.0),
              child: _customPaint,
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                widget.floatingActionButton
                        ?.call(context, _canCapture, _controller) ??
                    DefaultFloatingActionButton(
                      enabled: _canCapture,
                      cameraController: _controller!,
                      onValidatedImageCapture: widget.onValidatedImageCapture,
                    ),
                const SizedBox(
                  height: 20.0,
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: widget.bottomSheet ?? const DefaultBottomSheet(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _startLiveFeed() async {
    final camera = widget.cameras[_cameraIndex];
    _controller = CameraController(
      camera,
      ResolutionPreset.high,
      enableAudio: false,
      imageFormatGroup: Platform.isAndroid
          ? ImageFormatGroup.nv21
          : ImageFormatGroup.bgra8888,
    );
    _controller?.initialize().then((_) {
      if (!mounted) {
        return;
      }
      _controller?.startImageStream(_processCameraImage);
      setState(() {});
    });
  }

  Future<void> _stopLiveFeed() async {
    if (_controller?.value.isStreamingImages ?? true) {
      await _controller?.stopImageStream();
    }
    await _controller?.dispose();
    _controller = null;
  }

  void _processCameraImage(CameraImage image) {
    final inputImage = _inputImageFromCameraImage(image);
    if (inputImage == null) return;

    _processImage(inputImage);
  }

  InputImage? _inputImageFromCameraImage(CameraImage image) {
    // get camera rotation
    final camera = widget.cameras[_cameraIndex];
    final rotation =
        InputImageRotationValue.fromRawValue(camera.sensorOrientation);
    if (rotation == null) return null;

    // get image format
    final format = InputImageFormatValue.fromRawValue(image.format.raw);
    // validate format depending on platform
    // only supported formats:
    // * nv21 for Android
    // * bgra8888 for iOS
    if (format == null ||
        (Platform.isAndroid && format != InputImageFormat.nv21) ||
        (Platform.isIOS && format != InputImageFormat.bgra8888)) return null;

    // since format is constraint to nv21 or bgra8888, both only have one plane
    if (image.planes.length != 1) return null;
    final plane = image.planes.first;

    // compose InputImage using bytes
    return InputImage.fromBytes(
      bytes: plane.bytes,
      metadata: InputImageMetadata(
        size: Size(image.width.toDouble(), image.height.toDouble()),
        rotation: rotation, // used only in Android
        format: format, // used only in iOS
        bytesPerRow: plane.bytesPerRow, // used only in iOS
      ),
    );
  }

  Future<void> _processImage(InputImage inputImage) async {
    if (_isBusy) return;
    _isBusy = true;
    final size = MediaQuery.of(context).size;
    final prevValueCanCapture = _canCapture;

    final faces = await _faceDetector.processImage(inputImage);

    if (faces.length == 1) {
      final isFaceValidated = faces.first.faceWithinCutout(size);

      _customPaint = CustomPaint(
        painter: FaceCutoutPainter(canTakePhoto: isFaceValidated),
      );
      _canCapture = isFaceValidated;
    }
    _isBusy = false;
    if (mounted && prevValueCanCapture != _canCapture) setState(() {});
  }
}
