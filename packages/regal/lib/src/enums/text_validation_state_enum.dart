import 'package:flutter/material.dart';
import 'package:regal/regal.dart';

enum TextValidationState {
  none,
  typing,
  invalid;

  bool get isNone => this == none;

  Color get labelColor =>
      this == invalid ? RegalColors.brightOrange : RegalColors.grey.shade40;

  Color get suffixColor => this == none
      ? Colors.transparent
      : this == invalid
          ? RegalColors.brightOrange
          : RegalColors.grey.shade40;

  IconData get iconData =>
      this == invalid ? Icons.error_outline : Icons.cancel_outlined;
}
