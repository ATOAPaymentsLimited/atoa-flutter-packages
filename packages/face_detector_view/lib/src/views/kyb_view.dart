import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

import 'camera_view.dart';

class KybView extends StatefulWidget {
  final Image Function()? onCapture;
  final Widget? errorScreen;
  final Function(XFile) onValidatedImageCapture;

  const KybView({
    super.key,
    this.onCapture,
    this.errorScreen,
    required this.onValidatedImageCapture,
  });

  @override
  State<KybView> createState() => _KybViewState();
}

class _KybViewState extends State<KybView> with WidgetsBindingObserver {
  final _getAvailableCamerasFuture = availableCameras();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<CameraDescription>>(
      future: _getAvailableCamerasFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasError || !snapshot.hasData) {
            return widget.errorScreen ??
                const Center(
                  child: Text('Error'),
                );
          }

          return CameraView(
            title: 'Face Detector',
            cameras: snapshot.data!,
            onValidatedImageCapture: widget.onValidatedImageCapture,
          );
        }

        return const CircularProgressIndicator();
      },
    );
  }
}
