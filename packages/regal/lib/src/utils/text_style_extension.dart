import 'package:flutter/material.dart';

extension TextStyleExtension on TextStyle {
  TextStyle height(double value) => copyWith(height: value);

  TextStyle weight(FontWeight value) => copyWith(fontWeight: value);

  TextStyle size(double value) => copyWith(fontSize: value);
}
