import 'dart:ui';

import 'package:regal/src/theme/ledger_colors/ledger_color_system.dart';

/// These are the main neutral, brand and semantic colors that make up the majority of the colors used in the design system and components.
class NeutralColors {
  NeutralColors.light(): grey = Grey();
  NeutralColors.dark(): grey = Grey(isDark: true);
  final Grey grey;

  static NeutralColors lerp(NeutralColors neutral, NeutralColors neutral2, double t) => neutral;
}

/// These are the main brand and semantic colors that make up the majority of the colors used in the design system and components.
class BrandColors {
  BrandColors.light(): primary = Primary();
  BrandColors.dark(): primary = Primary(isDark: true);
  final Primary primary;

  static BrandColors lerp(BrandColors brand, BrandColors brand2, double t) => brand;
}

/// The brand color is your "primary" color, and is used across all interactive elements such as buttons, links, inputs, etc. This color can define the overall feel and can elicit emotion.
class Primary extends LedgerShadeColorSystem {
  Primary({this.isDark = false});
  final bool isDark;
  @override
  Color get shade10 => isDark ? const Color(0xFF2D060E) : const Color(0xFFFFF6F8);

  @override
  Color get shade50 => isDark ? const Color(0xFF470B16) : const Color(0xFFFCEAED);
  
  @override
  Color get shade100 => isDark ? const Color(0xFF60101E) : const Color(0xFFF6BDC7);

  @override
  Color get shade200 => isDark ? const Color(0xFF7D1425) : const Color(0xFFF19DAC);

  @override
  Color get shade300 => isDark ? const Color(0xFF9B162D) : const Color(0xFFEB7086);

  @override
  Color get shade400 => isDark ? const Color(0xFFB21934) : const Color(0xFFE7546E);

  @override
  Color get shade500 => isDark ? const Color(0xFFE42646) : const Color(0xFFE42646);

  @override
  Color get shade600 => isDark ? const Color(0xFFC66878) : const Color(0xFFCD2543);

  @override
  Color get shade700 => isDark ? const Color(0xFFCA8D96) : const Color(0xFFA01D35);

  @override
  Color get shade800 => isDark ? const Color(0xFFCB9DA5) : const Color(0xFF7C1729);

  @override
  Color get shade900 => isDark ? const Color(0xFFD5C2C5) : const Color(0xFF5F111F);
}

/// Grey is a neutral color and is the foundation of the color system.
/// Almost everything in UI design
/// — text, form fields, backgrounds, dividers —
/// are usually grey.
/// 
/// Grey 10 → Hover state on white cards
/// Grey 50 → Default card background
class Grey extends LedgerShadeColorSystem {
  Grey({this.isDark = false});
  final bool isDark;
  @override
  Color get shade10 => isDark ? const Color(0xFF1D1D1D) : const Color(0xFFFBFCFC);

  @override
  Color get shade50 => isDark ? const Color(0xFF242424) : const Color(0xFFF6F8F9);
  
  @override
  Color get shade100 => isDark ? const Color(0xFF2E2E2E) : const Color(0xFFF2F5F6);

  @override
  Color get shade200 => isDark ? const Color(0xFF404040) : const Color(0xFFEAEEF0);

  @override
  Color get shade300 => isDark ? const Color(0xFF585858) : const Color(0xFFCED7DD);

  @override
  Color get shade400 => isDark ? const Color(0xFF707070) : const Color(0xFF97A6B2);

  @override
  Color get shade500 => isDark ? const Color(0xFF888888) : const Color(0xFF6A8090);

  @override
  Color get shade600 => isDark ? const Color(0xFFCACACA) : const Color(0xFF475664);

  @override
  Color get shade700 => isDark ? const Color(0xFFE2E2E2) : const Color(0xFF29333A);

  @override
  Color get shade800 => isDark ? const Color(0xFFF3F3F3) : const Color(0xFF1B2228);

  @override
  Color get shade900 => isDark ? const Color(0xFFF8F8F8) : const Color(0xFF151B20);
}
