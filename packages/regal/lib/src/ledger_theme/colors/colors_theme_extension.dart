import 'package:flutter/material.dart';

import 'package:regal/src/ledger_theme/colors/base_colors.dart';
import 'package:regal/src/ledger_theme/colors/semantics_colors.dart';
import 'package:regal/src/ledger_theme/colors/shade_colors.dart';

@immutable
class ColorsThemeExtension extends ThemeExtension<ColorsThemeExtension> {
  const ColorsThemeExtension({
    required this.base,
    required this.brand,
    required this.neutral,
    required this.semantic,
    required this.background,
    required this.intact,
  });

  final BaseColors base;
  final BrandColors brand;
  final NeutralColors neutral;
  final SemanticsColors semantic;
  final BackgroundColors background;
  final IntactColors intact;

  @override
  ThemeExtension<ColorsThemeExtension> copyWith({
    BaseColors? base,
    BrandColors? brand,
    NeutralColors? neutral,
    SemanticsColors? semantic,
    BackgroundColors? background,
    IntactColors? intact,
  }) =>
      ColorsThemeExtension(
        base: base ?? this.base,
        brand: brand ?? this.brand,
        background: background ?? this.background,
        intact: intact ?? this.intact,
        neutral: neutral ?? this.neutral,
        semantic: semantic ?? this.semantic,
      );

  @override
  ThemeExtension<ColorsThemeExtension> lerp(
    covariant ThemeExtension<ColorsThemeExtension>? other,
    double t,
  ) {
    if (other is! ColorsThemeExtension) return this;
    return ColorsThemeExtension(
      base: base.lerp(other.base, t),
      brand: brand.lerp(other.brand, t),
      neutral: neutral.lerp(other.neutral, t),
      semantic: semantic.lerp(other.semantic, t),
      background: background.lerp(other.background, t),
      intact: intact.lerp(other.intact, t),
    );
  }
}
