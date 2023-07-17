// ignore_for_file: avoid_positional_boolean_parameters

import 'package:flutter/painting.dart';
import 'package:regal/regal.dart';

class Grey extends ColorSystem {
  const Grey([this.isDark = false]) : super(isDark ? 0xFFFFFFFF : 0xFF000000);

  final bool isDark;

  @override
  Color get shade05 => isDark ? _shade80 : _shade05;

  @override
  Color get shade10 => isDark ? _shade60 : _shade10;

  @override
  Color get shade20 => isDark ? _shade40 : _shade20;

  @override
  Color get shade40 => isDark ? _shade20 : _shade40;

  @override
  Color get shade60 => isDark ? _shade10 : _shade60;

  @override
  Color get shade80 => isDark ? _shade05 : _shade80;

  Color get disabled => isDark ? _disabled : _disabled;

  static const _shade05 = Color(0xFFF2F2F2);
  static const _shade10 = Color(0xFFE5E5E5);
  static const _shade20 = Color(0xFFCCCCCC);
  static const _shade40 = Color(0xFF999999);
  static const _shade60 = Color(0xFF666666);
  static const _shade80 = Color(0xFF333333);
  static const _disabled = Color(0xFF79828F);
}
