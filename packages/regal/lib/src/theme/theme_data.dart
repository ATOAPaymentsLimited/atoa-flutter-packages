// coverage:ignore-file
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:regal/regal.dart';

/// The theme of the application.
final kThemeData = ThemeData.light().copyWith(
  primaryColor: RegalColors.vividRed,
  primaryColorDark: RegalColors.claretRed,
  scaffoldBackgroundColor: const Color(0xffffffff),
  colorScheme: ColorScheme.fromSeed(
    seedColor: RegalColors.vividRed,
    onPrimary: RegalColors.darkGrey,
    error: Colors.red,
  ),
  textTheme: _kTextTheme,
  appBarTheme: AppBarTheme(
    systemOverlayStyle: SystemUiOverlayStyle.dark,
    color: Colors.transparent,
    elevation: 0,
    iconTheme: const IconThemeData(
      color: RegalColors.claretRed,
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
    iconColor: RegalColors.claretRed,
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12.r),
      borderSide: const BorderSide(color: Colors.redAccent),
    ),
    errorMaxLines: 2,
    hintStyle: _kTextTheme.labelMedium?.copyWith(
      color: RegalColors.claretRed.withOpacity(0.6),
      height: 1.3,
    ),
    errorStyle: _kTextTheme.bodyMedium?.copyWith(
      color: RegalColors.vividRed,
    ),
    isCollapsed: true,
    prefixIconColor: RegalColors.claretRed,
    suffixIconColor: RegalColors.claretRed,
  ),
  textSelectionTheme:
      const TextSelectionThemeData(cursorColor: RegalColors.claretRed),
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      shape: const StadiumBorder(),
      foregroundColor: RegalColors.vividRed,
      disabledForegroundColor: RegalColors.disabledVividRed,
      textStyle: _kTextTheme.labelSmall?.copyWith(
        color: RegalColors.vividRed,
        fontWeight: FontWeight.w700,
      ),
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      shape: const StadiumBorder(),
      backgroundColor: RegalColors.vividRed,
      disabledBackgroundColor: RegalColors.disabledVividRed,
      disabledForegroundColor: Colors.white,
      fixedSize: Size.fromHeight(60.sp),
      textStyle: _kTextTheme.labelSmall?.copyWith(
        color: Colors.white,
        fontWeight: FontWeight.w700,
        height: 1.2,
        letterSpacing: 1.12,
      ),
    ),
  ),
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      foregroundColor: RegalColors.vividRed,
      disabledForegroundColor: RegalColors.disabledVividRed,
      textStyle: _kTextTheme.labelSmall?.copyWith(
        color: RegalColors.vividRed,
        fontWeight: FontWeight.w700,
        height: 1.2,
        letterSpacing: 1.12,
      ),
      minimumSize: Size(double.infinity, 60.sp),
      maximumSize: Size(double.infinity, 60.sp),
      side: const BorderSide(
        color: RegalColors.vividRed,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(100.w),
      ),
    ).copyWith(
      side: MaterialStateProperty.resolveWith(
        (states) {
          if (states.contains(MaterialState.disabled)) {
            return const BorderSide(color: RegalColors.disabledVividRed);
          }
          return const BorderSide(color: RegalColors.vividRed);
        },
      ),
    ),
  ),
  iconTheme: const IconThemeData(
    color: RegalColors.claretRed,
  ),
  checkboxTheme: CheckboxThemeData(
    checkColor: MaterialStateProperty.all(Colors.white),
    fillColor: MaterialStateProperty.all(RegalColors.claretRed),
    shape: RoundedRectangleBorder(
      side: const BorderSide(color: RegalColors.claretRed),
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

final kDarkThemData = kThemeData.copyWith(
  primaryColor: RegalColors.vividRed,
  primaryColorDark: RegalColors.vividRed,
  scaffoldBackgroundColor: RegalColors.licoriceBlack,
  brightness: Brightness.dark,
  colorScheme: ColorScheme.fromSeed(
    seedColor: RegalColors.vividRed,
    primary: RegalColors.claretRed,
    onPrimary: RegalColors.darkGrey,
    brightness: Brightness.dark,
    error: Colors.red,
  ),
  textTheme: _kTextTheme.apply(
    bodyColor: RegalColors.darkGrey,
    displayColor: Colors.white,
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: RegalColors.licoriceBlack,
    actionsIconTheme: IconThemeData(
      color: RegalColors.darkGrey,
    ),
    centerTitle: true,
  ),
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      foregroundColor: RegalColors.darkGrey,
      shape: const StadiumBorder(),
      disabledForegroundColor: RegalColors.grey.shade40,
      textStyle: _kTextTheme.labelSmall?.copyWith(
        color: RegalColors.darkGrey,
        fontWeight: FontWeight.w700,
      ),
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      shape: const StadiumBorder(),
      backgroundColor: RegalColors.vividRed,
      disabledBackgroundColor: RegalColors.disabledDarkVividRed,
      foregroundColor: RegalColors.darkGrey,
      fixedSize: Size.fromHeight(60.sp),
      textStyle: _kTextTheme.labelSmall?.copyWith(
        color: RegalColors.darkGrey,
        fontWeight: FontWeight.w700,
        height: 1.2,
        letterSpacing: 1.12,
      ),
    ),
  ),
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      foregroundColor: RegalColors.darkGrey,
      disabledForegroundColor: RegalColors.grey.shade40,
      textStyle: _kTextTheme.labelSmall?.copyWith(
        color: RegalColors.vividRed,
        fontWeight: FontWeight.w700,
        height: 1.2,
        letterSpacing: 1.12,
      ),
      maximumSize: Size.fromHeight(60.sp),
      minimumSize: Size.fromHeight(60.sp),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(100.w),
      ),
    ).copyWith(
      side: MaterialStateProperty.resolveWith(
        (states) {
          if (states.contains(MaterialState.disabled)) {
            return BorderSide(color: RegalColors.grey.shade40);
          }
          return const BorderSide(color: RegalColors.darkGrey);
        },
      ),
    ),
  ),
);

final _kTextTheme = GoogleFonts.montserratTextTheme(
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
    bodyColor: RegalColors.claretRed,
    displayColor: RegalColors.claretRed,
  ),
);
