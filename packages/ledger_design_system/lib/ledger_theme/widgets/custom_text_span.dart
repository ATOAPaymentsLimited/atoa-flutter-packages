import 'package:flutter/material.dart';

class CustomTextSpan extends TextSpan {
  const CustomTextSpan.semantics({
    super.text,
    super.children,
    super.style,
    super.recognizer,
    super.mouseCursor,
    super.onEnter,
    super.onExit,
    super.locale,
    super.spellOut,
  }) : super(semanticsLabel: text);
}
