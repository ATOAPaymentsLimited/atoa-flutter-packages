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
  }) : super(semanticsLabel: data);

  @override
  Widget build(BuildContext context) => Semantics(
        container: true,
        child: super.build(context),
      );
}
