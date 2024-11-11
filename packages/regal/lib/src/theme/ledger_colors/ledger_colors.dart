import 'dart:ui';

import 'package:regal/src/theme/ledger_colors/ledger_color_system.dart';

export 'ledger_colors_x.dart';
export 'semantics_colors.dart';
export 'shade_colors.dart';

/// These are the main neutral, brand and semantic colors that make up the majority of the colors used in the design system and components.
/// Base is a neutral color and is the foundation of the color system. Almost everything in UI design — text, form fields, backgrounds, dividers — are usually grey.
class BaseColors extends LedgerBaseColorSystem {
  BaseColors._(this._white, this._black);
  BaseColors.light()
      : _white = const Color(0xFFFFFFFF),
        _black = const Color(0xFF0D1011);
  BaseColors.dark()
      : _white = const Color(0xFF171717),
        _black = const Color(0xFFF3F3F3);
  final Color _white;
  final Color _black;

  @override
  Color get white => _white;

  @override
  Color get black => _black;

  @override
  BaseColors lerp(covariant BaseColors? other, double t) => BaseColors._(
        Color.lerp(white, other?.white, t) ?? white,
        Color.lerp(black, other?.black, t) ?? black,
      );

  @override
  BaseColors copyWith({Color? white, Color? black}) =>
      BaseColors._(white ?? this.white, black ?? this.black);
}

/// These are the background colors that will be applied in both light and dark modes.
class BackgroundColors extends LedgerBackgroundColorSystem {
  BackgroundColors._(this._light, this._dark);
  BackgroundColors.light()
      : _light = const Color(0xFFFFFFFF),
        _dark = const Color(0xFF171717);
  BackgroundColors.dark()
      : _light = const Color(0xFF171717),
        _dark = const Color(0xFFFFFFFF);

  final Color _light;
  final Color _dark;

  @override
  Color get light => _light;

  @override
  Color get dark => _dark;

  @override
  BackgroundColors copyWith({Color? light, Color? dark}) =>
      BackgroundColors._(light ?? this.light, dark ?? this.dark);

  @override
  BackgroundColors lerp(covariant BackgroundColors? other, double t) =>
      BackgroundColors._(
        Color.lerp(light, other?.light, t) ?? light,
        Color.lerp(dark, other?.dark, t) ?? dark,
      );
}

/// These are neutral colors that remain consistent in both dark and light mode. When used, they won't change based on the theme but will stay the same across all modes.
class IntactColors extends LedgerBaseColorSystem {
  IntactColors._(this._white, this._black);
  IntactColors.light()
      : _white = const Color(0xFFFFFFFF),
        _black = const Color(0xFF171717);
  IntactColors.dark()
      : _white = const Color(0xFFFFFFFF),
        _black = const Color(0xFF171717);
  final Color _white;
  final Color _black;

  @override
  Color get white => _white;

  @override
  Color get black => _black;

  @override
  IntactColors lerp(covariant IntactColors? other, double t) => IntactColors._(
        Color.lerp(white, other?.white, t) ?? white,
        Color.lerp(black, other?.black, t) ?? black,
      );

  @override
  IntactColors copyWith({Color? white, Color? black}) =>
      IntactColors._(white ?? this.white, black ?? this.black);
}
