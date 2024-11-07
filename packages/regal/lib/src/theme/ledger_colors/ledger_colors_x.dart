import 'package:flutter/material.dart';
import 'package:regal/src/theme/ledger_colors/ledger_colors.dart';
import 'package:regal/src/theme/ledger_colors/shade_colors.dart' show BrandColors, NeutralColors;

@immutable
class LedgerColorsX extends ThemeExtension<LedgerColorsX> {
  const LedgerColorsX({
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
  ThemeExtension<LedgerColorsX> copyWith({
    BaseColors? base,
    BrandColors? brand,
    NeutralColors? neutral,
    SemanticsColors? semantic,
    BackgroundColors? background,
    IntactColors? intact,
  }) =>
      LedgerColorsX(
        base: base ?? this.base,
        brand: brand ?? this.brand,
        background: background ?? this.background,
        intact: intact ?? this.intact,
        neutral: neutral ?? this.neutral,
        semantic: semantic ?? this.semantic,
      );

  @override
  ThemeExtension<LedgerColorsX> lerp(
    covariant ThemeExtension<LedgerColorsX>? other,
    double t,
  ) {
    if (other is! LedgerColorsX) {
      return this;
    }

    return LedgerColorsX(
      base: BaseColors.lerp(base, other.base, t),
      brand: BrandColors.lerp(brand, other.brand, t),
      neutral: NeutralColors.lerp(neutral, other.neutral, t),
      semantic: SemanticsColors.lerp(semantic, other.semantic, t),
      background: BackgroundColors.lerp(background, other.background, t),
      intact: IntactColors.lerp(intact, other.intact, t),
    );
  }
}
