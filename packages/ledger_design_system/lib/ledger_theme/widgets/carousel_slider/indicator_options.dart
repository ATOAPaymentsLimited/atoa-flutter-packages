import 'package:flutter/widgets.dart';

class IndicatorOptions {
  const IndicatorOptions({
    this.activeSize = 6.0,
    this.inactiveSize = 4.0,
    this.activeColor,
    this.inactiveColor,
    this.margin = const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
    this.animationDuration = const Duration(milliseconds: 300),
  });

  /// Size of the indicator when active
  final double activeSize;

  /// Size of the indicator when inactive
  final double inactiveSize;

  /// Color of the indicator when active
  final Color? activeColor;

  /// Color of the indicator when inactive
  final Color? inactiveColor;

  /// Margin beween indicator
  final EdgeInsets margin;

  /// Animation duration when transitioning between indicators.
  final Duration animationDuration;
}
