import 'package:flutter/material.dart';

import 'colors.dart';

class OffersIndicatorOptions {
  /// Size of the indicator when active
  final double activeSize;

  /// Size of the indicator when inactive
  final double inactiveSize;

  /// Color of the indicator when active
  final Color activeColor;

  /// Color of the indicator when inactive
  final Color inactiveColor;

  /// Margin beween indicator
  final EdgeInsets margin;

  /// Animation duration when transitioning between indicators.
  final Duration animationDuration;

  const OffersIndicatorOptions({
    Key? key,
    this.activeSize = 6.0,
    this.inactiveSize = 4.0,
    this.activeColor = CustomColors.navyBlue2,
    this.inactiveColor = Colors.grey,
    this.margin = const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
    this.animationDuration = const Duration(milliseconds: 300),
  });
}
