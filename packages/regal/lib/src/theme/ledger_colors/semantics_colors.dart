import 'package:flutter/material.dart';
import 'package:regal/src/theme/ledger_colors/ledger_colors_x.dart';

import 'ledger_color_system.dart';

extension LedgerColorX on BuildContext {
  ThemeData get _theme => Theme.of(this);
  _ErrorColor get error => _theme.extension<LedgerColorsX>()!.semantic.error;
  _InfoColor get info => _theme.extension<LedgerColorsX>()!.semantic.info;
  _NegativeColor get negative => _theme.extension<LedgerColorsX>()!.semantic.negative;
  _PositiveColor get positive => _theme.extension<LedgerColorsX>()!.semantic.positive;
  _NoticeColor get notice => _theme.extension<LedgerColorsX>()!.semantic.notice;
}

/**
 * These are the main neutral, brand and semantic colors that make up the majority of the colors used in the design system and components.
 */
class SemanticsColors {
  final _ErrorColor error;
  final _NoticeColor notice;
  final _NegativeColor negative;
  final _PositiveColor positive;
  final _InfoColor info;

  SemanticsColors.light()
      : error = _ErrorColor(),
        notice = _NoticeColor(),
        negative = _NegativeColor(),
        positive = _PositiveColor(),
        info = _InfoColor();
  SemanticsColors.dark()
      : error = _ErrorColor(isDark: true),
        notice = _NoticeColor(isDark: true),
        negative = _NegativeColor(isDark: true),
        positive = _PositiveColor(isDark: true),
        info = _InfoColor(isDark: true);

  static lerp(SemanticsColors semantic, SemanticsColors semantic2, double t) {}
}

/**
 * Error colors are used across error states and in "destructive" actions. They communicate a destructive/negative action, such as removing a user from your team.
 */
class _ErrorColor extends LedgerSemanticColorSystem {
  final bool isDark;
  _ErrorColor({this.isDark = false});
  @override
  Color get subtle => isDark ? Color(0xFF32170C) : Color(0xFFFFF1EB);

  @override
  Color get lighter => isDark ? Color(0xFF47291D) : Color(0xFFF8D3C5);

  @override
  Color get defaultColor => isDark ? Color(0xFFD46940) : Color(0xFFE97244);

  @override
  Color get darker => isDark ? Color(0xFFF6B39A) : Color(0xFFBC5A34);

  @override
  Color get deep => isDark ? Color(0xFFF5CFC0) : Color(0xFF62301D);
}

/**
 * Notice colors can communicate that an action is potentially destructive or "on-hold". These colors are commonly used in confirmations to grab the users' attention.
 */
class _NoticeColor extends LedgerSemanticColorSystem {
  final bool isDark;
  _NoticeColor({this.isDark = false});
  @override
  Color get subtle => isDark ? Color(0xFF2C210A) : Color(0xFFFFF8E9);

  @override
  Color get lighter => isDark ? Color(0xFF4A3B1D) : Color(0xFFF4E9D0);

  @override
  Color get defaultColor => isDark ? Color(0xFFD29F3C) : Color(0xFFE6AE40);

  @override
  Color get darker => isDark ? Color(0xFFE3CA98) : Color(0xFFBD871A);

  @override
  Color get deep => isDark ? Color(0xFFFFEFCF) : Color(0xFF71500F);
}

/**
 * Negative colors can communicate that an action is potentially destructive or "on-hold". These colors are commonly used in confirmations to grab the users' attention.
 */
class _NegativeColor extends LedgerSemanticColorSystem {
  final bool isDark;
  _NegativeColor({this.isDark = false});
  @override
  Color get subtle => isDark ? Color(0xFF331312) : Color(0xFFFFF4F4);

  @override
  Color get lighter => isDark ? Color(0xFF4C1C1C) : Color(0xFFF8E0E0);

  @override
  Color get defaultColor => isDark ? Color(0xFFD84646) : Color(0xFFED4A4A);

  @override
  Color get darker => isDark ? Color(0xFFF8A5A5) : Color(0xFFCC100F);

  @override
  Color get deep => isDark ? Color(0xFFFFD2D2) : Color(0xFF760908);
}

/**
 * Positive colors communicate a positive action, positive trend, or a successful confirmation. If you're using green as your primary color, it can be helpful to introduce a different hue for your success green.
 */
class _PositiveColor extends LedgerSemanticColorSystem {
  final bool isDark;
  _PositiveColor({this.isDark = false});
  @override
  Color get subtle => isDark ? Color(0xFF0D241C) : Color(0xFFEAFAF4);

  @override
  Color get lighter => isDark ? Color(0xFF1D382F) : Color(0xFFD5F1E7);

  @override
  Color get defaultColor => isDark ? Color(0xFF3B9F7E) : Color(0xFF43BF95);

  @override
  Color get darker => isDark ? Color(0xFF78C9AC) : Color(0xFF2A7E62);

  @override
  Color get deep => isDark ? Color(0xFFBDD3CA) : Color(0xFF1E5B47);
}

/**
 * Error colors are used across error states and in "destructive" actions. They communicate a destructive/negative action, such as removing a user from your team.
 */
class _InfoColor extends LedgerSemanticColorSystem {
  final bool isDark;
  _InfoColor({this.isDark = false});
  @override
  Color get subtle => isDark ? Color(0xFF1C2335) : Color(0xFFF1F6FF);

  @override
  Color get lighter => isDark ? Color(0xFF222C4C) : Color(0xFFE1E8F6);

  @override
  Color get defaultColor => isDark ? Color(0xFF436BCE) : Color(0xFF4673E6);

  @override
  Color get darker => isDark ? Color(0xFF97AEEB) : Color(0xFF2B53B6);

  @override
  Color get deep => isDark ? Color(0xFFB4C7F8) : Color(0xFF133282);
}
