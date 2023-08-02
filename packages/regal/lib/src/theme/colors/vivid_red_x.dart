import 'package:flutter/material.dart';

@immutable
class VividRedX extends ThemeExtension<VividRedX> {
  const VividRedX({
    required this.tint05,
    required this.tint10,
    required this.tint20,
    required this.shade40,
    required this.shade60,
    required this.shade80,
  });

  final Color tint05;
  final Color tint10;
  final Color tint20;
  final Color shade40;
  final Color shade60;
  final Color shade80;

  @override
  ThemeExtension<VividRedX> copyWith({
    Color? tint05,
    Color? tint10,
    Color? tint20,
    Color? shade40,
    Color? shade60,
    Color? shade80,
  }) =>
      VividRedX(
        tint05: tint05 ?? this.tint05,
        tint10: tint10 ?? this.tint10,
        tint20: tint20 ?? this.tint20,
        shade40: shade40 ?? this.shade40,
        shade60: shade60 ?? this.shade60,
        shade80: shade80 ?? this.shade80,
      );

  @override
  ThemeExtension<VividRedX> lerp(
    covariant ThemeExtension<VividRedX>? other,
    double t,
  ) {
    if (other is! VividRedX) {
      return this;
    }

    return VividRedX(
      tint05: Color.lerp(tint05, other.tint05, t)!,
      tint10: Color.lerp(tint10, other.tint10, t)!,
      tint20: Color.lerp(tint20, other.tint20, t)!,
      shade40: Color.lerp(shade40, other.shade40, t)!,
      shade60: Color.lerp(shade60, other.shade60, t)!,
      shade80: Color.lerp(shade80, other.shade80, t)!,
    );
  }
}
