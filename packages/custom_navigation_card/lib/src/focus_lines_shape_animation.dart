import 'dart:math';
import 'package:flutter/material.dart';
import 'dart:ui' as ui;

import 'colors.dart';

class CustomFocusLinesShapeAnimation extends StatefulWidget {
  final double height;
  final double width;
  final double scaleLines;
  final BorderRadius? borderRadius;
  final Color gradientColor;
  final Duration animationDuration;

  const CustomFocusLinesShapeAnimation({
    super.key,
    required this.height,
    required this.width,
    this.scaleLines = 2,
    this.borderRadius = BorderRadius.zero,
    this.gradientColor = CustomColors.lightBeige3,
    this.animationDuration = const Duration(milliseconds: 24000),
  });

  @override
  State<CustomFocusLinesShapeAnimation> createState() =>
      _CustomFocusLinesShapeAnimationState();
}

class _CustomFocusLinesShapeAnimationState
    extends State<CustomFocusLinesShapeAnimation>
    with TickerProviderStateMixin {
  late AnimationController _rotationAnimationController;

  @override
  void initState() {
    super.initState();
    _rotationAnimationController = AnimationController(
      vsync: this,
      duration: widget.animationDuration,
      value: 0,
      lowerBound: 0,
      upperBound: 2 * pi,
    );

    _rotationAnimationController.repeat();
  }

  @override
  void dispose() {
    _rotationAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: widget.borderRadius,
      child: SizedBox(
        width: widget.width,
        height: widget.height,
        child: Stack(
          children: [
            Center(
              child: Transform.scale(
                scale: widget.scaleLines,
                child: AnimatedBuilder(
                  animation: _rotationAnimationController,
                  builder: (context, child) {
                    return Transform.rotate(
                      angle: _rotationAnimationController.value,
                      child: CustomPaint(
                        size: Size(widget.width, widget.width),
                        painter: FocusLinesShapePainter(
                          gradientColor: widget.gradientColor,
                        ),
                      ),
                    );
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class FocusLinesShapePainter extends CustomPainter {
  final Color gradientColor;

  const FocusLinesShapePainter({required this.gradientColor});

  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(size.width * 0.4000160, 0);
    path_0.lineTo(size.width * 0.6000160, 0);
    path_0.lineTo(size.width * 0.5250160, size.height * 0.4000000);
    path_0.lineTo(size.width * 0.4750160, size.height * 0.4000000);
    path_0.lineTo(size.width * 0.4000160, 0);
    path_0.close();

    Paint paint0Fill = Paint()..style = PaintingStyle.fill;
    paint0Fill.shader = ui.Gradient.linear(
        Offset(size.width * 0.5000160, 0),
        Offset(size.width * 0.5000160, size.height * 0.4000000),
        [gradientColor.withOpacity(1), gradientColor.withOpacity(0)],
        [0, 1]);
    canvas.drawPath(path_0, paint0Fill);

    Path path_1 = Path();
    path_1.moveTo(size.width * 0.07500000, size.height * 0.2164063);
    path_1.lineTo(size.width * 0.2164215, size.height * 0.07498472);
    path_1.lineTo(size.width * 0.4462313, size.height * 0.4108604);
    path_1.lineTo(size.width * 0.4108757, size.height * 0.4462160);
    path_1.lineTo(size.width * 0.07500000, size.height * 0.2164063);
    path_1.close();

    Paint paint1Fill = Paint()..style = PaintingStyle.fill;
    paint1Fill.shader = ui.Gradient.linear(
        Offset(size.width * 0.1457104, size.height * 0.1456958),
        Offset(size.width * 0.4285535, size.height * 0.4285382),
        [gradientColor.withOpacity(1), gradientColor.withOpacity(0)],
        [0, 1]);
    canvas.drawPath(path_1, paint1Fill);

    Path path_2 = Path();
    path_2.moveTo(size.width * 0.9242500, size.height * 0.2164063);
    path_2.lineTo(size.width * 0.7828333, size.height * 0.07498472);
    path_2.lineTo(size.width * 0.5530201, size.height * 0.4108604);
    path_2.lineTo(size.width * 0.5883757, size.height * 0.4462160);
    path_2.lineTo(size.width * 0.9242500, size.height * 0.2164063);
    path_2.close();

    Paint paint2Fill = Paint()..style = PaintingStyle.fill;
    paint2Fill.shader = ui.Gradient.linear(
        Offset(size.width * 0.8535417, size.height * 0.1456958),
        Offset(size.width * 0.5706979, size.height * 0.4285382),
        [gradientColor.withOpacity(1), gradientColor.withOpacity(0)],
        [0, 1]);
    canvas.drawPath(path_2, paint2Fill);

    Path path_3 = Path();
    path_3.moveTo(size.width * 0.07500000, size.height * 0.7828750);
    path_3.lineTo(size.width * 0.2164215, size.height * 0.9242986);
    path_3.lineTo(size.width * 0.4462313, size.height * 0.5884236);
    path_3.lineTo(size.width * 0.4108757, size.height * 0.5530681);
    path_3.lineTo(size.width * 0.07500000, size.height * 0.7828750);
    path_3.close();

    Paint paint3Fill = Paint()..style = PaintingStyle.fill;
    paint3Fill.shader = ui.Gradient.linear(
        Offset(size.width * 0.1457104, size.height * 0.8535903),
        Offset(size.width * 0.4285535, size.height * 0.5707458),
        [gradientColor.withOpacity(1), gradientColor.withOpacity(0)],
        [0, 1]);
    canvas.drawPath(path_3, paint3Fill);

    Path path_4 = Path();
    path_4.moveTo(size.width * 0.9242500, size.height * 0.7828750);
    path_4.lineTo(size.width * 0.7828333, size.height * 0.9242986);
    path_4.lineTo(size.width * 0.5530201, size.height * 0.5884236);
    path_4.lineTo(size.width * 0.5883757, size.height * 0.5530681);
    path_4.lineTo(size.width * 0.9242500, size.height * 0.7828750);
    path_4.close();

    Paint paint4Fill = Paint()..style = PaintingStyle.fill;
    paint4Fill.shader = ui.Gradient.linear(
        Offset(size.width * 0.8535417, size.height * 0.8535903),
        Offset(size.width * 0.5706979, size.height * 0.5707458),
        [gradientColor.withOpacity(1), gradientColor.withOpacity(0)],
        [0, 1]);
    canvas.drawPath(path_4, paint4Fill);

    Path path_5 = Path();
    path_5.moveTo(size.width, size.height * 0.3999347);
    path_5.lineTo(size.width, size.height * 0.5999347);
    path_5.lineTo(size.width * 0.6000000, size.height * 0.5249347);
    path_5.lineTo(size.width * 0.6000000, size.height * 0.4749347);
    path_5.lineTo(size.width, size.height * 0.3999347);
    path_5.close();

    Paint paint5Fill = Paint()..style = PaintingStyle.fill;
    paint5Fill.shader = ui.Gradient.linear(
        Offset(size.width, size.height * 0.4999347),
        Offset(size.width * 0.6000000, size.height * 0.4999347),
        [gradientColor.withOpacity(1), gradientColor.withOpacity(0)],
        [0, 1]);
    canvas.drawPath(path_5, paint5Fill);

    Path path_6 = Path();
    path_6.moveTo(0, size.height * 0.6000653);
    path_6.lineTo(size.width * 0.0, size.height * 0.3861111);
    path_6.lineTo(size.width * 0.4000653, size.height * 0.4850653);
    path_6.lineTo(size.width * 0.4000000, size.height * 0.4750653);
    path_6.lineTo(size.width * 0.4000000, size.height * 0.5250653);
    path_6.lineTo(0, size.height * 0.6000653);
    path_6.close();

    Paint paint6Fill = Paint()..style = PaintingStyle.fill;
    paint6Fill.shader = ui.Gradient.linear(
        Offset(size.width * 1.192486e-7, size.height * 0.5000653),
        Offset(size.width * 0.4000000, size.height * 0.5000653),
        [gradientColor.withOpacity(1), gradientColor.withOpacity(0)],
        [0, 1]);
    canvas.drawPath(path_6, paint6Fill);

    Path path_7 = Path();
    path_7.moveTo(size.width * 0.5999833, size.height);
    path_7.lineTo(size.width * 0.3999833, size.height);
    path_7.lineTo(size.width * 0.4749840, size.height * 0.6000000);
    path_7.lineTo(size.width * 0.5249840, size.height * 0.6000000);
    path_7.lineTo(size.width * 0.5999833, size.height);
    path_7.close();

    Paint paint7Fill = Paint()..style = PaintingStyle.fill;
    paint7Fill.shader = ui.Gradient.linear(
        Offset(size.width * 0.4999833, size.height),
        Offset(size.width * 0.4999840, size.height * 0.6000000),
        [gradientColor.withOpacity(1), gradientColor.withOpacity(0)],
        [0, 1]);
    canvas.drawPath(path_7, paint7Fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
