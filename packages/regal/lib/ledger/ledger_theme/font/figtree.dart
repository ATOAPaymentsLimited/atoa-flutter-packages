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
  titleLarge: _defaultStyle.copyWith(fontSize: 24.sp, height: 1.3),
  titleMedium: _defaultStyle.copyWith(fontSize: 20.sp, height: 1.4),
  titleSmall: _defaultStyle.copyWith(fontSize: 18.sp, height: 1.4),
  bodyLarge: _defaultStyle.copyWith(fontSize: 16.sp, height: 1.45),
  bodyMedium: _defaultStyle.copyWith(fontSize: 14.sp, height: 1.5),
  bodySmall: _defaultStyle.copyWith(fontSize: 13.sp, height: 1.5),
  labelSmall:
      _defaultStyle.copyWith(fontSize: 12.sp, height: 1.6, letterSpacing: 0.1),
).apply(fontFamily: FontFamily.figTree, package: 'regal');

extension FigTreeTextTheme on BuildContext {
  TextTheme get tt => Theme.of(this).textTheme;

  /// Display 1 is Flutter Display Large with 118px size and 125% height
  TextStyle get display1 => tt.displayLarge!;
  /// Display 2 is Flutter Display Medium with 84px size and 125% height
  TextStyle get display2 => tt.displayMedium!;
  /// Display 3 is Flutter Display Small with 64px size and 130% height
  TextStyle get display3 => tt.displaySmall!;

  /// Headline 1 is Flutter Headline Large with 50px size and 130% height
  TextStyle get headline1 => tt.headlineLarge!;
  /// Headline 2 is Flutter Headline Medium with 32px size and 130% height
  TextStyle get headline2 => tt.headlineMedium!;
  /// Headline 3 is Flutter Headline Small with 28px size and 130% height
  TextStyle get headline3 => tt.headlineSmall!;

  /// Body 1 is Flutter Body Large with 16px size and 145% height
  TextStyle get body1 => tt.bodyLarge!;
  /// Body 2 is Flutter Body Medium with 14px size and 150% height
  TextStyle get body2 => tt.bodyMedium!;
  /// Body 3 is Flutter Body Small with 13px size and 150% height
  TextStyle get body3 => tt.bodySmall!;

  /// Title 1 is Flutter Title Large with 24px size and 130% height
  TextStyle get title1 => tt.titleLarge!;
  /// Title 1 is Flutter Title Large with 20px size and 140% height
  TextStyle get title2 => tt.titleMedium!;
  /// Title 1 is Flutter Title Large with 18px size and 140% height
  TextStyle get title3 => tt.titleSmall!;

  /// Caption is Text Style with 12px size and 150% height
  TextStyle get caption => _defaultStyle.copyWith(fontSize: 12.sp, height: 1.5);

  /// Overline is Text Style with 11px size and 160% height
  TextStyle get overline =>
      _defaultStyle.copyWith(fontSize: 11.sp, height: 1.6);

  /// Button Small is Text Style with 12px size and 150% height
  TextStyle get buttonSmall =>
      _defaultStyle.copyWith(fontSize: 12.sp, height: 1.5);
  /// Button Medium is Text Style with 14px size and 160% height
  TextStyle get buttonMedium =>
      _defaultStyle.copyWith(fontSize: 14.sp, height: 1.6);

  /// Label Small is Flutter Label Small with 16px size and 145% height
  TextStyle get labelSmall => tt.labelSmall!;
  /// Label Extra Small is Text Style with 12px size and 160% height and 10% letter spacing
  TextStyle get labelExtraSmall =>
      _defaultStyle.copyWith(fontSize: 12.sp, height: 1.6, letterSpacing: 0.1);
}
