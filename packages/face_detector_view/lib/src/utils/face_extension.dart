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
}
