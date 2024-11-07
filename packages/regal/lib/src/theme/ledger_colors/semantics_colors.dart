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
  SemanticsColors._(
      this.error, this.notice, this.negative, this.positive, this.info);
  SemanticsColors.light()
      : error = ErrorColor.light(),
        notice = NoticeColor.light(),
        negative = NegativeColor.light(),
        positive = PositiveColor.light(),
        info = InfoColor.light();
  SemanticsColors.dark()
      : error = ErrorColor.dark(),
        notice = NoticeColor.dark(),
        negative = NegativeColor.dark(),
        positive = PositiveColor.dark(),
        info = InfoColor.dark();

  final ErrorColor error;
  final NoticeColor notice;
  final NegativeColor negative;
  final PositiveColor positive;
  final InfoColor info;

  SemanticsColors copyWith({
    ErrorColor? error,
    NoticeColor? notice,
    NegativeColor? negative,
    PositiveColor? positive,
    InfoColor? info,
  }) =>
      SemanticsColors._(
        error ?? this.error,
        notice ?? this.notice,
        negative ?? this.negative,
        positive ?? this.positive,
        info ?? this.info,
      );

  SemanticsColors lerp(covariant SemanticsColors? other, double t) {
    if (other is! SemanticsColors) return this;
    return SemanticsColors._(
      error.lerp(other.error, t),
      notice.lerp(other.notice, t),
      negative.lerp(other.negative, t),
      positive.lerp(other.positive, t),
      info.lerp(other.info, t),
    );
  }
}

/// Error colors are used across error states and in "destructive" actions. They communicate a destructive/negative action, such as removing a user from your team.
class ErrorColor extends LedgerSemanticColorSystem {
  ErrorColor._(
    this._subtle,
    this._lighter,
    this._defaultColor,
    this._darker,
    this._deep,
  );
  ErrorColor.light()
      : _subtle = const Color(0xFFFFF1EB),
        _lighter = const Color(0xFFF8D3C5),
        _defaultColor = const Color(0xFFE97244),
        _darker = const Color(0xFFBC5A34),
        _deep = const Color(0xFF62301D);
  ErrorColor.dark()
      : _subtle = const Color(0xFF32170C),
        _lighter = const Color(0xFF47291D),
        _defaultColor = const Color(0xFFD46940),
        _darker = const Color(0xFFF6B39A),
        _deep = const Color(0xFFF5CFC0);
  final Color _subtle;
  final Color _lighter;
  final Color _defaultColor;
  final Color _darker;
  final Color _deep;

  @override
  Color get subtle => _subtle;

  @override
  Color get lighter => _lighter;

  @override
  Color get defaultColor => _defaultColor;

  @override
  Color get darker => _darker;

  @override
  Color get deep => _deep;

  @override
  ErrorColor copyWith({
    Color? subtle,
    Color? lighter,
    Color? defaultColor,
    Color? darker,
    Color? deep,
  }) =>
      ErrorColor._(
        subtle ?? this.subtle,
        lighter ?? this.lighter,
        defaultColor ?? this.defaultColor,
        darker ?? this.darker,
        deep ?? this.deep,
      );

  @override
  ErrorColor lerp(covariant ErrorColor? other, double t) {
    if (other is! ErrorColor) return this;
    return ErrorColor._(
      Color.lerp(subtle, other.subtle, t) ?? subtle,
      Color.lerp(lighter, other.lighter, t) ?? lighter,
      Color.lerp(defaultColor, other.defaultColor, t) ?? defaultColor,
      Color.lerp(darker, other.darker, t) ?? darker,
      Color.lerp(deep, other.deep, t) ?? deep,
    );
  }
}

