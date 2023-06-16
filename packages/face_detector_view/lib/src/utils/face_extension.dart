import 'package:flutter/material.dart';
import 'package:google_mlkit_face_detection/google_mlkit_face_detection.dart';

extension FaceCheck on Face {
  bool isNotPannedLeftOrRight() {
    const maxDeviation = 5.0;
    const minDeviation = -5.0;

    if (headEulerAngleY == null) return false;

    return (minDeviation < headEulerAngleY!) &&
        (headEulerAngleY! < maxDeviation);
  }

  bool isNotPannedTopOrBottom() {
    const maxDeviation = 10.0;
    const minDeviation = -10.0;

    if (headEulerAngleX == null) return false;

    return (minDeviation < headEulerAngleX!) &&
        (headEulerAngleX! < maxDeviation);
  }

  bool isNotRotated() {
    const maxDeviation = 15.0;
    const minDeviation = -15.0;

    if (headEulerAngleZ == null) return false;

    return (minDeviation < headEulerAngleZ!) &&
        (headEulerAngleZ! < maxDeviation);
  }

  bool faceInCenter(Size mediaSize) {
    final boundingBox = this.boundingBox;

    final centerOffset = Offset(mediaSize.width / 2, mediaSize.height / 2);
    final maxDeviation = Offset(centerOffset.dx + 200, centerOffset.dy + 400);
    final minDeviation = Offset(centerOffset.dx, centerOffset.dy + 100);

    if (isSmallerThan(minDeviation, boundingBox.center) &&
        isSmallerThan(boundingBox.center, maxDeviation) &&
        isNotPannedLeftOrRight() &&
        isNotPannedTopOrBottom() &&
        isNotRotated()) {
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
