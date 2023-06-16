import 'package:flutter/material.dart';

import '../utils/permission_status_enum.dart';

class FaceDetectorController extends ChangeNotifier {
  PermissionStatusEnum _permissionStatus = PermissionStatusEnum.checking;
  bool _captureDisabled = false;

  PermissionStatusEnum get permissionStatus => _permissionStatus;
  bool get captureDisabled => _captureDisabled;

  set captureDisabled(bool newValue) {
    _captureDisabled = newValue;
    notifyListeners();
  }

  set permissionStatus(PermissionStatusEnum newStatus) {
    _permissionStatus = newStatus;
    notifyListeners();
  }
}
