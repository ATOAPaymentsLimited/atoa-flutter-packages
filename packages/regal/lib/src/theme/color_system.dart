import 'package:flutter/painting.dart';

abstract class ColorSystem extends Color {
  const ColorSystem(super.value);

  Color get shade100 => this;
  Color get shade80;
  Color get shade60;
  Color get shade40;
  Color get shade20;
  Color get shade10;
  Color get shade5;
}
