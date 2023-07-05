import 'package:flutter/material.dart';

import '../utils/permission_status_enum.dart';

class FaceDetectorController extends ChangeNotifier {
  PermissionStatusEnum _permissionStatus = PermissionStatusEnum.checking;

  PermissionStatusEnum get permissionStatus => _permissionStatus;

  set permissionStatus(PermissionStatusEnum newStatus) {
    _permissionStatus = newStatus;
    notifyListeners();
  }
}
