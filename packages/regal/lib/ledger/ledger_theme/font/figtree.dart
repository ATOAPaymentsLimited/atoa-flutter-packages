import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:regal/assets/fonts.gen.dart';

const _defaultStyle = TextStyle(
  letterSpacing: 0,
  fontWeight: FontWeight.normal,
  fontVariations: [
    FontVariation.weight(400),
  ],
);

final kFigTreeTextTheme = TextTheme(
  displayLarge: _defaultStyle.copyWith(fontSize: 118.sp, height: 1.25),
  displayMedium: _defaultStyle.copyWith(fontSize: 84.sp, height: 1.25),
  displaySmall: _defaultStyle.copyWith(fontSize: 64.sp, height: 1.3),
  headlineLarge: _defaultStyle.copyWith(fontSize: 50.sp, height: 1.3),
  headlineMedium: _defaultStyle.copyWith(fontSize: 32.sp, height: 1.3),
  headlineSmall: _defaultStyle.copyWith(fontSize: 28.sp, height: 1.3),
  titleSmall: _defaultStyle.copyWith(fontSize: 18.sp, height: 1.4),
  titleMedium: _defaultStyle.copyWith(fontSize: 20.sp, height: 1.4),
  titleLarge: _defaultStyle.copyWith(fontSize: 24.sp, height: 1.3),
  bodySmall: _defaultStyle.copyWith(fontSize: 13.sp, height: 1.5),
  bodyMedium: _defaultStyle.copyWith(fontSize: 14.sp, height: 1.5),
  bodyLarge: _defaultStyle.copyWith(fontSize: 16.sp, height: 1.45),
  labelSmall:
      _defaultStyle.copyWith(fontSize: 12.sp, height: 1.6, letterSpacing: 0.1),
).apply(fontFamily: FontFamily.figTree, package: 'regal');

extension FigTreeTextTheme on BuildContext {
  TextTheme get tt => Theme.of(this).textTheme;

  /// Display
  TextStyle get display1 => tt.displayLarge!;
  TextStyle get display2 => tt.displayMedium!;
  TextStyle get display3 => tt.displaySmall!;

  /// Headline
  TextStyle get headline1 => tt.headlineLarge!;
  TextStyle get headline2 => tt.headlineMedium!;
  TextStyle get headline3 => tt.headlineSmall!;

  /// Body
  TextStyle get body1 => tt.bodyLarge!;
  TextStyle get body2 => tt.bodyMedium!;
  TextStyle get body3 => tt.bodySmall!;

  /// Title
  TextStyle get title1 => tt.titleLarge!;
  TextStyle get title2 => tt.titleMedium!;
  TextStyle get title3 => tt.titleSmall!;

  /// Caption
  TextStyle get caption => _defaultStyle.copyWith(fontSize: 12.sp, height: 1.5);

  /// Overline
  TextStyle get overline =>
      _defaultStyle.copyWith(fontSize: 11.sp, height: 1.6);

  /// Button
  TextStyle get buttonSmall =>
      _defaultStyle.copyWith(fontSize: 12.sp, height: 1.5);
  TextStyle get buttonMedium =>
      _defaultStyle.copyWith(fontSize: 14.sp, height: 1.6);

  /// Label
  TextStyle get labelSmall => tt.labelSmall!;
  TextStyle get labelExtraSmall =>
      _defaultStyle.copyWith(fontSize: 12.sp, height: 1.6, letterSpacing: 0.1);
}
