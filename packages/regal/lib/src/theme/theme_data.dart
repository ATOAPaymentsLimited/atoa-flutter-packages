// coverage:ignore-file
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:regal/regal.dart';

/// The theme of the application.
final kThemeData = ThemeData.light().copyWith(
  primaryColor: RegalColors.indigo,
  primaryColorDark: RegalColors.yankeesBlue,
  scaffoldBackgroundColor: const Color(0xffffffff),
  textTheme: GoogleFonts.latoTextTheme(),
  appBarTheme: const AppBarTheme(
    systemOverlayStyle: SystemUiOverlayStyle.dark,
    color: Colors.transparent,
    elevation: 0,
    iconTheme: IconThemeData(
      color: RegalColors.yankeesBlue,
    ),
  ),
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
    iconColor: RegalColors.yankeesBlue,
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12.r),
      borderSide: const BorderSide(color: Colors.redAccent),
    ),
    errorMaxLines: 2,
    hintStyle: TextStyle(
      color: RegalColors.yankeesBlue.withOpacity(0.6),
      fontSize: 18.sp,
      height: 1.3,
    ),
    errorStyle: TextStyle(fontSize: 12.sp),
    isCollapsed: true,
    prefixIconColor: RegalColors.yankeesBlue,
    suffixIconColor: RegalColors.yankeesBlue,
    prefixStyle: const TextStyle(color: RegalColors.yankeesBlue),
    suffixStyle: const TextStyle(color: RegalColors.yankeesBlue),
  ),
  textSelectionTheme:
      const TextSelectionThemeData(cursorColor: RegalColors.yankeesBlue),
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      foregroundColor: RegalColors.grey.shade10,
      backgroundColor: RegalColors.indigo,
      disabledForegroundColor: Colors.white.withOpacity(0.38),
      textStyle: GoogleFonts.lato(
        color: Colors.white,
        fontSize: 16.sp,
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
      shape: const StadiumBorder(),
      backgroundColor: RegalColors.indigo,
      disabledBackgroundColor: RegalColors.grey.disabled,
    ),
  ),
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      foregroundColor: RegalColors.indigo,
      textStyle: const TextStyle(
        color: RegalColors.indigo,
        fontSize: 14,
        fontWeight: FontWeight.bold,
        letterSpacing: 1.12,
        fontFamily: 'Lato',
      ),
      minimumSize: Size(double.infinity, 48.w),
      maximumSize: Size(double.infinity, 60.w),
      side: const BorderSide(
        color: RegalColors.indigo,
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
          return const BorderSide(color: RegalColors.indigo);
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
    titleTextStyle: TextStyle(
      fontSize: 20.0.sp,
      color: RegalColors.yankeesBlue,
      fontWeight: FontWeight.bold,
    ),
    contentTextStyle: TextStyle(
      fontSize: 14.0.sp,
      color: RegalColors.yankeesBlue,
    ),
  ),
);
