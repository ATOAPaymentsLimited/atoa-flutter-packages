import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_mlkit_face_detection/google_mlkit_face_detection.dart';

extension FaceCheck on Face {
  bool get isNotPannedLeftOrRight {
    final maxDeviation = 30.sp;
    final minDeviation = -30.sp;

    if (headEulerAngleY == null) return false;

    return (minDeviation < headEulerAngleY!) &&
        (headEulerAngleY! < maxDeviation);
  }

  bool get isNotPannedTopOrBottom {
    final maxDeviation = 30.sp;
    final minDeviation = -30.sp;

    if (headEulerAngleX == null) return false;

    return (minDeviation < headEulerAngleX!) &&
        (headEulerAngleX! < maxDeviation);
  }

  bool get isNotRotated {
    final maxDeviation = 15.sp;
    final minDeviation = -15.sp;

    if (headEulerAngleZ == null) return false;

    return (minDeviation < headEulerAngleZ!) &&
        (headEulerAngleZ! < maxDeviation);
  }

  bool faceWithinCutout(Size mediaSize) {
    final boundingBox = this.boundingBox;

    final centerOffset = Offset(mediaSize.width / 2, mediaSize.height / 2);
    final minDeviation = Offset(centerOffset.dx, centerOffset.dy + 50.sp);
    final maxDeviation =
        Offset(centerOffset.dx + 300.sp, centerOffset.dy + 400.sp);

    if (isSmallerThan(minDeviation, boundingBox.center) &&
        isSmallerThan(boundingBox.center, maxDeviation) &&
        isNotPannedLeftOrRight &&
        isNotPannedTopOrBottom &&
        isNotRotated) {
      return true;
    } else {
      return false;
    }
  }

  bool isSmallerThan(Offset offsetA, Offset offsetB) {
    if (offsetA.dx > offsetB.dx || offsetA.dy > offsetB.dy) {
      return false;
    }

    return true;
  }
}
