import 'package:flutter/material.dart';

/// CustomText that has [semanticsLabel] the same as the [data]
class CustomText extends Text {
  const CustomText.semantics(
    super.data, {
    super.key,
    super.style,
    super.strutStyle,
    super.textAlign,
    super.textDirection,
    super.locale,
    super.softWrap,
    super.overflow,
    super.textScaleFactor,
    super.maxLines,
    super.textWidthBasis,
    super.textHeightBehavior,
    super.selectionColor,
    this.gradient,
    this.identifier,
  }) : super(semanticsLabel: data);

  final Gradient? gradient;

  final String? identifier;

  @override
  Widget build(BuildContext context) => Semantics(
        container: true,
        identifier: identifier ?? data,
        child: Builder(
          builder: (context) => gradient != null
              ? ShaderMask(
                  blendMode: BlendMode.srcIn,
                  shaderCallback: (Rect bounds) => gradient!.createShader(
                    Rect.fromLTWH(0, 0, bounds.width, bounds.height),
                  ),
                  child: super.build(context),
                )
              : super.build(context),
        ),
      );
}
