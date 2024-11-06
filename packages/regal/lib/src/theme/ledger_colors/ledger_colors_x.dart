import 'package:flutter/material.dart';
import 'package:regal/src/theme/ledger_colors/ledger_color_system.dart';

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

  final Color base;
  final LedgerShadeColorSystem brand;
  final LedgerShadeColorSystem neutral;
  final LedgerSemanticColorSystem semantic;
  final Color background;
  final Color intact;

  @override
  ThemeExtension<LedgerColorsX> copyWith({
    Color? base,
    LedgerShadeColorSystem? brand,
    LedgerShadeColorSystem? neutral,
    LedgerSemanticColorSystem? semantic,
    Color? background,
    Color? intact,
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
      base: Color.lerp(base, other.base, t)!,
      brand: LedgerShadeColorSystem.lerp(brand, other.brand, t)!,
      neutral: LedgerShadeColorSystem.lerp(neutral, other.neutral, t)!,
      semantic: LedgerSemanticColorSystem.lerp(semantic, other.semantic, t)!,
      background: Color.lerp(background, other.background, t)!,
      intact: Color.lerp(intact, other.intact, t)!,
    );
  }
}
