import 'dart:ui';

import 'ledger_color_system.dart';

class SemanticsColors {
  static get error => _ErrorColor();
  static get notice => _NoticeColor();
  static get negative => _NegativeColor();
  static get positive => _PositiveColor();
  static get info => _InfoColor();
}

/**
 * Error colors are used across error states and in "destructive" actions. They communicate a destructive/negative action, such as removing a user from your team.
 */
class _ErrorColor extends LedgerSemanticColorSystem {
  @override
  Color get darker => Color(0xFFBC5A34);

  @override
  Color get deep => Color(0xFF62301D);

  @override
  Color get lighter => Color(0xFFF8D3C5);

  @override
  Color get subtle => Color(0xFFFFF1EB);
  
  @override
  Color get defaultColor => Color(0xFFE97244);
}
/**
 * Notice colors can communicate that an action is potentially destructive or "on-hold". These colors are commonly used in confirmations to grab the users' attention.
 */
class _NoticeColor extends LedgerSemanticColorSystem {
  @override
  Color get darker => Color(0xFFBD871A);

  @override
  Color get deep => Color(0xFF71500F);

  @override
  Color get lighter => Color(0xFFF4E9D0);

  @override
  Color get subtle => Color(0xFFFFF8E9);
  
  @override
  Color get defaultColor => Color(0xFFE6AE40);
}

/**
 * Negative colors can communicate that an action is potentially destructive or "on-hold". These colors are commonly used in confirmations to grab the users' attention.
 */
class _NegativeColor extends LedgerSemanticColorSystem {
  @override
  Color get darker => Color(0xFFCC100F);

  @override
  Color get deep => Color(0xFF760908);

  @override
  Color get lighter => Color(0xFFF8E0E0);

  @override
  Color get subtle => Color(0xFFFFF4F4);
  
  @override
  Color get defaultColor => Color(0xFFED4A4A);
}

/**
 * Positive colors communicate a positive action, positive trend, or a successful confirmation. If you're using green as your primary color, it can be helpful to introduce a different hue for your success green.
 */
class _PositiveColor extends LedgerSemanticColorSystem {
  @override
  Color get darker => Color(0xFF2A7E62);

  @override
  Color get deep => Color(0xFF1E5B47);

  @override
  Color get lighter => Color(0xFFD5F1E7);

  @override
  Color get subtle => Color(0xFFEAFAF4);
  
  @override
  Color get defaultColor => Color(0xFF43BF95);
}

/**
 * Error colors are used across error states and in "destructive" actions. They communicate a destructive/negative action, such as removing a user from your team.
 */
class _InfoColor extends LedgerSemanticColorSystem {
  @override
  Color get darker => Color(0xFF2B53B6);

  @override
  Color get deep => Color(0xFF133282);

  @override
  Color get lighter => Color(0xFFE1E8F6);

  @override
  Color get subtle => Color(0xFFF1F6FF);
  
  @override
  Color get defaultColor => Color(0xFF4673E6);
}