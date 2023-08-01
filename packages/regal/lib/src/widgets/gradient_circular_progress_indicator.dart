import 'dart:math';

import 'package:flutter/material.dart';

class GradientCircularProgressIndicator extends StatefulWidget {
  /// [GradientCircularProgressIndicator] is a custom circular progress
  /// indicator with rounded capped stroke, and a gradient effect
  ///
  /// Parameters :- [radius] defines the radius of canvas circle, [strokeWidth]
  /// defines width of stroke of progress indicator, [gradientColor] defines
  /// color use to create gradient effect.
  const GradientCircularProgressIndicator({
    super.key,
    this.radius = 24,
    this.gradientColor,
    this.strokeWidth = 4.0,
  });

  /// [radius] use to define the circular area to draw progress indicator
  final double radius;

  /// [gradientColor] takes single colors, and uses a combination of opacity
  /// internally to create perfect gradient while animating progress
  /// indicator
  final Color? gradientColor;

  /// [strokeWidth] defines the width of the stroke of the progress indicator
  final double strokeWidth;

  @override
  State<GradientCircularProgressIndicator> createState() =>
      _GradientCircularProgressIndicatorState();
}

class _GradientCircularProgressIndicatorState
    extends State<GradientCircularProgressIndicator>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    _animationController
      ..addListener(() => setState(() {}))
      ..repeat();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final color = widget.gradientColor ?? Theme.of(context).primaryColor;
    return RotationTransition(
      turns: Tween(
        begin: 0.toDouble(),
        end: 1.toDouble(),
      ).animate(_animationController),
      child: CustomPaint(
        size: Size.fromRadius(widget.radius),
        painter: GradientCircularProgressPainter(
          radius: widget.radius,
          gradientColors: [
            Colors.white.withOpacity(0),
            color.withOpacity(0.1),
            color.withOpacity(0.9),
            color,
          ],
          strokeWidth: widget.strokeWidth,
        ),
      ),
    );
  }
}

class GradientCircularProgressPainter extends CustomPainter {
  GradientCircularProgressPainter({
    required this.radius,
    required this.gradientColors,
    required this.strokeWidth,
  });
  final double radius;
  final List<Color> gradientColors;
  final double strokeWidth;

  @override
  void paint(Canvas canvas, Size size) {
    final size = Size.fromRadius(radius);
    final offset = strokeWidth / 2;
    final rect = Offset(offset, offset) &
        Size(size.width - strokeWidth, size.height - strokeWidth);
    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round
      ..shader = SweepGradient(
        colors: gradientColors,
        startAngle: _degreeToRad(40),
        endAngle: _degreeToRad(40 + 360.0),
      ).createShader(rect);

    final startAngle = _degreeToRad(40);
    final sweepAngle = _degreeToRad(68 / 100 * 360);

    canvas.drawArc(rect, startAngle, sweepAngle, false, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;

  double _degreeToRad(double degree) => degree * pi / 180;
}
