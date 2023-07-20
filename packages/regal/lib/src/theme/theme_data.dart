// coverage:ignore-file
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:regal/src/theme/theme.dart';

/// The theme of the application.
final kThemeData = ThemeData.light().copyWith(
  primaryColor: RegalColors.vividRed,
  primaryColorDark: RegalColors.claretRed,
  scaffoldBackgroundColor: const Color(0xffffffff),
  extensions: [
    const VividRedX(
      tint05: Color(0xFFFEF4F6),
      tint10: Color(0xFFFCE9EC),
      tint20: Color(0xFFFAD4DA),
      shade40: Color(0xFF5B0F1C),
      shade60: Color(0xFF89172A),
      shade80: Color(0xFFB61E38),
    ),
    const GreyX(
      shade05: Color(0xFFF2F2F2),
      shade10: Color(0xFFE5E5E5),
      shade20: Color(0xFFCCCCCC),
      shade40: Color(0xFF999999),
      shade60: Color(0xFF666666),
      shade80: Color(0xFF333333),
    ),
    const RegalColorsX(
      claretRed: RegalColors.claretRed,
      vividRed: RegalColors.vividRed,
      snowWhite: RegalColors.snowWhite,
      licoriceBlack: RegalColors.licoriceBlack,
    ),
    MontserratX(
      displayLarge: GoogleFonts.montserrat(
        color: RegalColors.licoriceBlack,
        fontSize: 48.sp,
        fontWeight: FontWeight.bold,
      ),
      displayMedium: GoogleFonts.montserrat(
        color: RegalColors.licoriceBlack,
        fontSize: 36.sp,
        fontWeight: FontWeight.bold,
      ),
      displaySmall: GoogleFonts.montserrat(
        color: RegalColors.licoriceBlack,
        fontSize: 32.sp,
        fontWeight: FontWeight.bold,
      ),
      headlineLarge: GoogleFonts.montserrat(
        color: RegalColors.licoriceBlack,
        fontSize: 32.sp,
        fontWeight: FontWeight.bold,
      ),
      headlineMedium: GoogleFonts.montserrat(
        color: RegalColors.licoriceBlack,
        fontSize: 28.sp,
        fontWeight: FontWeight.bold,
      ),
      headlineSmall: GoogleFonts.montserrat(
        color: RegalColors.licoriceBlack,
        fontSize: 24.sp,
        fontWeight: FontWeight.bold,
      ),
      titleLarge: GoogleFonts.montserrat(
        color: RegalColors.licoriceBlack,
        fontSize: 24.sp,
        fontWeight: FontWeight.w400,
      ),
      titleMedium: GoogleFonts.montserrat(
        color: RegalColors.licoriceBlack,
        fontSize: 20.sp,
        fontWeight: FontWeight.w400,
      ),
      titleSmall: GoogleFonts.montserrat(
        color: RegalColors.licoriceBlack,
        fontSize: 16.sp,
        fontWeight: FontWeight.w400,
      ),
      labelLarge: GoogleFonts.montserrat(
        color: RegalColors.licoriceBlack,
        fontSize: 20.sp,
        fontWeight: FontWeight.w400,
      ),
      labelMedium: GoogleFonts.montserrat(
        color: RegalColors.licoriceBlack,
        fontSize: 18.sp,
        fontWeight: FontWeight.w400,
      ),
      labelSmall: GoogleFonts.montserrat(
        color: RegalColors.licoriceBlack,
        fontSize: 16.sp,
        fontWeight: FontWeight.w400,
      ),
      bodyLarge: GoogleFonts.montserrat(
        color: RegalColors.licoriceBlack,
        fontSize: 14.sp,
        fontWeight: FontWeight.w400,
      ),
      bodyMedium: GoogleFonts.montserrat(
        color: RegalColors.licoriceBlack,
        fontSize: 12.sp,
        fontWeight: FontWeight.w400,
      ),
      bodySmall: GoogleFonts.montserrat(
        color: RegalColors.licoriceBlack,
        fontSize: 11.sp,
        fontWeight: FontWeight.w400,
      ),
    ),
  ],
  colorScheme: ColorScheme.fromSeed(
    seedColor: RegalColors.vividRed,
    onPrimary: RegalColors.snowWhite,
    error: RegalColors.darkOrange,
    primaryContainer: RegalColors.vividRed,
    onPrimaryContainer: RegalColors.claretRed,
  ),
  textTheme: kInterTextTheme,
  appBarTheme: AppBarTheme(
    systemOverlayStyle: SystemUiOverlayStyle.dark,
    color: Colors.transparent,
    elevation: 0,
    iconTheme: const IconThemeData(
      color: RegalColors.claretRed,
    ),
    titleTextStyle: kInterTextTheme.labelLarge!.copyWith(
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
    hintStyle: kInterTextTheme.labelMedium?.copyWith(
      color: RegalColors.claretRed.withOpacity(0.6),
      height: 1.3,
    ),
    errorStyle: kInterTextTheme.bodyMedium?.copyWith(
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
      textStyle: kInterTextTheme.labelSmall?.copyWith(
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
      textStyle: kInterTextTheme.labelSmall?.copyWith(
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
      textStyle: kInterTextTheme.labelSmall?.copyWith(
        color: RegalColors.vividRed,
        fontWeight: FontWeight.w700,
        height: 1.2,
        letterSpacing: 1.12,
      ),
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
    backgroundColor: Colors.white,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(32.w),
        topRight: Radius.circular(32.w),
      ),
    ),
  ),
  dialogTheme: DialogTheme(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
    titleTextStyle: kInterTextTheme.labelLarge?.copyWith(
      fontWeight: FontWeight.bold,
    ),
    contentTextStyle: kInterTextTheme.bodyLarge,
  ),
);

final kDarkThemData = kThemeData.copyWith(
  primaryColor: RegalColors.vividRed,
  primaryColorDark: RegalColors.vividRed,
  scaffoldBackgroundColor: RegalColors.licoriceBlack,
  brightness: Brightness.dark,
  extensions: [
    const VividRedX(
      tint05: Color(0xFF5B0F1C),
      tint10: Color(0xFF89172A),
      tint20: Color(0xFFB61E38),
      shade40: Color(0xFFFEF4F6),
      shade60: Color(0xFFFCE9EC),
      shade80: Color(0xFFFAD4DA),
    ),
    const GreyX(
      shade05: Color(0xFF333333),
      shade10: Color(0xFF666666),
      shade20: Color(0xFF999999),
      shade40: Color(0xFFCCCCCC),
      shade60: Color(0xFFE5E5E5),
      shade80: Color(0xFFF2F2F2),
    ),
    const RegalColorsX(
      claretRed: RegalColors.claretRed,
      vividRed: RegalColors.vividRed,
      snowWhite: RegalColors.licoriceBlack,
      licoriceBlack: RegalColors.snowWhite,
    ),
    MontserratX(
      displayLarge: GoogleFonts.montserrat(
        color: RegalColors.snowWhite,
        fontSize: 48.sp,
        fontWeight: FontWeight.bold,
      ),
      displayMedium: GoogleFonts.montserrat(
        color: RegalColors.snowWhite,
        fontSize: 36.sp,
        fontWeight: FontWeight.bold,
      ),
      displaySmall: GoogleFonts.montserrat(
        color: RegalColors.snowWhite,
        fontSize: 32.sp,
        fontWeight: FontWeight.bold,
      ),
      headlineLarge: GoogleFonts.montserrat(
        color: RegalColors.snowWhite,
        fontSize: 32.sp,
        fontWeight: FontWeight.bold,
      ),
      headlineMedium: GoogleFonts.montserrat(
        color: RegalColors.snowWhite,
        fontSize: 28.sp,
        fontWeight: FontWeight.bold,
      ),
      headlineSmall: GoogleFonts.montserrat(
        color: RegalColors.snowWhite,
        fontSize: 24.sp,
        fontWeight: FontWeight.bold,
      ),
      titleLarge: GoogleFonts.montserrat(
        color: RegalColors.snowWhite,
        fontSize: 24.sp,
        fontWeight: FontWeight.w400,
      ),
      titleMedium: GoogleFonts.montserrat(
        color: RegalColors.snowWhite,
        fontSize: 20.sp,
        fontWeight: FontWeight.w400,
      ),
      titleSmall: GoogleFonts.montserrat(
        color: RegalColors.snowWhite,
        fontSize: 16.sp,
        fontWeight: FontWeight.w400,
      ),
      labelLarge: GoogleFonts.montserrat(
        color: RegalColors.snowWhite,
        fontSize: 20.sp,
        fontWeight: FontWeight.w400,
      ),
      labelMedium: GoogleFonts.montserrat(
        color: RegalColors.snowWhite,
        fontSize: 18.sp,
        fontWeight: FontWeight.w400,
      ),
      labelSmall: GoogleFonts.montserrat(
        color: RegalColors.snowWhite,
        fontSize: 16.sp,
        fontWeight: FontWeight.w400,
      ),
      bodyLarge: GoogleFonts.montserrat(
        color: RegalColors.snowWhite,
        fontSize: 14.sp,
        fontWeight: FontWeight.w400,
      ),
      bodyMedium: GoogleFonts.montserrat(
        color: RegalColors.snowWhite,
        fontSize: 12.sp,
        fontWeight: FontWeight.w400,
      ),
      bodySmall: GoogleFonts.montserrat(
        color: RegalColors.snowWhite,
        fontSize: 11.sp,
        fontWeight: FontWeight.w400,
      ),
    ),
  ],
  colorScheme: ColorScheme.fromSeed(
    seedColor: RegalColors.vividRed,
    primary: RegalColors.claretRed,
    onPrimary: RegalColors.snowWhite,
    brightness: Brightness.dark,
    error: RegalColors.darkOrange,
    primaryContainer: RegalColors.claretRed,
    onPrimaryContainer: RegalColors.snowWhite,
  ),
  textTheme: kInterTextTheme.apply(
    bodyColor: RegalColors.snowWhite,
    displayColor: Colors.white,
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: RegalColors.licoriceBlack,
    actionsIconTheme: IconThemeData(
      color: RegalColors.snowWhite,
    ),
    centerTitle: true,
  ),
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      foregroundColor: RegalColors.vividRed,
      shape: const StadiumBorder(),
      disabledForegroundColor: RegalColors.disabledVividRed,
      textStyle: kInterTextTheme.labelSmall?.copyWith(
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
      disabledBackgroundColor: RegalColors.disabledDarkVividRed,
      foregroundColor: RegalColors.snowWhite,
      textStyle: kInterTextTheme.labelSmall?.copyWith(
        color: RegalColors.snowWhite,
        fontWeight: FontWeight.w700,
        height: 1.2,
        letterSpacing: 1.12,
      ),
    ),
  ),
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      foregroundColor: RegalColors.snowWhite,
      disabledForegroundColor: RegalColors.grey.shade40,
      textStyle: kInterTextTheme.labelSmall?.copyWith(
        color: RegalColors.vividRed,
        fontWeight: FontWeight.w700,
        height: 1.2,
        letterSpacing: 1.12,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(100.w),
      ),
    ).copyWith(
      side: MaterialStateProperty.resolveWith(
        (states) {
          if (states.contains(MaterialState.disabled)) {
            return BorderSide(color: RegalColors.grey.shade40);
          }
          return const BorderSide(color: RegalColors.snowWhite);
        },
      ),
    ),
  ),
  bottomSheetTheme: BottomSheetThemeData(
    backgroundColor: RegalColors.licoriceBlack,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(32.w),
        topRight: Radius.circular(32.w),
      ),
    ),
  ),
);
