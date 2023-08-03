import 'package:flutter/material.dart';

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
}
