import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:regal/ledger/ledger_theme/colors/colors.dart';
import 'package:regal/ledger/utils/theme_mode_notifier.dart';

extension BasicThemeDataExtension on BuildContext {
  ThemeData get theme => Theme.of(this);
  /// private variables
  ColorsThemeExtension get _ledgerColorsX =>
      theme.extension<ColorsThemeExtension>()!;
  SemanticsColors get _semantics => _ledgerColorsX.semantic;
  Brightness get brightness => theme.brightness;
  ThemeModeNotifier get themeModeNotifier => read<ThemeModeNotifier>();

  /// public variables
  ErrorColor get error => _semantics.error;
  InfoColor get info => _semantics.info;
  NegativeColor get negative => _semantics.negative;
  PositiveColor get positive => _semantics.positive;
  NoticeColor get notice => _semantics.notice;
  Grey get grey => _ledgerColorsX.neutral.grey;
  Primary get primary => _ledgerColorsX.brand.primary;
  Color get baseWhite => _ledgerColorsX.base.white;
  Color get baseBlack => _ledgerColorsX.base.black;
  Color get intactWhite => _ledgerColorsX.intact.white;
  Color get intactBlack => _ledgerColorsX.intact.black;
  Color get backgroundLight => _ledgerColorsX.background.light;
  Color get backgroundDark => _ledgerColorsX.background.dark;
}
