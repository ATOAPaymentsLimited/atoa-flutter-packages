import 'package:flutter/material.dart';

extension TextStyleExtension on TextStyle {
  TextStyle get height011 => copyWith(height: 0.11);
  TextStyle get height012 => copyWith(height: 0.12);
  TextStyle get height130 => copyWith(height: 1.3);
  TextStyle get height140 => copyWith(height: 1.4);
  TextStyle get height145 => copyWith(height: 1.45);
  TextStyle get height150 => copyWith(height: 1.5);
  TextStyle get height160 => copyWith(height: 1.6);

  TextStyle get w300 => copyWith(fontWeight: FontWeight.w300);
  TextStyle get w400 => copyWith(fontWeight: FontWeight.w400);
  TextStyle get w600 => copyWith(fontWeight: FontWeight.w600);
  TextStyle get w700 => copyWith(fontWeight: FontWeight.w700);

  TextStyle size(double value) => copyWith(fontSize: value);
  TextStyle textColor(Color value) => copyWith(color: value);
}
