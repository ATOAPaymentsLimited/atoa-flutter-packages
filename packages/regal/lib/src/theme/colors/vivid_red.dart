// ignore_for_file: avoid_unused_constructor_parameters, avoid_positional_boolean_parameters

import 'package:flutter/painting.dart';
import 'package:regal/regal.dart';

class VividRed extends ColorSystem {
  const VividRed([this.isDark = false]) : super(0xFFE42646);

  final bool isDark;

  Color get tint05 => isDark ? _shade40 : _tint05;
  Color get tint10 => isDark ? _shade60 : _tint10;
  Color get tint20 => isDark ? _shade60 : _tint20;

  @override
  Color get shade40 => isDark ? _tint05 : _shade40;
  @override
  Color get shade60 => isDark ? _tint10 : _shade60;
  @override
  Color get shade80 => isDark ? _tint20 : _shade80;

  static const _tint05 = Color(0xFFFEF4F6);
  static const _tint10 = Color(0xFFFCE9EC);
  static const _tint20 = Color(0xFFFAD4DA);

  static const _shade40 = Color(0xFF5B0F1C);
  static const _shade60 = Color(0xFF89172A);
  static const _shade80 = Color(0xFFB61E38);

  @override
  Color get shade10 => throw UnimplementedError();
  @override
  Color get shade20 => throw UnimplementedError();
  @override
  Color get shade05 => throw UnimplementedError();
}
