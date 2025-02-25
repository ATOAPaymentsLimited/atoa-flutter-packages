// coverage:ignore-file

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:regal/src/regal.dart';
import 'package:regal/src/theme/text/figtree_x.dart';
import 'package:regal/src/theme/theme.dart';

/// Theme Extension
extension ThemeX on BuildContext {
  /// performs a simple [Theme.of(context)] action and returns given [ThemeData]
  ThemeData get theme => Theme.of(this);

  TextTheme get textTheme => Theme.of(this).textTheme;

  /// performs a simple [Theme.of(context).primaryTextTheme] action and returns given [primaryTextTheme]
  /// {@macro text_theme_specification}
  TextTheme get primaryTextTheme => Theme.of(this).primaryTextTheme;

  /// performs a simple [Theme.of(context).bottomAppBarTheme] action and returns given [bottomAppBarTheme]
  BottomAppBarTheme get bottomAppBarTheme => Theme.of(this).bottomAppBarTheme;

  /// performs a simple [Theme.of(context).bottomSheetTheme] action and returns given [bottomSheetTheme]
  BottomSheetThemeData get bottomSheetTheme => Theme.of(this).bottomSheetTheme;

  /// performs a simple [Theme.of(context).appBarTheme] action and returns given [appBarTheme]
  AppBarTheme get appBarTheme => Theme.of(this).appBarTheme;

  // COLOR

  /// performs a simple [Theme.of(context).backgroundColor] action and returns given [backgroundColor]
  Color get backgroundColor => Theme.of(this).colorScheme.surface;

  /// performs a simple [Theme.of(context).primaryColor] action and returns given [primaryColor]
  Color get primaryColor => Theme.of(this).primaryColor;

  /// A lighter version of the [primaryColor].
  Color get primaryColorLight => Theme.of(this).primaryColorLight;

  /// A darker version of the [primaryColor].
  Color get primaryColorDark => Theme.of(this).primaryColorDark;

  /// The focus color used indicate that a component has the input focus.
  Color get focusColor => Theme.of(this).focusColor;

  /// The hover color used to indicate when a pointer is hovering over a
  /// component.
  Color get hoverColor => Theme.of(this).hoverColor;

  /// The default color of the [Material] that underlies the [Scaffold]. The
  /// background color for a typical material app or a page within the app.
  Color get scaffoldBackgroundColor => Theme.of(this).scaffoldBackgroundColor;

  /// The color of [Divider]s and [PopupMenuDivider]s, also used
  /// between [ListTile]s, between rows in [DataTable]s, and so forth.
  ///
  /// To create an appropriate [BorderSide] that uses this color, consider
  /// [Divider.createBorderSide].
  Color get dividerColor => Theme.of(this).dividerColor;

  // TYPOGRAPHY 2021

  /// performs a simple [Theme.of(context).displayLarge] action and returns given [displayLarge]
  /// ```
  /// displayLarge        48.0  FontWeight.w700
  /// ```
  TextStyle? get displayLarge => textTheme.displayLarge;

  /// performs a simple [Theme.of(context).displayMedium] action and returns given [displayMedium]
  /// ```
  /// displayMedium       36.0  FontWeight.w700
  /// ```
  TextStyle? get displayMedium => textTheme.displayMedium;

  /// performs a simple [Theme.of(context).displaySmall] action and returns given [displaySmall]
  /// ```
  /// displayMedium       32.0  FontWeight.w700
  /// ```
  TextStyle? get displaySmall => textTheme.displaySmall;

  /// performs a simple [Theme.of(context).headlineLarge] action and returns given [headlineLarge]
  /// ```
  /// headlineLarge        32.0  FontWeight.w700
  /// ```
  TextStyle? get headlineLarge => textTheme.headlineLarge;

  /// performs a simple [Theme.of(context).headlineMedium] action and returns given [headlineMedium]
  /// ```
  /// headlineMedium       28.0  FontWeight.w700
  /// ```
  TextStyle? get headlineMedium => textTheme.headlineMedium;

  /// performs a simple [Theme.of(context).headlineSmall] action and returns given [headlineSmall]
  /// ```
  /// headlineMedium       24.0  FontWeight.w700
  /// ```
  TextStyle? get headlineSmall => textTheme.headlineSmall;

  /// performs a simple [Theme.of(context).titleLarge] action and returns given [titleLarge]
  /// ```
  /// titleLarge           24.0  FontWeight.w400
  /// ```
  TextStyle? get titleLarge => textTheme.titleLarge;

