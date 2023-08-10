// coverage:ignore-file
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:regal/regal.dart';
import 'package:regal/src/theme/theme.dart';

/// The theme of the application.
final kThemeData = ThemeData.light().copyWith(
  primaryColor: RegalColors.vividRed,
  primaryColorDark: RegalColors.claretRed,
  scaffoldBackgroundColor: RegalColors.snowWhite,
  cardColor: RegalColors.snowWhite,
  extensions: [
    VividRedX(
      tint05: RegalColors.vividRed.tint05,
      tint10: RegalColors.vividRed.tint10,
      tint20: RegalColors.vividRed.tint20,
      shade40: RegalColors.vividRed.shade40,
      shade60: RegalColors.vividRed.shade60,
      shade80: RegalColors.vividRed.shade80,
    ),
    GreyX(
      shade05: RegalColors.grey.shade05,
      shade10: RegalColors.grey.shade10,
      shade20: RegalColors.grey.shade20,
      shade40: RegalColors.grey.shade40,
      shade60: RegalColors.grey.shade60,
      shade80: RegalColors.grey.shade80,
    ),
    const RegalColorsX(
      claretRed: RegalColors.claretRed,
      vividRed: RegalColors.vividRed,
      snowWhite: RegalColors.snowWhite,
      licoriceBlack: RegalColors.licoriceBlack,
      grey: RegalColors.grey,
      pink: RegalColors.vividRed,
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
    backgroundColor: RegalColors.snowWhite,
    centerTitle: true,
    elevation: 0,
    iconTheme: const IconThemeData(
      color: RegalColors.claretRed,
    ),
    titleTextStyle: GoogleFonts.montserrat(
      color: RegalColors.licoriceBlack,
      fontSize: 20.sp,
      fontWeight: FontWeight.bold,
    ),
  ),
  progressIndicatorTheme: const ProgressIndicatorThemeData(color: Colors.white),
  inputDecorationTheme: InputDecorationTheme(
    isDense: true,
    contentPadding: Spacing.large.all,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(14.sp),
      borderSide: BorderSide(color: RegalColors.grey.shade10),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(14.sp),
      borderSide: BorderSide(color: RegalColors.grey.shade10),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(14.sp),
      borderSide: const BorderSide(color: RegalColors.licoriceBlack),
    ),
    disabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(14.sp),
      borderSide: BorderSide(color: RegalColors.grey.shade10),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(14.sp),
      borderSide: const BorderSide(
        color: RegalColors.darkOrange,
      ),
    ),
    errorMaxLines: 2,
    hintStyle: kInterTextTheme.labelSmall?.copyWith(
      color: RegalColors.grey.shade40,
      height: 1.3,
    ),
    errorStyle: kInterTextTheme.bodyMedium?.copyWith(
      color: RegalColors.darkOrange,
    ),
    isCollapsed: true,
    labelStyle:
        kInterTextTheme.labelSmall?.copyWith(color: RegalColors.licoriceBlack),
    floatingLabelStyle:
        kInterTextTheme.bodyLarge?.copyWith(color: RegalColors.licoriceBlack),
  ),
  textSelectionTheme:
      const TextSelectionThemeData(cursorColor: RegalColors.claretRed),
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      shape: const StadiumBorder(),
      foregroundColor: RegalColors.vividRed,
      disabledForegroundColor: RegalColors.disabledVividRed,
      textStyle: GoogleFonts.montserrat(
        color: RegalColors.vividRed,
        fontSize: 16.sp,
        fontWeight: FontWeight.bold,
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
      textStyle: GoogleFonts.montserrat(
        color: RegalColors.snowWhite,
        fontSize: 16.sp,
        fontWeight: FontWeight.bold,
      ),
    ),
  ),
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      foregroundColor: RegalColors.vividRed,
      disabledForegroundColor: RegalColors.disabledVividRed,
      textStyle: GoogleFonts.montserrat(
        color: RegalColors.vividRed,
        fontSize: 16.sp,
        fontWeight: FontWeight.bold,
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
  cardColor: RegalColors.licoriceBlack,
  brightness: Brightness.dark,
  extensions: [
    VividRedX(
      tint05: RegalColors.darkVividRed.tint05,
      tint10: RegalColors.darkVividRed.tint10,
      tint20: RegalColors.darkVividRed.tint20,
      shade40: RegalColors.darkVividRed.shade40,
      shade60: RegalColors.darkVividRed.shade60,
      shade80: RegalColors.darkVividRed.shade80,
    ),
    GreyX(
      shade05: RegalColors.darkGrey.shade05,
      shade10: RegalColors.darkGrey.shade10,
      shade20: RegalColors.darkGrey.shade20,
      shade40: RegalColors.darkGrey.shade40,
      shade60: RegalColors.darkGrey.shade60,
      shade80: RegalColors.darkGrey.shade80,
    ),
    const RegalColorsX(
      claretRed: RegalColors.claretRed,
      vividRed: RegalColors.vividRed,
      snowWhite: RegalColors.licoriceBlack,
      licoriceBlack: RegalColors.snowWhite,
      grey: RegalColors.darkGrey,
      pink: RegalColors.snowWhite,
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
  appBarTheme: AppBarTheme(
    backgroundColor: RegalColors.licoriceBlack,
    systemOverlayStyle: SystemUiOverlayStyle.light,
    actionsIconTheme: const IconThemeData(
      color: RegalColors.snowWhite,
    ),
    elevation: 0,
    centerTitle: true,
    titleTextStyle: GoogleFonts.montserrat(
      color: RegalColors.snowWhite,
      fontSize: 20.sp,
      fontWeight: FontWeight.bold,
    ),
  ),
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      foregroundColor: RegalColors.vividRed,
      shape: const StadiumBorder(),
      disabledForegroundColor: RegalColors.disabledVividRed,
      textStyle: GoogleFonts.montserrat(
        color: RegalColors.vividRed,
        fontSize: 16.sp,
        fontWeight: FontWeight.bold,
      ),
    ).copyWith(
      elevation: const MaterialStatePropertyAll(0),
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      shape: const StadiumBorder(),
      backgroundColor: RegalColors.vividRed,
      disabledBackgroundColor: RegalColors.disabledDarkVividRed,
      foregroundColor: RegalColors.snowWhite,
      textStyle: GoogleFonts.montserrat(
        color: RegalColors.snowWhite,
        fontSize: 16.sp,
        fontWeight: FontWeight.bold,
      ),
    ).copyWith(
      elevation: const MaterialStatePropertyAll(0),
    ),
  ),
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      foregroundColor: RegalColors.snowWhite,
      disabledForegroundColor: RegalColors.grey.shade40,
      textStyle: GoogleFonts.montserrat(
        color: RegalColors.vividRed,
        fontSize: 16.sp,
        fontWeight: FontWeight.bold,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(100.w),
      ),
    ).copyWith(
      elevation: const MaterialStatePropertyAll(0),
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
  inputDecorationTheme: InputDecorationTheme(
    isDense: true,
    contentPadding: Spacing.large.all,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(14.sp),
      borderSide: BorderSide(color: RegalColors.darkGrey.shade10),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(14.sp),
      borderSide: BorderSide(color: RegalColors.darkGrey.shade10),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(14.sp),
      borderSide: const BorderSide(color: RegalColors.snowWhite),
    ),
    disabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(14.sp),
      borderSide: BorderSide(color: RegalColors.darkGrey.shade10),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(14.sp),
      borderSide: const BorderSide(
        color: RegalColors.darkOrange,
      ),
    ),
    errorMaxLines: 2,
    hintStyle: kInterTextTheme.labelSmall?.copyWith(
      color: RegalColors.darkGrey.shade40,
      height: 1.3,
    ),
    errorStyle: kInterTextTheme.bodyMedium?.copyWith(
      color: RegalColors.darkOrange,
    ),
    isCollapsed: true,
    labelStyle: kInterTextTheme.labelSmall?.copyWith(
      color: RegalColors.snowWhite,
      fontWeight: FontWeight.w600,
    ),
    floatingLabelStyle:
        kInterTextTheme.bodyLarge?.copyWith(color: RegalColors.snowWhite),
  ),
);
