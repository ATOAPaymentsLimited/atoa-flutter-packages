import 'dart:ui';

import 'package:regal/src/theme/ledger_colors/ledger_color_system.dart';

export 'semantics_colors.dart';

/// These are the main neutral, brand and semantic colors that make up the majority of the colors used in the design system and components.
/// Base is a neutral color and is the foundation of the color system. Almost everything in UI design — text, form fields, backgrounds, dividers — are usually grey.
class BaseColors extends LedgerBaseColorSystem {
  BaseColors.light(): isDark = false;
  BaseColors.dark(): isDark = true;

  final bool isDark;
  @override
  Color get white => isDark ? const Color(0xFF171717): const Color(0xFFFFFFFF);
  
  @override
  Color get black => isDark ? const Color(0xFFF3F3F3): const Color(0xFF0D1011);
  
  static BaseColors lerp(BaseColors base, BaseColors base2, double t) => base;
}

/// These are the background colors that will be applied in both light and dark modes.
class BackgroundColors extends LedgerBackgroundColorSystem {
  BackgroundColors.light(): isDark = false;
  BackgroundColors.dark(): isDark = true;
  final bool isDark;

  @override
  Color get light => isDark ? const Color(0xFF171717): const Color(0xFFFFFFFF);
  
  @override
  Color get dark => isDark ? const Color(0xFFFFFFFF): const Color(0xFF171717);

  static BackgroundColors lerp(BackgroundColors background, BackgroundColors background2, double t) => background;
}

/// These are neutral colors that remain consistent in both dark and light mode. When used, they won't change based on the theme but will stay the same across all modes.
class IntactColors extends LedgerBaseColorSystem {
  IntactColors.light(): isDark = false;
  IntactColors.dark(): isDark = true;
  final bool isDark;

  @override
  Color get white => isDark ? const Color(0xFFFFFFFF): const Color(0xFFFFFFFF);
  
  @override
  Color get black => isDark ? const Color(0xFF171717): const Color(0xFF171717);
  
  static IntactColors lerp(IntactColors intact, IntactColors intact2, double t) => intact;
}
