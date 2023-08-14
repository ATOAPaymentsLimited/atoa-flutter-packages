import 'package:flutter/material.dart';

extension TextStyleExtension on TextStyle {
  TextStyle get height130 => copyWith(height: 1.3);
  TextStyle get height150 => copyWith(height: 1.5);

  TextStyle get w400 => copyWith(fontWeight: FontWeight.w400);
  TextStyle get w600 => copyWith(fontWeight: FontWeight.w600);
  TextStyle get w700 => copyWith(fontWeight: FontWeight.w700);

  TextStyle size(double value) => copyWith(fontSize: value);
}