/// Notice colors can communicate that an action is potentially destructive or "on-hold". These colors are commonly used in confirmations to grab the users' attention.
class NoticeColor extends LedgerSemanticColorSystem {
  NoticeColor._(
    this._subtle,
    this._lighter,
    this._defaultColor,
    this._darker,
    this._deep,
  );
  NoticeColor.light()
      : _subtle = const Color(0xFFFFF8E9),
        _lighter = const Color(0xFFF4E9D0),
        _defaultColor = const Color(0xFFE6AE40),
        _darker = const Color(0xFFBD871A),
        _deep = const Color(0xFF71500F);
  NoticeColor.dark()
      : _subtle = const Color(0xFF2C210A),
        _lighter = const Color(0xFF4A3B1D),
        _defaultColor = const Color(0xFFD29F3C),
        _darker = const Color(0xFFE3CA98),
        _deep = const Color(0xFFFFEFCF);
  final Color _subtle;
  final Color _lighter;
  final Color _defaultColor;
  final Color _darker;
  final Color _deep;

  @override
  Color get subtle => _subtle;

  @override
  Color get lighter => _lighter;

  @override
  Color get defaultColor => _defaultColor;

  @override
  Color get darker => _darker;

  @override
  Color get deep => _deep;

  @override
  NoticeColor copyWith({
    Color? subtle,
    Color? lighter,
    Color? defaultColor,
    Color? darker,
    Color? deep,
  }) =>
      NoticeColor._(
        subtle ?? this.subtle,
        lighter ?? this.lighter,
        defaultColor ?? this.defaultColor,
        darker ?? this.darker,
        deep ?? this.deep,
      );

  @override
  NoticeColor lerp(covariant NoticeColor? other, double t) {
    if (other is! NoticeColor) return this;
    return NoticeColor._(
      Color.lerp(subtle, other.subtle, t) ?? subtle,
      Color.lerp(lighter, other.lighter, t) ?? lighter,
      Color.lerp(defaultColor, other.defaultColor, t) ?? defaultColor,
      Color.lerp(darker, other.darker, t) ?? darker,
      Color.lerp(deep, other.deep, t) ?? deep,
    );
  }
}

/// Negative colors can communicate that an action is potentially destructive or "on-hold". These colors are commonly used in confirmations to grab the users' attention.
class NegativeColor extends LedgerSemanticColorSystem {
  NegativeColor._(
    this._subtle,
    this._lighter,
    this._defaultColor,
    this._darker,
    this._deep,
  );
  NegativeColor.light()
      : _subtle = const Color(0xFFFFF4F4),
        _lighter = const Color(0xFFF8E0E0),
        _defaultColor = const Color(0xFFED4A4A),
        _darker = const Color(0xFFCC100F),
        _deep = const Color(0xFF760908);
  NegativeColor.dark()
      : _subtle = const Color(0xFF331312),
        _lighter = const Color(0xFF4C1C1C),
        _defaultColor = const Color(0xFFD84646),
        _darker = const Color(0xFFF8A5A5),
        _deep = const Color(0xFFFFD2D2);
  final Color _subtle;
  final Color _lighter;
  final Color _defaultColor;
  final Color _darker;
  final Color _deep;

  @override
  Color get subtle => _subtle;

  @override
  Color get lighter => _lighter;

  @override
  Color get defaultColor => _defaultColor;

  @override
  Color get darker => _darker;

  @override
  Color get deep => _deep;

  @override
  NegativeColor copyWith({
    Color? subtle,
    Color? lighter,
    Color? defaultColor,
    Color? darker,
    Color? deep,
  }) =>
      NegativeColor._(
        subtle ?? this.subtle,
        lighter ?? this.lighter,
        defaultColor ?? this.defaultColor,
        darker ?? this.darker,
        deep ?? this.deep,
      );

  @override
  NegativeColor lerp(covariant NegativeColor? other, double t) {
    if (other is! NegativeColor) return this;
    return NegativeColor._(
      Color.lerp(subtle, other.subtle, t) ?? subtle,
      Color.lerp(lighter, other.lighter, t) ?? lighter,
      Color.lerp(defaultColor, other.defaultColor, t) ?? defaultColor,
      Color.lerp(darker, other.darker, t) ?? darker,
      Color.lerp(deep, other.deep, t) ?? deep,
    );
  }
}

