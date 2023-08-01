import 'package:flutter/material.dart';

@immutable
class GreyX extends ThemeExtension<GreyX> {
  const GreyX({
    required this.shade05,
    required this.shade10,
    required this.shade20,
    required this.shade40,
    required this.shade60,
    required this.shade80,
  });

  final Color shade05;
  final Color shade10;
  final Color shade20;
  final Color shade40;
  final Color shade60;
  final Color shade80;

  @override
  ThemeExtension<GreyX> copyWith({
    Color? shade05,
    Color? shade10,
    Color? shade20,
    Color? shade40,
    Color? shade60,
    Color? shade80,
  }) =>
      GreyX(
        shade05: shade05 ?? this.shade05,
        shade10: shade10 ?? this.shade10,
        shade20: shade20 ?? this.shade20,
        shade40: shade40 ?? this.shade40,
        shade60: shade60 ?? this.shade60,
        shade80: shade80 ?? this.shade80,
      );

  @override
  ThemeExtension<GreyX> lerp(
    covariant ThemeExtension<GreyX>? other,
    double t,
  ) {
    if (other is! GreyX) {
      return this;
    }

    return GreyX(
      shade05: Color.lerp(shade05, other.shade05, t)!,
      shade10: Color.lerp(shade10, other.shade10, t)!,
      shade20: Color.lerp(shade20, other.shade20, t)!,
      shade40: Color.lerp(shade40, other.shade40, t)!,
      shade60: Color.lerp(shade60, other.shade60, t)!,
      shade80: Color.lerp(shade80, other.shade80, t)!,
    );
  }
}
