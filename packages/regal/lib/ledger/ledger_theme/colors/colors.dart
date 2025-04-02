
import 'package:regal/ledger/ledger_theme/colors/colors.dart';

export 'base_colors.dart';
export 'colors_theme_extension.dart';
export 'semantics_colors.dart';
export 'shade_colors.dart';

class LedgerColors {
  static ColorsThemeExtension lightColors = ColorsThemeExtension(
    base: BaseColors.light(),
    brand: BrandColors.light(),
    neutral: NeutralColors.light(),
    semantic: SemanticsColors.light(),
    background: BackgroundColors.light(),
    intact: IntactColors.light(),
  );

  static ColorsThemeExtension darkColors = ColorsThemeExtension(
    base: BaseColors.dark(),
    brand: BrandColors.dark(),
    neutral: NeutralColors.dark(),
    semantic: SemanticsColors.dark(),
    background: BackgroundColors.dark(),
    intact: IntactColors.dark(),
  );
}
