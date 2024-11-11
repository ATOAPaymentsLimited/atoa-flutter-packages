import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:regal/regal.dart';

final kFigTreeTextTheme = TextTheme(
  displayLarge: TextStyle(
    letterSpacing: 0,
    fontSize: 48.sp,
    fontWeight: FontWeight.bold,
    fontVariations: const [
      FontVariation.weight(700),
    ],
  ),
  displayMedium: TextStyle(
    letterSpacing: 0,
    fontSize: 36.sp,
    fontWeight: FontWeight.bold,
    fontVariations: const [
      FontVariation.weight(700),
    ],
  ),
  displaySmall: TextStyle(
    letterSpacing: 0,
    fontSize: 32.sp,
    fontWeight: FontWeight.bold,
    fontVariations: const [
      FontVariation.weight(700),
    ],
  ),
  headlineLarge: TextStyle(
    letterSpacing: 0,
    fontSize: 32.sp,
    fontWeight: FontWeight.bold,
    fontVariations: const [
      FontVariation.weight(700),
    ],
  ),
  headlineMedium: TextStyle(
    letterSpacing: 0,
    fontSize: 28.sp,
    fontWeight: FontWeight.bold,
    fontVariations: const [
      FontVariation.weight(700),
    ],
  ),
  headlineSmall: TextStyle(
    letterSpacing: 0,
    fontSize: 24.sp,
    fontWeight: FontWeight.bold,
    fontVariations: const [
      FontVariation.weight(700),
    ],
    height: 1.3,
  ),
  titleLarge: TextStyle(
    letterSpacing: 0,
    fontSize: 24.sp,
    fontWeight: FontWeight.w400,
    fontVariations: const [
      FontVariation.weight(400),
    ],
    height: 1.3,
  ),
  titleMedium: TextStyle(
    letterSpacing: 0,
    fontSize: 20.sp,
    fontWeight: FontWeight.w400,
    fontVariations: const [
      FontVariation.weight(400),
    ],
    height: 1.4,
  ),
  titleSmall: TextStyle(
    letterSpacing: 0,
    fontSize: 16.sp,
    fontWeight: FontWeight.w400,
    fontVariations: const [
      FontVariation.weight(400),
    ],
    height: 1.45,
  ),
  labelLarge: TextStyle(
    letterSpacing: 0,
    fontSize: 20.sp,
    fontWeight: FontWeight.w400,
    fontVariations: const [
      FontVariation.weight(400),
    ],
    height: 1.4,
  ),
  labelMedium: TextStyle(
    letterSpacing: 0,
    fontSize: 18.sp,
    fontWeight: FontWeight.w400,
    fontVariations: const [
      FontVariation.weight(400),
    ],
    height: 1.4,
  ),
  labelSmall: TextStyle(
    letterSpacing: 0,
    fontSize: 16.sp,
    fontWeight: FontWeight.w400,
    fontVariations: const [
      FontVariation.weight(400),
    ],
    height: 1.5,
  ),
  bodyLarge: TextStyle(
    letterSpacing: 0,
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
    fontVariations: const [
      FontVariation.weight(400),
    ],
    height: 1.5,
  ),
  bodyMedium: TextStyle(
    letterSpacing: 0,
    fontSize: 12.sp,
    fontWeight: FontWeight.w400,
    fontVariations: const [
      FontVariation.weight(400),
    ],
    height: 1.5,
  ),
  bodySmall: TextStyle(
    letterSpacing: 0,
    fontSize: 11.sp,
    fontWeight: FontWeight.w400,
    fontVariations: const [
      FontVariation.weight(400),
    ],
    height: 1.6,
  ),
).apply(
  bodyColor: RegalColors.licoriceBlack,
  displayColor: RegalColors.licoriceBlack,
  fontFamily: 'FigTree',
  package: 'regal',
);
