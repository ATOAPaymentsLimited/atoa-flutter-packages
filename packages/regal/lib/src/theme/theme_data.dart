// coverage:ignore-file
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:regal/regal.dart';

/// The theme of the application.
final kThemeData = ThemeData.light().copyWith(
  primaryColor: AtoaColors.indigo,
  primaryColorDark: AtoaColors.yankeesBlue,
  scaffoldBackgroundColor: const Color(0xffffffff),
  textTheme: GoogleFonts.latoTextTheme(),
  appBarTheme: const AppBarTheme(
    systemOverlayStyle: SystemUiOverlayStyle.dark,
    color: Colors.transparent,
    elevation: 0,
    iconTheme: IconThemeData(
      color: AtoaColors.yankeesBlue,
    ),
  ),
  inputDecorationTheme: InputDecorationTheme(
    floatingLabelBehavior: FloatingLabelBehavior.never,
    alignLabelWithHint: true,
    isDense: true,
    contentPadding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 14.0.h),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12.r),
      borderSide: BorderSide(color: AtoaColors.grey.shade40),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12.r),
      borderSide: BorderSide(color: AtoaColors.grey.shade40),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12.r),
      borderSide: BorderSide(color: AtoaColors.grey.shade40),
    ),
    iconColor: AtoaColors.yankeesBlue,
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12.r),
      borderSide: const BorderSide(color: Colors.redAccent),
    ),
    errorMaxLines: 2,
    hintStyle: TextStyle(
      color: AtoaColors.yankeesBlue.withOpacity(0.6),
      fontSize: 18.sp,
      height: 1.3,
    ),
    errorStyle: TextStyle(fontSize: 12.sp),
    isCollapsed: true,
    prefixIconColor: AtoaColors.yankeesBlue,
    suffixIconColor: AtoaColors.yankeesBlue,
    prefixStyle: const TextStyle(color: AtoaColors.yankeesBlue),
    suffixStyle: const TextStyle(color: AtoaColors.yankeesBlue),
  ),
  textSelectionTheme:
      const TextSelectionThemeData(cursorColor: AtoaColors.yankeesBlue),
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      foregroundColor: AtoaColors.grey.shade10,
      backgroundColor: AtoaColors.indigo,
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
      backgroundColor: AtoaColors.indigo,
      disabledBackgroundColor: AtoaColors.grey.disabled,
    ),
  ),
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      foregroundColor: AtoaColors.indigo,
      textStyle: const TextStyle(
        color: AtoaColors.indigo,
        fontSize: 14,
        fontWeight: FontWeight.bold,
        letterSpacing: 1.12,
        fontFamily: 'Lato',
      ),
      minimumSize: Size(double.infinity, 48.w),
      maximumSize: Size(double.infinity, 60.w),
      side: const BorderSide(
        color: AtoaColors.indigo,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(100.w),
      ),
    ).copyWith(
      side: MaterialStateProperty.resolveWith(
        (states) {
          if (states.contains(MaterialState.disabled)) {
            return BorderSide(color: AtoaColors.grey.disabled);
          }
          return const BorderSide(color: AtoaColors.indigo);
        },
      ),
    ),
  ),
  iconTheme: const IconThemeData(
    color: AtoaColors.indigo,
  ),
  checkboxTheme: CheckboxThemeData(
    checkColor: MaterialStateProperty.all(Colors.white),
    fillColor: MaterialStateProperty.all(AtoaColors.indigo),
    shape: RoundedRectangleBorder(
      side: const BorderSide(color: AtoaColors.indigo),
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
      color: AtoaColors.yankeesBlue,
      fontWeight: FontWeight.bold,
    ),
    contentTextStyle: TextStyle(
      fontSize: 14.0.sp,
      color: AtoaColors.yankeesBlue,
    ),
  ),
);
