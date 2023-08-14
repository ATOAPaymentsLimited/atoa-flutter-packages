import 'package:flutter/material.dart';

extension WidgetExtension on Widget {
  Widget padding(EdgeInsets value, {bool condition = true}) =>
      condition ? Padding(padding: value, child: this) : this;

  Widget expanded({int flex = 1, bool condition = true}) =>
      condition ? Expanded(flex: flex, child: this) : this;

  
}
