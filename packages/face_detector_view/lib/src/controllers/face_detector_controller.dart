import 'package:camera/camera.dart';
import 'package:flutter/foundation.dart';
import 'package:permission_handler/permission_handler.dart';

import '../utils/permission_status_enum.dart';

class FaceDetectorController extends ValueNotifier<PermissionStatusEnum> {
  FaceDetectorController() : super(PermissionStatusEnum.checking);

  Future<void> requestCameraPermission() async {
    if (kIsWeb) {
      try {
        final cameras = await availableCameras();

        value = cameras.isEmpty
            ? PermissionStatusEnum.isDenied
            : PermissionStatusEnum.granted;
      } catch (e) {
        value = PermissionStatusEnum.isDenied;
      }
    } else {
      final permission = await Permission.camera.request();

      value = switch (permission) {
        PermissionStatus.granted => PermissionStatusEnum.granted,
        PermissionStatus.denied => PermissionStatusEnum.isDenied,
        PermissionStatus.permanentlyDenied => PermissionStatusEnum.isDenied,
        PermissionStatus.restricted => PermissionStatusEnum.restricted,
        _ => PermissionStatusEnum.checking,
      };
    }
  }
}
