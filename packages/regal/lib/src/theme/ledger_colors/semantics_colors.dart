import 'package:flutter/material.dart';
import 'package:regal/src/theme/ledger_colors/ledger_color_system.dart';
import 'package:regal/src/theme/ledger_colors/ledger_colors_x.dart';

extension LedgerColorX on BuildContext {
  ThemeData get _theme => Theme.of(this);
  _ErrorColor get error => _theme.extension<LedgerColorsX>()!.semantic.error;
  _InfoColor get info => _theme.extension<LedgerColorsX>()!.semantic.info;
  _NegativeColor get negative => _theme.extension<LedgerColorsX>()!.semantic.negative;
  _PositiveColor get positive => _theme.extension<LedgerColorsX>()!.semantic.positive;
  _NoticeColor get notice => _theme.extension<LedgerColorsX>()!.semantic.notice;
}

/// These are the main neutral, brand and semantic colors that make up the majority of the colors used in the design system and components.
class SemanticsColors {
  SemanticsColors.dark()
      : error = _ErrorColor(isDark: true),
        notice = _NoticeColor(isDark: true),
        negative = _NegativeColor(isDark: true),
        positive = _PositiveColor(isDark: true),
        info = _InfoColor(isDark: true);

  SemanticsColors.light()
      : error = _ErrorColor(),
        notice = _NoticeColor(),
        negative = _NegativeColor(),
        positive = _PositiveColor(),
        info = _InfoColor();
  final _ErrorColor error;
  final _NoticeColor notice;
  final _NegativeColor negative;
  final _PositiveColor positive;
  final _InfoColor info;

  static SemanticsColors lerp(SemanticsColors semantic, SemanticsColors semantic2, double t) => semantic;
}

/// Error colors are used across error states and in "destructive" actions. They communicate a destructive/negative action, such as removing a user from your team.
class _ErrorColor extends LedgerSemanticColorSystem {
  _ErrorColor({this.isDark = false});
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
class _NoticeColor extends LedgerSemanticColorSystem {
  _NoticeColor({this.isDark = false});
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
class _NegativeColor extends LedgerSemanticColorSystem {
  _NegativeColor({this.isDark = false});
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
class _PositiveColor extends LedgerSemanticColorSystem {
  _PositiveColor({this.isDark = false});
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
class _InfoColor extends LedgerSemanticColorSystem {
  _InfoColor({this.isDark = false});
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
