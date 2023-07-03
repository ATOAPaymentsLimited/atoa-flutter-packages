import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class DefaultFloatingActionButton extends StatefulWidget {
  final bool enabled;
  final CameraController cameraController;
  final Function(XFile) onValidatedImageCapture;

  const DefaultFloatingActionButton({
    super.key,
    required this.enabled,
    required this.cameraController,
    required this.onValidatedImageCapture,
  });

  @override
  State<DefaultFloatingActionButton> createState() =>
      _DefaultFloatingActionButtonState();
}

class _DefaultFloatingActionButtonState
    extends State<DefaultFloatingActionButton> {
  final ValueNotifier<bool> pressed = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: pressed,
      builder: (context, isPressed, child) => Align(
        alignment: Alignment.bottomCenter,
        child: SizedBox(
          height: 65.0,
          width: 65.0,
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            child: !widget.enabled
                ? const SizedBox.shrink()
                : GestureDetector(
                    onTap: widget.enabled ? onImageCapture : null,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          height: 60,
                          width: 60,
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: isPressed ? Colors.grey : Colors.white,
                              width: 2,
                            ),
                          ),
                        ),
                        Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: isPressed ? Colors.grey : Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
          ),
        ),
      ),
    );
  }

  void onImageCapture() async {
    if (pressed.value == false) {
      pressed.value = true;
    }

    //TODO: stopimageStream is a temp fix
    if (widget.cameraController.value.isStreamingImages) {
      await widget.cameraController.stopImageStream();
    }
    final faceImage = await widget.cameraController.takePicture();
    pressed.value = false;

    widget.onValidatedImageCapture.call(faceImage);
  }
}
