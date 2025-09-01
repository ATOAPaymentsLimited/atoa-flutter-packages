import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ledger_design_system/ledger_design_system.dart';

class LedgerLinearProgressIndicator extends StatelessWidget {
  const LedgerLinearProgressIndicator({
    super.key,
    this.width,
    this.height,
    this.borderRadius,
    this.linearGradient,
    this.borderColor,
    this.shouldClipLeft = true,
    required this.value,
    this.backgroundColor,
    this.showBorder = true,
  }) : assert(value >= 0 && value <= 1.0, 'value should be between 0 and 1');

  final double? width;
  final double? height;
  final double value;
  final bool shouldClipLeft;
  final BorderRadiusGeometry? borderRadius;
  final LinearGradient? linearGradient;
  final Color? borderColor;
  final Color? backgroundColor;
  final bool showBorder;

  @override
  Widget build(BuildContext context) {
    final finalWidth = width ?? 340.sp;
    return SizedBox(
      width: finalWidth,
      height: height ?? 12.sp,
      child: Stack(
        children: [
          Container(
            width: finalWidth,
            height: height,
            decoration: BoxDecoration(
              color: backgroundColor ?? Colors.white,
              borderRadius: borderRadius ?? BorderRadius.circular(6.r),
              border: showBorder
                  ? Border.all(
                      color: borderColor ?? context.grey.shade400,
                    )
                  : null,
            ),
          ),
          ClipRRect(
            clipper: _Clipper(
              fraction: value,
              radius: 6.r,
              shouldClipLeft: shouldClipLeft,
            ),
            child: Container(
              width: finalWidth,
              height: height,
              decoration: BoxDecoration(
                borderRadius: borderRadius ?? BorderRadius.circular(6.r),
                gradient: linearGradient ??
                    LinearGradient(
                      colors: [
                        LedgerColors.lightColors.semantic.info.darker,
                        LedgerColors.lightColors.semantic.notice.defaultColor,
                      ],
                    ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _Clipper extends CustomClipper<RRect> {
  _Clipper({
    required this.fraction,
    required this.radius,
    this.shouldClipLeft = true,
  });

  final double fraction;
  final double radius;
  final bool shouldClipLeft;

  @override
  bool shouldReclip(CustomClipper<RRect> oldClipper) => true;

  @override
  RRect getClip(Size size) => shouldClipLeft
      ? RRect.fromLTRBAndCorners(
          0,
          0,
          size.width * fraction,
          size.height,
          topRight: Radius.circular(radius),
          bottomRight: Radius.circular(radius),
        )
      : RRect.fromLTRBR(
          0,
          0,
          size.width * fraction,
          size.height,
          Radius.circular(radius),
        );
}
