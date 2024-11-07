import 'dart:ui';

import 'ledger_color_system.dart';

export 'semantics_colors.dart';

/**
 * These are the main neutral, brand and semantic colors that make up the majority of the colors used in the design system and components.
 */
class BaseColors {
  BaseColors.light(): base = _BaseColors();
  BaseColors.dark(): base = _BaseColors(isDark: true);
  final _BaseColors base;

  static lerp(BaseColors base, BaseColors base2, double t) {}
}

/**
 * These are the background colors that will be applied in both light and dark modes.
 */
class BackgroundColors {
  BackgroundColors.light(): background = _BackgroundColors();
  BackgroundColors.dark(): background = _BackgroundColors(isDark: true);
  final _BackgroundColors background;

  static lerp(BackgroundColors background, BackgroundColors background2, double t) {}
}

/**
 * These are neutral colors that remain consistent in both dark and light mode. When used, they won't change based on the theme but will stay the same across all modes.
 */
class IntactColors {
  IntactColors.light(): intact = _IntactColors();
  IntactColors.dark(): intact = _IntactColors(isDark: true);
  final _IntactColors intact;

  static lerp(IntactColors intact, IntactColors intact2, double t) {}
}

/**
 * Base is a neutral color and is the foundation of the color system. Almost everything in UI design — text, form fields, backgrounds, dividers — are usually grey.
 */
class _BaseColors extends LedgerBaseColorSystem {
  final bool isDark;
  _BaseColors({this.isDark = false});
  @override
  Color get white => isDark ? Color(0xFF171717): Color(0xFFFFFFFF);
  
  @override
  Color get black => isDark ? Color(0xFFF3F3F3): Color(0xFF0D1011);
}

/**
 * These are the background colors that will be applied in both light and dark modes.
 */
class _BackgroundColors extends LedgerBackgroundColorSystem {
  final bool isDark;
  _BackgroundColors({this.isDark = false});
  @override
  Color get dark => isDark ? Color(0xFF): Color(0xFF);
  
  @override
  Color get light => isDark ? Color(0xFF): Color(0xFF);
}

/**
 * These are neutral colors that remain consistent in both dark and light mode. When used, they won't change based on the theme but will stay the same across all modes.
 */
class _IntactColors extends LedgerBaseColorSystem {
  final bool isDark;
  _IntactColors({this.isDark = false});
  @override
  Color get white => isDark ? Color(0xFFFFFFFF): Color(0xFFFFFFFF);
  
  @override
  Color get black => isDark ? Color(0xFF171717): Color(0xFF171717);
}