/// Positive colors communicate a positive action, positive trend, or a successful confirmation. If you're using green as your primary color, it can be helpful to introduce a different hue for your success green.
class PositiveColor extends LedgerSemanticColorSystem {
  PositiveColor._(
    this._subtle,
    this._lighter,
    this._defaultColor,
    this._darker,
    this._deep,
  );
  PositiveColor.light()
      : _subtle = const Color(0xFFEAFAF4),
        _lighter = const Color(0xFFD5F1E7),
        _defaultColor = const Color(0xFF43BF95),
        _darker = const Color(0xFF2A7E62),
        _deep = const Color(0xFF1E5B47);
  PositiveColor.dark()
      : _subtle = const Color(0xFF0D241C),
        _lighter = const Color(0xFF1D382F),
        _defaultColor = const Color(0xFF3B9F7E),
        _darker = const Color(0xFF78C9AC),
        _deep = const Color(0xFFBDD3CA);
  final Color _subtle;
  final Color _lighter;
  final Color _defaultColor;
  final Color _darker;
  final Color _deep;

  @override
  Color get subtle => _subtle;

  @override
  Color get lighter => _lighter;

  @override
  Color get defaultColor => _defaultColor;

  @override
  Color get darker => _darker;

  @override
  Color get deep => _deep;

  @override
  PositiveColor copyWith({
    Color? subtle,
    Color? lighter,
    Color? defaultColor,
    Color? darker,
    Color? deep,
  }) =>
      PositiveColor._(
        subtle ?? this.subtle,
        lighter ?? this.lighter,
        defaultColor ?? this.defaultColor,
        darker ?? this.darker,
        deep ?? this.deep,
      );

  @override
  PositiveColor lerp(covariant PositiveColor? other, double t) {
    if (other is! PositiveColor) return this;
    return PositiveColor._(
      Color.lerp(subtle, other.subtle, t) ?? subtle,
      Color.lerp(lighter, other.lighter, t) ?? lighter,
      Color.lerp(defaultColor, other.defaultColor, t) ?? defaultColor,
      Color.lerp(darker, other.darker, t) ?? darker,
      Color.lerp(deep, other.deep, t) ?? deep,
    );
  }
}

/// Error colors are used across error states and in "destructive" actions. They communicate a destructive/negative action, such as removing a user from your team.
class InfoColor extends LedgerSemanticColorSystem {
  InfoColor._(
    this._subtle,
    this._lighter,
    this._defaultColor,
    this._darker,
    this._deep,
  );
  InfoColor.light()
      : _subtle = const Color(0xFFF1F6FF),
        _lighter = const Color(0xFFE1E8F6),
        _defaultColor = const Color(0xFF4673E6),
        _darker = const Color(0xFF2B53B6),
        _deep = const Color(0xFF133282);
  InfoColor.dark()
      : _subtle = const Color(0xFF1C2335),
        _lighter = const Color(0xFF222C4C),
        _defaultColor = const Color(0xFF436BCE),
        _darker = const Color(0xFF97AEEB),
        _deep = const Color(0xFFB4C7F8);
  final Color _subtle;
  final Color _lighter;
  final Color _defaultColor;
  final Color _darker;
  final Color _deep;

  @override
  Color get subtle => _subtle;

  @override
  Color get lighter => _lighter;

  @override
  Color get defaultColor => _defaultColor;

  @override
  Color get darker => _darker;

  @override
  Color get deep => _deep;

  @override
  InfoColor copyWith({
    Color? subtle,
    Color? lighter,
    Color? defaultColor,
    Color? darker,
    Color? deep,
  }) =>
      InfoColor._(
        subtle ?? this.subtle,
        lighter ?? this.lighter,
        defaultColor ?? this.defaultColor,
        darker ?? this.darker,
        deep ?? this.deep,
      );

  @override
  InfoColor lerp(covariant InfoColor? other, double t) {
    if (other is! InfoColor) return this;
    return InfoColor._(
      Color.lerp(subtle, other.subtle, t) ?? subtle,
      Color.lerp(lighter, other.lighter, t) ?? lighter,
      Color.lerp(defaultColor, other.defaultColor, t) ?? defaultColor,
      Color.lerp(darker, other.darker, t) ?? darker,
      Color.lerp(deep, other.deep, t) ?? deep,
    );
  }
}
