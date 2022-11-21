import 'dart:math';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:regal/regal.dart';

class CustomFocusLinesShapeAnimation extends StatefulWidget {
  const CustomFocusLinesShapeAnimation({
    super.key,
    required this.height,
    required this.width,
    this.scaleLines = 2,
    this.borderRadius = BorderRadius.zero,
    this.gradientColor,
    this.animationDuration = const Duration(milliseconds: 24000),
  });
  final double height;
  final double width;
  final double scaleLines;
  final BorderRadius? borderRadius;
  final Color? gradientColor;
  final Duration animationDuration;

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
  Widget build(BuildContext context) => ClipRRect(
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
                    builder: (context, child) => Transform.rotate(
                      angle: _rotationAnimationController.value,
                      child: CustomPaint(
                        size: Size.square(widget.width),
                        painter: _FocusLinesShapePainter(
                          gradientColor:
                              widget.gradientColor ?? RegalColors.gold.shade60,
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      );
}

class _FocusLinesShapePainter extends CustomPainter {
  const _FocusLinesShapePainter({required this.gradientColor});
  final Color gradientColor;

  @override
  void paint(Canvas canvas, Size size) {
    final path_0 = Path()
      ..moveTo(size.width * 0.4000160, 0)
      ..lineTo(size.width * 0.6000160, 0)
      ..lineTo(size.width * 0.5250160, size.height * 0.4000000)
      ..lineTo(size.width * 0.4750160, size.height * 0.4000000)
      ..lineTo(size.width * 0.4000160, 0)
      ..close();

    final paint0Fill = Paint()
      ..style = PaintingStyle.fill
      ..shader = ui.Gradient.linear(
        Offset(size.width * 0.5000160, 0),
        Offset(size.width * 0.5000160, size.height * 0.4000000),
        [gradientColor.withOpacity(1), gradientColor.withOpacity(0)],
        [0, 1],
      );
    canvas.drawPath(path_0, paint0Fill);

    final path_1 = Path()
      ..moveTo(size.width * 0.07500000, size.height * 0.2164063)
      ..lineTo(size.width * 0.2164215, size.height * 0.07498472)
      ..lineTo(size.width * 0.4462313, size.height * 0.4108604)
      ..lineTo(size.width * 0.4108757, size.height * 0.4462160)
      ..lineTo(size.width * 0.07500000, size.height * 0.2164063)
      ..close();

    final paint1Fill = Paint()
      ..style = PaintingStyle.fill
      ..shader = ui.Gradient.linear(
        Offset(size.width * 0.1457104, size.height * 0.1456958),
        Offset(size.width * 0.4285535, size.height * 0.4285382),
        [gradientColor.withOpacity(1), gradientColor.withOpacity(0)],
        [0, 1],
      );
    canvas.drawPath(path_1, paint1Fill);

    final path_2 = Path()
      ..moveTo(size.width * 0.9242500, size.height * 0.2164063)
      ..lineTo(size.width * 0.7828333, size.height * 0.07498472)
      ..lineTo(size.width * 0.5530201, size.height * 0.4108604)
      ..lineTo(size.width * 0.5883757, size.height * 0.4462160)
      ..lineTo(size.width * 0.9242500, size.height * 0.2164063)
      ..close();

    final paint2Fill = Paint()
      ..style = PaintingStyle.fill
      ..shader = ui.Gradient.linear(
        Offset(size.width * 0.8535417, size.height * 0.1456958),
        Offset(size.width * 0.5706979, size.height * 0.4285382),
        [gradientColor.withOpacity(1), gradientColor.withOpacity(0)],
        [0, 1],
      );
    canvas.drawPath(path_2, paint2Fill);

    final path_3 = Path()
      ..moveTo(size.width * 0.07500000, size.height * 0.7828750)
      ..lineTo(size.width * 0.2164215, size.height * 0.9242986)
      ..lineTo(size.width * 0.4462313, size.height * 0.5884236)
      ..lineTo(size.width * 0.4108757, size.height * 0.5530681)
      ..lineTo(size.width * 0.07500000, size.height * 0.7828750)
      ..close();

    final paint3Fill = Paint()
      ..style = PaintingStyle.fill
      ..shader = ui.Gradient.linear(
        Offset(size.width * 0.1457104, size.height * 0.8535903),
        Offset(size.width * 0.4285535, size.height * 0.5707458),
        [gradientColor.withOpacity(1), gradientColor.withOpacity(0)],
        [0, 1],
      );
    canvas.drawPath(path_3, paint3Fill);

    final path_4 = Path()
      ..moveTo(size.width * 0.9242500, size.height * 0.7828750)
      ..lineTo(size.width * 0.7828333, size.height * 0.9242986)
      ..lineTo(size.width * 0.5530201, size.height * 0.5884236)
      ..lineTo(size.width * 0.5883757, size.height * 0.5530681)
      ..lineTo(size.width * 0.9242500, size.height * 0.7828750)
      ..close();

    final paint4Fill = Paint()
      ..style = PaintingStyle.fill
      ..shader = ui.Gradient.linear(
        Offset(size.width * 0.8535417, size.height * 0.8535903),
        Offset(size.width * 0.5706979, size.height * 0.5707458),
        [gradientColor.withOpacity(1), gradientColor.withOpacity(0)],
        [0, 1],
      );
    canvas.drawPath(path_4, paint4Fill);

    final path_5 = Path()
      ..moveTo(size.width, size.height * 0.3999347)
      ..lineTo(size.width, size.height * 0.5999347)
      ..lineTo(size.width * 0.6000000, size.height * 0.5249347)
      ..lineTo(size.width * 0.6000000, size.height * 0.4749347)
      ..lineTo(size.width, size.height * 0.3999347)
      ..close();

    final paint5Fill = Paint()
      ..style = PaintingStyle.fill
      ..shader = ui.Gradient.linear(
        Offset(size.width, size.height * 0.4999347),
        Offset(size.width * 0.6000000, size.height * 0.4999347),
        [gradientColor.withOpacity(1), gradientColor.withOpacity(0)],
        [0, 1],
      );
    canvas.drawPath(path_5, paint5Fill);

    final path_6 = Path()
      ..moveTo(0, size.height * 0.6000653)
      ..lineTo(size.width * 0.0, size.height * 0.3861111)
      ..lineTo(size.width * 0.4000653, size.height * 0.4850653)
      ..lineTo(size.width * 0.4000000, size.height * 0.4750653)
      ..lineTo(size.width * 0.4000000, size.height * 0.5250653)
      ..lineTo(0, size.height * 0.6000653)
      ..close();

    final paint6Fill = Paint()
      ..style = PaintingStyle.fill
      ..shader = ui.Gradient.linear(
        Offset(size.width * 1.192486e-7, size.height * 0.5000653),
        Offset(size.width * 0.4000000, size.height * 0.5000653),
        [gradientColor.withOpacity(1), gradientColor.withOpacity(0)],
        [0, 1],
      );
    canvas.drawPath(path_6, paint6Fill);

    final path_7 = Path()
      ..moveTo(size.width * 0.5999833, size.height)
      ..lineTo(size.width * 0.3999833, size.height)
      ..lineTo(size.width * 0.4749840, size.height * 0.6000000)
      ..lineTo(size.width * 0.5249840, size.height * 0.6000000)
      ..lineTo(size.width * 0.5999833, size.height)
      ..close();

    final paint7Fill = Paint()
      ..style = PaintingStyle.fill
      ..shader = ui.Gradient.linear(
        Offset(size.width * 0.4999833, size.height),
        Offset(size.width * 0.4999840, size.height * 0.6000000),
        [gradientColor.withOpacity(1), gradientColor.withOpacity(0)],
        [0, 1],
      );
    canvas.drawPath(path_7, paint7Fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
