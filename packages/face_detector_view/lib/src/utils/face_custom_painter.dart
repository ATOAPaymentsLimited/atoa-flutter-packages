import 'dart:math';

import 'package:flutter/material.dart';

//Copy this CustomPainter code to the Bottom of the File
class FaceCutoutPainter extends CustomPainter {
  final bool canTakePhoto;
  const FaceCutoutPainter({required this.canTakePhoto});

  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(size.width * 0.009090909, size.height * 0.1545455);
    path_0.lineTo(size.width * 0.009090909, size.height * 0.1060606);
    path_0.cubicTo(
        size.width * 0.009090909,
        size.height * 0.05250576,
        size.width * 0.05250576,
        size.height * 0.009090909,
        size.width * 0.1060606,
        size.height * 0.009090909);
    path_0.lineTo(size.width * 0.1545455, size.height * 0.009090909);

    Paint paint0Stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.01818182;
    paint0Stroke.color = getStrokeColor();
    paint0Stroke.strokeCap = StrokeCap.round;
    canvas.drawPath(path_0, paint0Stroke);

    Path path_1 = Path();
    path_1.moveTo(size.width * 0.1545455, size.height * 0.9909091);
    path_1.lineTo(size.width * 0.1060606, size.height * 0.9909091);
    path_1.cubicTo(
        size.width * 0.05250576,
        size.height * 0.9909091,
        size.width * 0.009090909,
        size.height * 0.9474939,
        size.width * 0.009090909,
        size.height * 0.8939394);
    path_1.lineTo(size.width * 0.009090909, size.height * 0.8454545);

    Paint paint1Stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.01818182;
    paint1Stroke.color = getStrokeColor();
    paint1Stroke.strokeCap = StrokeCap.round;
    canvas.drawPath(path_1, paint1Stroke);

    Path path_2 = Path();
    path_2.moveTo(size.width * 0.9909091, size.height * 0.8454545);
    path_2.lineTo(size.width * 0.9909091, size.height * 0.8939394);
    path_2.cubicTo(
        size.width * 0.9909091,
        size.height * 0.9474939,
        size.width * 0.9474939,
        size.height * 0.9909091,
        size.width * 0.8939394,
        size.height * 0.9909091);
    path_2.lineTo(size.width * 0.8454545, size.height * 0.9909091);

    Paint paint2Stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.01818182;
    paint2Stroke.color = getStrokeColor();
    paint2Stroke.strokeCap = StrokeCap.round;
    canvas.drawPath(path_2, paint2Stroke);

    Path path_3 = Path();
    path_3.moveTo(size.width * 0.8454545, size.height * 0.009090909);
    path_3.lineTo(size.width * 0.8939394, size.height * 0.009090909);
    path_3.cubicTo(
        size.width * 0.9474939,
        size.height * 0.009090909,
        size.width * 0.9909091,
        size.height * 0.05250576,
        size.width * 0.9909091,
        size.height * 0.1060606);
    path_3.lineTo(size.width * 0.9909091, size.height * 0.1545455);

    Paint paint3Stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.01818182;
    paint3Stroke.color = getStrokeColor();
    paint3Stroke.strokeCap = StrokeCap.round;
    canvas.drawPath(path_3, paint3Stroke);

    Paint complete = Paint()
      ..color = getStrokeColor()
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.009090909;

    var percent = 0.005;

    double arcAngle = 2 * pi * percent;

    for (var i = 0; i < 100; i++) {
      var init = (-pi / 15) * (i / 2);

      canvas.drawArc(
          Rect.fromLTWH(size.width / 6.7, size.height * 0.045,
              size.height / 1.4, size.height * 0.94),
          init,
          arcAngle,
          false,
          complete);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

  //TODO: Regal design system
  Color getStrokeColor() {
    return canTakePhoto ? Colors.green : const Color(0xffD2DDF1);
  }
}