  /// performs a simple [Theme.of(context).titleMedium] action and returns given [titleMedium]
  /// ```
  /// titleLarge           20.0  FontWeight.w400
  /// ```
  TextStyle? get titleMedium => textTheme.titleMedium;

  /// performs a simple [Theme.of(context).titleSmall] action and returns given [titleSmall]
  /// ```
  /// titleLarge           16.0  FontWeight.w400
  /// ```
  TextStyle? get titleSmall => textTheme.titleSmall;

  /// performs a simple [Theme.of(context).labelLarge] action and returns given [labelLarge]
  /// ```
  /// labelLarge           20.0  FontWeight.w400
  /// ```
  TextStyle? get labelLarge => textTheme.labelLarge;

  /// performs a simple [Theme.of(context).labelMedium] action and returns given [labelMedium]
  /// ```
  /// labelMedium          18.0  FontWeight.w400
  /// ```
  TextStyle? get labelMedium => textTheme.labelMedium;

  /// performs a simple [Theme.of(context).labelSmall] action and returns given [labelSmall]
  /// ```
  /// labelSmall           16.0  FontWeight.w400
  /// ```
  TextStyle? get labelSmall => textTheme.labelSmall;

  /// performs a simple [Theme.of(context).bodyLarge] action and returns given [bodyLarge]
  /// ```
  /// bodyLarge            14.0  FontWeight.w400
  /// ```
  TextStyle? get bodyLarge => textTheme.bodyLarge;

  /// performs a simple [Theme.of(context).bodyMedium] action and returns given [bodyMedium]
  /// ```
  /// bodyMedium           12.0  FontWeight.w400
  /// ```
  TextStyle? get bodyMedium => textTheme.bodyMedium;

  /// performs a simple [Theme.of(context).bodySmall] action and returns given [bodySmall]
  /// ```
  /// bodySmall            11.0  FontWeight.w400
  /// ```
  TextStyle? get bodySmall => textTheme.bodySmall;

  ThemeModeNotifier get themeModeNotifier => read<ThemeModeNotifier>();

  VividRedX get vividRed => theme.extension<VividRedX>()!;

  GreyX get grey => theme.extension<GreyX>()!;

  RegalColorsX get regalColor => theme.extension<RegalColorsX>()!;

  MontserratX get montserrat => theme.extension<MontserratX>()!;

  FigTreeX get figtree => theme.extension<FigTreeX>()!;

  Brightness get brightness => theme.brightness;

  ThemeData get ledgerTheme => theme.copyWith(
        appBarTheme: theme.appBarTheme.copyWith(
          backgroundColor: baseColors.white,
        ),
        bottomSheetTheme: theme.bottomSheetTheme.copyWith(
          backgroundColor: baseColors.white,
        ),
        scaffoldBackgroundColor: baseColors.white,
        textTheme: kFigTreeTextTheme.apply(
          displayColor: baseColors.black,
          bodyColor: baseColors.black,
        ),
        inputDecorationTheme: kThemeData.inputDecorationTheme.copyWith(
          labelStyle: kFigTreeTextTheme.bodyLarge?.w600.textColor(
            baseColors.black,
          ),
          hintStyle: kFigTreeTextTheme.bodyLarge?.height130.textColor(
            neutralColors.grey.shade500,
          ),
          errorStyle: kFigTreeTextTheme.bodyLarge?.textColor(
            error.defaultColor,
          ),
          filled: true,
          fillColor: baseColors.white,
          floatingLabelStyle: kFigTreeTextTheme.bodyLarge?.height150,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(Spacing.smallMedium.value),
            borderSide: BorderSide(color: neutralColors.grey.shade400),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(Spacing.smallMedium.value),
            borderSide: BorderSide(color: neutralColors.grey.shade400),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(Spacing.smallMedium.value),
            borderSide: BorderSide(color: neutralColors.grey.shade800),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(Spacing.smallMedium.value),
            borderSide: BorderSide(color: neutralColors.grey.shade300),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(Spacing.smallMedium.value),
            borderSide: BorderSide(
              color: error.defaultColor,
            ),
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            elevation: 0,
            textStyle: TextStyle(
              fontFamily: 'FigTree',
              package: 'regal',
              color: baseColors.white,
              fontSize: 14.sp,
              fontVariations: const [
                FontVariation.weight(700),
              ],
            ),
          ),
        ),
      );
}
