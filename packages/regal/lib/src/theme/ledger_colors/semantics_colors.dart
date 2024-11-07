import 'package:flutter/material.dart';
import 'package:regal/src/theme/ledger_colors/ledger_color_system.dart';
import 'package:regal/src/theme/ledger_colors/ledger_colors.dart';

extension LedgerColorX on BuildContext {
  ThemeData get _theme => Theme.of(this);
  LedgerColorsX get _ledgerColorsX => _theme.extension<LedgerColorsX>()!;
  SemanticsColors get _semantics => _ledgerColorsX.semantic;
  ErrorColor get error => _semantics.error;
  InfoColor get info => _semantics.info;
  NegativeColor get negative => _semantics.negative;
  PositiveColor get positive => _semantics.positive;
  NoticeColor get notice => _semantics.notice;
  BaseColors get baseColors => _ledgerColorsX.base;
  IntactColors get intactColors => _ledgerColorsX.intact;
  BackgroundColors get backgroundColors => _ledgerColorsX.background;
  NeutralColors get neutralColors => _ledgerColorsX.neutral;
  BrandColors get brandColors => _ledgerColorsX.brand;
}

/// These are the main neutral, brand and semantic colors that make up the majority of the colors used in the design system and components.
class SemanticsColors {
  SemanticsColors.dark()
      : error = ErrorColor(isDark: true),
        notice = NoticeColor(isDark: true),
        negative = NegativeColor(isDark: true),
        positive = PositiveColor(isDark: true),
        info = InfoColor(isDark: true);

  SemanticsColors.light()
      : error = ErrorColor(),
        notice = NoticeColor(),
        negative = NegativeColor(),
        positive = PositiveColor(),
        info = InfoColor();
  final ErrorColor error;
  final NoticeColor notice;
  final NegativeColor negative;
  final PositiveColor positive;
  final InfoColor info;

  static SemanticsColors lerp(SemanticsColors semantic, SemanticsColors semantic2, double t) => semantic;
}

/// Error colors are used across error states and in "destructive" actions. They communicate a destructive/negative action, such as removing a user from your team.
class ErrorColor extends LedgerSemanticColorSystem {
  ErrorColor({this.isDark = false});
  final bool isDark;
  @override
  Color get subtle => isDark ? const Color(0xFF32170C) : const Color(0xFFFFF1EB);

  @override
  Color get lighter => isDark ? const Color(0xFF47291D) : const Color(0xFFF8D3C5);

  @override
  Color get defaultColor => isDark ? const Color(0xFFD46940) : const Color(0xFFE97244);

  @override
  Color get darker => isDark ? const Color(0xFFF6B39A) : const Color(0xFFBC5A34);

  @override
  Color get deep => isDark ? const Color(0xFFF5CFC0) : const Color(0xFF62301D);
}

/// Notice colors can communicate that an action is potentially destructive or "on-hold". These colors are commonly used in confirmations to grab the users' attention.
class NoticeColor extends LedgerSemanticColorSystem {
  NoticeColor({this.isDark = false});
  final bool isDark;
  @override
  Color get subtle => isDark ? const Color(0xFF2C210A) : const Color(0xFFFFF8E9);

  @override
  Color get lighter => isDark ? const Color(0xFF4A3B1D) : const Color(0xFFF4E9D0);

  @override
  Color get defaultColor => isDark ? const Color(0xFFD29F3C) : const Color(0xFFE6AE40);

  @override
  Color get darker => isDark ? const Color(0xFFE3CA98) : const Color(0xFFBD871A);

  @override
  Color get deep => isDark ? const Color(0xFFFFEFCF) : const Color(0xFF71500F);
}

/// Negative colors can communicate that an action is potentially destructive or "on-hold". These colors are commonly used in confirmations to grab the users' attention.
class NegativeColor extends LedgerSemanticColorSystem {
  NegativeColor({this.isDark = false});
  final bool isDark;
  @override
  Color get subtle => isDark ? const Color(0xFF331312) : const Color(0xFFFFF4F4);

  @override
  Color get lighter => isDark ? const Color(0xFF4C1C1C) : const Color(0xFFF8E0E0);

  @override
  Color get defaultColor => isDark ? const Color(0xFFD84646) : const Color(0xFFED4A4A);

  @override
  Color get darker => isDark ? const Color(0xFFF8A5A5) : const Color(0xFFCC100F);

  @override
  Color get deep => isDark ? const Color(0xFFFFD2D2) : const Color(0xFF760908);
}

/// Positive colors communicate a positive action, positive trend, or a successful confirmation. If you're using green as your primary color, it can be helpful to introduce a different hue for your success green.
class PositiveColor extends LedgerSemanticColorSystem {
  PositiveColor({this.isDark = false});
  final bool isDark;
  @override
  Color get subtle => isDark ? const Color(0xFF0D241C) : const Color(0xFFEAFAF4);

  @override
  Color get lighter => isDark ? const Color(0xFF1D382F) : const Color(0xFFD5F1E7);

  @override
  Color get defaultColor => isDark ? const Color(0xFF3B9F7E) : const Color(0xFF43BF95);

  @override
  Color get darker => isDark ? const Color(0xFF78C9AC) : const Color(0xFF2A7E62);

  @override
  Color get deep => isDark ? const Color(0xFFBDD3CA) : const Color(0xFF1E5B47);
}

/// Error colors are used across error states and in "destructive" actions. They communicate a destructive/negative action, such as removing a user from your team.
class InfoColor extends LedgerSemanticColorSystem {
  InfoColor({this.isDark = false});
  final bool isDark;
  @override
  Color get subtle => isDark ? const Color(0xFF1C2335) : const Color(0xFFF1F6FF);

  @override
  Color get lighter => isDark ? const Color(0xFF222C4C) : const Color(0xFFE1E8F6);

  @override
  Color get defaultColor => isDark ? const Color(0xFF436BCE) : const Color(0xFF4673E6);

  @override
  Color get darker => isDark ? const Color(0xFF97AEEB) : const Color(0xFF2B53B6);

  @override
  Color get deep => isDark ? const Color(0xFFB4C7F8) : const Color(0xFF133282);
}
