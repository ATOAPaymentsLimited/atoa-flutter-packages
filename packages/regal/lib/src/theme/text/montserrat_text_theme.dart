import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:regal/regal.dart';

final kMontserratTextTheme = TextTheme(
  displayLarge: TextStyle(
    letterSpacing: 0,
    fontSize: 48.sp,
    fontWeight: FontWeight.bold,
  ),
  displayMedium: TextStyle(
    letterSpacing: 0,
    fontSize: 36.sp,
    fontWeight: FontWeight.bold,
  ),
  displaySmall: TextStyle(
    letterSpacing: 0,
    fontSize: 32.sp,
    fontWeight: FontWeight.bold,
  ),
  headlineLarge: TextStyle(
    letterSpacing: 0,
    fontSize: 32.sp,
    fontWeight: FontWeight.bold,
  ),
  headlineMedium: TextStyle(
    letterSpacing: 0,
    fontSize: 28.sp,
    fontWeight: FontWeight.bold,
  ),
  headlineSmall: TextStyle(
    letterSpacing: 0,
    fontSize: 24.sp,
    fontWeight: FontWeight.bold,
  ),
  titleLarge: TextStyle(
    letterSpacing: 0,
    fontSize: 24.sp,
    fontWeight: FontWeight.w400,
  ),
  titleMedium: TextStyle(
    letterSpacing: 0,
    fontSize: 20.sp,
    fontWeight: FontWeight.w400,
  ),
  titleSmall: TextStyle(
    letterSpacing: 0,
    fontSize: 16.sp,
    fontWeight: FontWeight.w400,
  ),
  labelLarge: TextStyle(
    letterSpacing: 0,
    fontSize: 20.sp,
    fontWeight: FontWeight.w400,
  ),
  labelMedium: TextStyle(
    letterSpacing: 0,
    fontSize: 18.sp,
    fontWeight: FontWeight.w400,
  ),
  labelSmall: TextStyle(
    letterSpacing: 0,
    fontSize: 16.sp,
    fontWeight: FontWeight.w400,
  ),
  bodyLarge: TextStyle(
    letterSpacing: 0,
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
  ),
  bodyMedium: TextStyle(
    letterSpacing: 0,
    fontSize: 12.sp,
    fontWeight: FontWeight.w400,
  ),
  bodySmall: TextStyle(
    letterSpacing: 0,
    fontSize: 11.sp,
    fontWeight: FontWeight.w400,
  ),
).apply(
  bodyColor: RegalColors.licoriceBlack,
  displayColor: RegalColors.licoriceBlack,
  fontFamily: 'Montserrat',
  package: 'regal',
);
