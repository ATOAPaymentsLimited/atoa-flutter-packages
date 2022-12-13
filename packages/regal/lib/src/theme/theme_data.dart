// coverage:ignore-file
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:regal/regal.dart';

/// The theme of the application.
final kThemeData = ThemeData.light().copyWith(
  primaryColor: RegalColors.indigo,
  primaryColorDark: RegalColors.indigo,
  scaffoldBackgroundColor: const Color(0xffffffff),
  textTheme: _kTextTheme,
  appBarTheme: AppBarTheme(
    systemOverlayStyle: SystemUiOverlayStyle.dark,
    color: Colors.transparent,
    elevation: 0,
    iconTheme: const IconThemeData(
      color: RegalColors.indigo,
    ),
    titleTextStyle: _kTextTheme.labelLarge!.copyWith(
      fontWeight: FontWeight.bold,
    ),
  ),
  progressIndicatorTheme: const ProgressIndicatorThemeData(color: Colors.white),
  inputDecorationTheme: InputDecorationTheme(
    floatingLabelBehavior: FloatingLabelBehavior.never,
    alignLabelWithHint: true,
    isDense: true,
    contentPadding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 14.0.h),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12.r),
      borderSide: BorderSide(color: RegalColors.grey.shade40),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12.r),
      borderSide: BorderSide(color: RegalColors.grey.shade40),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12.r),
      borderSide: BorderSide(color: RegalColors.grey.shade40),
    ),
    iconColor: RegalColors.indigo,
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12.r),
      borderSide: const BorderSide(color: Colors.redAccent),
    ),
    errorMaxLines: 2,
    hintStyle: _kTextTheme.labelMedium?.copyWith(
      color: RegalColors.indigo.withOpacity(0.6),
      height: 1.3,
    ),
    errorStyle: _kTextTheme.bodyMedium?.copyWith(
      color: RegalColors.red,
    ),
    isCollapsed: true,
    prefixIconColor: RegalColors.indigo,
    suffixIconColor: RegalColors.indigo,
  ),
  textSelectionTheme:
      const TextSelectionThemeData(cursorColor: RegalColors.indigo),
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      foregroundColor: Colors.white,
      backgroundColor: RegalColors.celticBlue,
      disabledForegroundColor: Colors.white.withOpacity(0.38),
      textStyle: _kTextTheme.labelSmall?.copyWith(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        height: 1.1,
      ),
      minimumSize: Size(double.infinity, 48.w),
      maximumSize: Size(double.infinity, 60.w),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(100.w),
      ),
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      shape: const StadiumBorder(),
      backgroundColor: RegalColors.celticBlue,
      disabledBackgroundColor: RegalColors.grey.shade20,
      disabledForegroundColor: Colors.white,
      fixedSize: Size.fromHeight(60.sp),
      textStyle: _kTextTheme.labelSmall?.copyWith(
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
    ),
  ),
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      foregroundColor: RegalColors.celticBlue,
      backgroundColor: Colors.white,
      fixedSize: Size.fromHeight(60.sp),
      textStyle: _kTextTheme.bodyLarge?.copyWith(
        color: RegalColors.celticBlue,
        fontWeight: FontWeight.bold,
        letterSpacing: 1.12,
      ),
      minimumSize: Size(double.infinity, 48.w),
      maximumSize: Size(double.infinity, 60.w),
      side: const BorderSide(
        color: RegalColors.celticBlue,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(100.w),
      ),
    ).copyWith(
      side: MaterialStateProperty.resolveWith(
        (states) {
          if (states.contains(MaterialState.disabled)) {
            return BorderSide(color: RegalColors.grey.disabled);
          }
          return const BorderSide(color: RegalColors.celticBlue);
        },
      ),
    ),
  ),
  iconTheme: const IconThemeData(
    color: RegalColors.indigo,
  ),
  checkboxTheme: CheckboxThemeData(
    checkColor: MaterialStateProperty.all(Colors.white),
    fillColor: MaterialStateProperty.all(RegalColors.indigo),
    shape: RoundedRectangleBorder(
      side: const BorderSide(color: RegalColors.indigo),
      borderRadius: BorderRadius.circular(4.r),
    ),
    visualDensity: VisualDensity.compact,
  ),
  bottomSheetTheme: BottomSheetThemeData(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(32.w),
        topRight: Radius.circular(32.w),
      ),
    ),
  ),
  dialogTheme: DialogTheme(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
    titleTextStyle: _kTextTheme.labelLarge?.copyWith(
      fontWeight: FontWeight.bold,
    ),
    contentTextStyle: _kTextTheme.bodyLarge,
  ),
);

final _kTextTheme = GoogleFonts.latoTextTheme(
  TextTheme(
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
    titleLarge: TextStyle(
      letterSpacing: 0,
      fontSize: 24.sp,
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
    bodyColor: RegalColors.indigo,
    displayColor: RegalColors.indigo,
  ),
);
