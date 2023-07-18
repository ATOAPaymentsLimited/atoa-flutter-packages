import 'package:flutter/material.dart';

@immutable
class RegalColorsX extends ThemeExtension<RegalColorsX> {
  const RegalColorsX({
    required this.vividRed,
    required this.claretRed,
    required this.snowWhite,
    required this.licoriceBlack,
  });

  final Color vividRed;
  final Color claretRed;
  final Color snowWhite;
  final Color licoriceBlack;


  @override
  ThemeExtension<RegalColorsX> copyWith({
    Color? vividRed,
    Color? claretRed,
    Color? snowWhite,
    Color? licoriceBlack,
  }) =>
      RegalColorsX(
        vividRed: vividRed ?? this.vividRed,
        claretRed: claretRed ?? this.claretRed,
        snowWhite: snowWhite ?? this.snowWhite,
        licoriceBlack: licoriceBlack ?? this.licoriceBlack,
      );

  @override
  ThemeExtension<RegalColorsX> lerp(
    covariant ThemeExtension<RegalColorsX>? other,
    double t,
  ) {
    if (other is! RegalColorsX) {
      return this;
    }

    return RegalColorsX(
      vividRed: Color.lerp(vividRed, other.vividRed, t)!,
      claretRed: Color.lerp(claretRed, other.claretRed, t)!,
      snowWhite: Color.lerp(snowWhite, other.snowWhite, t)!,
      licoriceBlack: Color.lerp(licoriceBlack, other.licoriceBlack, t)!,
    );
  }
}
