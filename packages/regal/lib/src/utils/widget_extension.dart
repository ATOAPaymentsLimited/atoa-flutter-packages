import 'package:flutter/material.dart';

extension WidgetExtension on Widget {
  Widget padding(EdgeInsets value, {bool condition = true}) =>
      condition ? Padding(padding: value, child: this) : this;

  Widget expanded({int flex = 1, bool condition = true}) =>
      condition ? Expanded(flex: flex, child: this) : this;

  Widget disable({
    bool ignoring = true,
    double opacity = 0.5,
  }) =>
      Opacity(
        opacity: ignoring ? opacity : 1,
        child: IgnorePointer(
          ignoring: ignoring,
          child: this,
        ),
      );

  Widget safeArea({bool condition = true}) =>
      condition ? SafeArea(child: this) : this;
}
