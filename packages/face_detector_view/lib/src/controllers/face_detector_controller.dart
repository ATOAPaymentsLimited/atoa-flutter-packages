import 'package:flutter/foundation.dart';
import 'package:permission_handler/permission_handler.dart';

import '../utils/permission_status_enum.dart';

class FaceDetectorController extends ValueNotifier<PermissionStatusEnum> {
  FaceDetectorController() : super(PermissionStatusEnum.checking);

  Future<void> requestCameraPermission() async {
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
