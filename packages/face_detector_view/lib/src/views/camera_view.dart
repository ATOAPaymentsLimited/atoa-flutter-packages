import 'dart:io';

import 'package:camera/camera.dart';
import 'package:face_detector_view/src/utils/face_extension.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';
import 'package:google_mlkit_face_detection/google_mlkit_face_detection.dart';

import '../utils/face_custom_painter.dart';
import 'default_bottom_sheet.dart';

class CameraView extends StatefulWidget {
  const CameraView({
    Key? key,
    required this.cameras,
    required this.title,
    required this.onValidatedImageCapture,
    this.bottomSheet,
    this.initialDirection = CameraLensDirection.front,
  }) : super(key: key);

  final String title;
  final Widget? bottomSheet;
  final List<CameraDescription> cameras;
  final Function(XFile) onValidatedImageCapture;
  final CameraLensDirection initialDirection;

  @override
  State<CameraView> createState() => _CameraViewState();
}

class _CameraViewState extends State<CameraView> with WidgetsBindingObserver {
  CameraController? _controller;
  int _cameraIndex = -1;
  final ValueNotifier<bool> pressed = ValueNotifier(false);

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

    if (widget.cameras.any(
      (element) =>
          element.lensDirection == widget.initialDirection &&
          element.sensorOrientation == 0,
    )) {
      _cameraIndex = widget.cameras.indexOf(
        widget.cameras.firstWhere((element) =>
            element.lensDirection == widget.initialDirection &&
            element.sensorOrientation == 0),
      );
    } else {
      for (var i = 0; i < widget.cameras.length; i++) {
        if (widget.cameras[i].lensDirection == widget.initialDirection) {
          _cameraIndex = i;
          break;
        }
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
    if (state == AppLifecycleState.paused) {
      _controller?.pausePreview();
    }
    if (state == AppLifecycleState.resumed) {
      _controller?.resumePreview();
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

  Widget? _floatingActionButton() {
    return ValueListenableBuilder<bool>(
      valueListenable: pressed,
      builder: (context, state, _) {
        return Align(
          alignment: Alignment.bottomCenter,
          child: SizedBox(
            height: 100.0,
            width: 100.0,
            child: InkWell(
              onTap: _canCapture ? onImageCapture : null,
              child: SvgPicture.asset(
                'assets/click_picture_button.svg',
                colorFilter: ColorFilter.mode(
                  pressed.value || !_canCapture ? Colors.grey : Colors.white,
                  BlendMode.srcIn,
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _liveFeedBody() {
    if (_controller?.value.isInitialized == false) {
      return Container();
    }

    final size = MediaQuery.of(context).size;
    final scale = 1 / (_controller!.value.aspectRatio * size.aspectRatio);

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
            child: SizedBox(
              width: 400,
              height: 400,
              child: _customPaint,
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                if (_floatingActionButton() != null) ...[
                  _floatingActionButton()!,
                ],
                const SizedBox(
                  height: 20.0,
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: widget.bottomSheet ?? const DefaultBottomSheet(),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Future _startLiveFeed() async {
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

  Future _stopLiveFeed() async {
    await _controller?.stopImageStream();
    await _controller?.dispose();
    _controller = null;
  }

  void _processCameraImage(CameraImage image) {
    final inputImage = _inputImageFromCameraImage(image);
    if (inputImage == null) return;

    processImage(inputImage);
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

  Future<void> processImage(InputImage inputImage) async {
    if (_isBusy) return;
    _isBusy = true;

    final faces = await _faceDetector.processImage(inputImage);

    if (inputImage.metadata?.size != null &&
        inputImage.metadata?.rotation != null &&
        faces.length == 1 &&
        faceInCenter(faces.first)) {
      final isFaceValidated = faceInCenter(faces.first);

      //TODO: ValueChanged can be used here to prevent setStates? (Millions)
      _customPaint = CustomPaint(
        painter: FaceCutoutPainter(
          canTakePhoto: isFaceValidated,
        ),
      );
      _canCapture = true;
    } else {
      _customPaint = const CustomPaint(
        painter: FaceCutoutPainter(canTakePhoto: false),
      );
      _canCapture = false;
    }
    _isBusy = false;
    if (mounted) setState(() {});
  }

  void onImageCapture() async {
    pressed.value = true;
    //TODO:
    await _controller!.stopImageStream();
    final faceImage = await _controller!.takePicture();
    widget.onValidatedImageCapture.call(faceImage);
    await Future.delayed(const Duration(milliseconds: 200));
    pressed.value = false;
  }

  bool faceInCenter(Face face) {
    final boundingBox = face.boundingBox;

    final size = MediaQuery.of(context).size;
    final centerOffset = Offset(size.width / 2, size.height / 2);
    final maxDeviation = Offset(centerOffset.dx + 200, centerOffset.dy + 400);
    final minDeviation = Offset(centerOffset.dx, centerOffset.dy + 100);

    if (isSmallerThan(minDeviation, boundingBox.center) &&
        isSmallerThan(boundingBox.center, maxDeviation) &&
        face.isNotPannedLeftOrRight() &&
        face.isNotPannedTopOrBottom() &&
        face.isNotRotated()) {
      return true;
    } else {
      return false;
    }
  }

  bool isSmallerThan(Offset x, Offset y) {
    if (x.dx > y.dx) {
      return false;
    }
    if (x.dy > y.dy) {
      return false;
    }

    return true;
  }
}
