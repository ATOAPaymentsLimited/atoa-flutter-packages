// coverage:ignore-file
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
      displayLarge: kMontserratTextTheme.displayLarge!.copyWith(
        color: RegalColors.licoriceBlack,
        fontSize: 48.sp,
        fontWeight: FontWeight.bold,
      ),
      displayMedium: kMontserratTextTheme.displayMedium!.copyWith(
        color: RegalColors.licoriceBlack,
        fontSize: 36.sp,
        fontWeight: FontWeight.bold,
      ),
      displaySmall: kMontserratTextTheme.displaySmall!.copyWith(
        color: RegalColors.licoriceBlack,
        fontSize: 32.sp,
        fontWeight: FontWeight.bold,
      ),
      headlineLarge: kMontserratTextTheme.headlineLarge!.copyWith(
        color: RegalColors.licoriceBlack,
        fontSize: 32.sp,
        fontWeight: FontWeight.bold,
      ),
      headlineMedium: kMontserratTextTheme.headlineMedium!.copyWith(
        color: RegalColors.licoriceBlack,
        fontSize: 28.sp,
        fontWeight: FontWeight.bold,
      ),
      headlineSmall: kMontserratTextTheme.headlineSmall!.copyWith(
        color: RegalColors.licoriceBlack,
        fontSize: 24.sp,
        fontWeight: FontWeight.bold,
      ),
      titleLarge: kMontserratTextTheme.titleLarge!.copyWith(
        color: RegalColors.licoriceBlack,
        fontSize: 24.sp,
        fontWeight: FontWeight.w400,
      ),
      titleMedium: kMontserratTextTheme.titleMedium!.copyWith(
        color: RegalColors.licoriceBlack,
        fontSize: 20.sp,
        fontWeight: FontWeight.w400,
      ),
      titleSmall: kMontserratTextTheme.titleSmall!.copyWith(
        color: RegalColors.licoriceBlack,
        fontSize: 16.sp,
        fontWeight: FontWeight.w400,
      ),
      labelLarge: kMontserratTextTheme.labelLarge!.copyWith(
        color: RegalColors.licoriceBlack,
        fontSize: 20.sp,
        fontWeight: FontWeight.w400,
      ),
      labelMedium: kMontserratTextTheme.labelMedium!.copyWith(
        color: RegalColors.licoriceBlack,
        fontSize: 18.sp,
        fontWeight: FontWeight.w400,
      ),
      labelSmall: kMontserratTextTheme.labelSmall!.copyWith(
        color: RegalColors.licoriceBlack,
        fontSize: 16.sp,
        fontWeight: FontWeight.w400,
      ),
      bodyLarge: kMontserratTextTheme.bodyLarge!.copyWith(
        color: RegalColors.licoriceBlack,
        fontSize: 14.sp,
        fontWeight: FontWeight.w400,
      ),
      bodyMedium: kMontserratTextTheme.bodyMedium!.copyWith(
        color: RegalColors.licoriceBlack,
        fontSize: 12.sp,
        fontWeight: FontWeight.w400,
      ),
      bodySmall: kMontserratTextTheme.bodySmall!.copyWith(
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
    titleTextStyle: TextStyle(
      color: RegalColors.licoriceBlack,
      fontFamily: 'Montserrat',
      package: 'regal',
      fontSize: 20.sp,
      fontWeight: FontWeight.bold,
    ),
    surfaceTintColor: RegalColors.snowWhite,
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
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      shape: const StadiumBorder(),
      foregroundColor: RegalColors.vividRed,
      disabledForegroundColor: RegalColors.disabledVividRed,
      textStyle: TextStyle(
        fontFamily: 'Montserrat',
        package: 'regal',
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
      foregroundColor: RegalColors.snowWhite,
      backgroundColor: RegalColors.vividRed,
      disabledBackgroundColor: RegalColors.disabledVividRed,
      disabledForegroundColor: Colors.white,
      fixedSize: Size.fromHeight(60.sp),
      textStyle: TextStyle(
        fontFamily: 'Montserrat',
        package: 'regal',
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
      textStyle: TextStyle(
        fontFamily: 'Montserrat',
        package: 'regal',
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
      side: WidgetStateProperty.resolveWith(
        (states) {
          if (states.contains(WidgetState.disabled)) {
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
    checkColor: WidgetStateProperty.all(Colors.white),
    fillColor: WidgetStateProperty.all(RegalColors.claretRed),
    shape: RoundedRectangleBorder(
      side: const BorderSide(color: RegalColors.claretRed),
      borderRadius: BorderRadius.circular(4.r),
    ),
    visualDensity: VisualDensity.compact,
  ),
  bottomSheetTheme: BottomSheetThemeData(
    backgroundColor: Colors.white,
    surfaceTintColor: RegalColors.snowWhite,
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
  datePickerTheme: DatePickerThemeData(
    backgroundColor: RegalColors.snowWhite,
    weekdayStyle: const TextStyle(color: RegalColors.vividRed),
    yearStyle: const TextStyle(color: RegalColors.licoriceBlack),
    dayForegroundColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.disabled)) {
        return RegalColors.grey.shade10;
      }
      if (states.contains(WidgetState.selected)) {
        return RegalColors.snowWhite;
      }
      return RegalColors.licoriceBlack;
    }),
    dayBackgroundColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.selected)) {
        return RegalColors.vividRed;
      }
      return Colors.transparent;
    }),
    yearForegroundColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.selected)) {
        return RegalColors.snowWhite;
      }
      if (states.contains(WidgetState.disabled)) {
        return RegalColors.grey.shade10;
      }

      return RegalColors.licoriceBlack;
    }),
    yearBackgroundColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.selected)) {
        return RegalColors.vividRed;
      }
      return Colors.transparent;
    }),
    todayBackgroundColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.selected)) {
        return RegalColors.vividRed;
      }
      return RegalColors.snowWhite;
    }),
    todayForegroundColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.selected)) {
        return RegalColors.snowWhite;
      }
      if (states.contains(WidgetState.disabled)) {
        return RegalColors.vividRed.withOpacity(0.40);
      }
      return RegalColors.vividRed;
    }),
    yearOverlayColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.disabled)) {
        return RegalColors.grey.shade60;
      }
      return RegalColors.licoriceBlack;
    }),
    headerForegroundColor: RegalColors.licoriceBlack,
  ),
  textSelectionTheme: TextSelectionThemeData(
    selectionColor: RegalColors.vividRed.withOpacity(0.40),
    selectionHandleColor: RegalColors.vividRed,
  ),
);

final kDarkThemeData = kThemeData.copyWith(
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
      displayLarge: kMontserratTextTheme.displayLarge!.copyWith(
        color: RegalColors.snowWhite,
        fontSize: 48.sp,
        fontWeight: FontWeight.bold,
      ),
      displayMedium: kMontserratTextTheme.displayMedium!.copyWith(
        color: RegalColors.snowWhite,
        fontSize: 36.sp,
        fontWeight: FontWeight.bold,
      ),
      displaySmall: kMontserratTextTheme.displaySmall!.copyWith(
        color: RegalColors.snowWhite,
        fontSize: 32.sp,
        fontWeight: FontWeight.bold,
      ),
      headlineLarge: kMontserratTextTheme.headlineLarge!.copyWith(
        color: RegalColors.snowWhite,
        fontSize: 32.sp,
        fontWeight: FontWeight.bold,
      ),
      headlineMedium: kMontserratTextTheme.headlineMedium!.copyWith(
        color: RegalColors.snowWhite,
        fontSize: 28.sp,
        fontWeight: FontWeight.bold,
      ),
      headlineSmall: kMontserratTextTheme.headlineSmall!.copyWith(
        color: RegalColors.snowWhite,
        fontSize: 24.sp,
        fontWeight: FontWeight.bold,
      ),
      titleLarge: kMontserratTextTheme.titleLarge!.copyWith(
        color: RegalColors.snowWhite,
        fontSize: 24.sp,
        fontWeight: FontWeight.w400,
      ),
      titleMedium: kMontserratTextTheme.titleMedium!.copyWith(
        fontSize: 20.sp,
        color: RegalColors.snowWhite,
        fontFamily: 'Montserrat',
      ),
      titleSmall: kMontserratTextTheme.titleSmall!.copyWith(
        color: RegalColors.snowWhite,
        fontSize: 16.sp,
        fontWeight: FontWeight.w400,
      ),
      labelLarge: kMontserratTextTheme.labelLarge!.copyWith(
        color: RegalColors.snowWhite,
        fontSize: 20.sp,
        fontWeight: FontWeight.w400,
      ),
      labelMedium: kMontserratTextTheme.labelMedium!.copyWith(
        color: RegalColors.snowWhite,
        fontSize: 18.sp,
        fontWeight: FontWeight.w400,
      ),
      labelSmall: kMontserratTextTheme.labelSmall!.copyWith(
        color: RegalColors.snowWhite,
        fontSize: 16.sp,
        fontWeight: FontWeight.w400,
      ),
      bodyLarge: kMontserratTextTheme.bodyLarge!.copyWith(
        color: RegalColors.snowWhite,
        fontSize: 14.sp,
        fontWeight: FontWeight.w400,
      ),
      bodyMedium: kMontserratTextTheme.bodyMedium!.copyWith(
        color: RegalColors.snowWhite,
        fontSize: 12.sp,
        fontWeight: FontWeight.w400,
      ),
      bodySmall: kMontserratTextTheme.bodySmall!.copyWith(
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
    titleTextStyle: TextStyle(
      fontFamily: 'Montserrat',
      package: 'regal',
      color: RegalColors.snowWhite,
      fontSize: 20.sp,
      fontWeight: FontWeight.bold,
    ),
    surfaceTintColor: RegalColors.licoriceBlack,
  ),
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      foregroundColor: RegalColors.vividRed,
      shape: const StadiumBorder(),
      disabledForegroundColor: RegalColors.disabledVividRed,
      textStyle: TextStyle(
        fontFamily: 'Montserrat',
        package: 'regal',
        color: RegalColors.vividRed,
        fontSize: 16.sp,
        fontWeight: FontWeight.bold,
      ),
    ).copyWith(
      elevation: const WidgetStatePropertyAll(0),
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      shape: const StadiumBorder(),
      backgroundColor: RegalColors.vividRed,
      disabledBackgroundColor: RegalColors.disabledDarkVividRed,
      foregroundColor: RegalColors.snowWhite,
      textStyle: TextStyle(
        fontFamily: 'Montserrat',
        package: 'regal',
        color: RegalColors.snowWhite,
        fontSize: 16.sp,
        fontWeight: FontWeight.bold,
      ),
    ).copyWith(
      elevation: const WidgetStatePropertyAll(0),
    ),
  ),
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      foregroundColor: RegalColors.snowWhite,
      disabledForegroundColor: RegalColors.grey.shade40,
      textStyle: TextStyle(
        fontFamily: 'Montserrat',
        package: 'regal',
        color: RegalColors.vividRed,
        fontSize: 16.sp,
        fontWeight: FontWeight.bold,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(100.w),
      ),
    ).copyWith(
      elevation: const WidgetStatePropertyAll(0),
      side: WidgetStateProperty.resolveWith(
        (states) {
          if (states.contains(WidgetState.disabled)) {
            return BorderSide(color: RegalColors.grey.shade40);
          }
          return const BorderSide(color: RegalColors.snowWhite);
        },
      ),
    ),
  ),
  bottomSheetTheme: BottomSheetThemeData(
    backgroundColor: RegalColors.licoriceBlack,
    surfaceTintColor: RegalColors.licoriceBlack,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(32.w),
        topRight: Radius.circular(32.w),
      ),
    ),
  ),
  datePickerTheme: DatePickerThemeData(
    backgroundColor: RegalColors.licoriceBlack,
    weekdayStyle: const TextStyle(color: RegalColors.vividRed),
    yearStyle: const TextStyle(color: RegalColors.snowWhite),
    dayForegroundColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.disabled)) {
        return RegalColors.darkGrey.shade10;
      }

      return RegalColors.snowWhite;
    }),
    yearForegroundColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.disabled)) {
        return RegalColors.darkGrey.shade10;
      }

      return RegalColors.snowWhite;
    }),
    dayBackgroundColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.selected)) {
        return RegalColors.vividRed;
      }
      return Colors.transparent;
    }),
    todayBackgroundColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.selected)) {
        return RegalColors.vividRed;
      }
      return RegalColors.licoriceBlack;
    }),
    todayForegroundColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.selected)) {
        return RegalColors.snowWhite;
      }
      if (states.contains(WidgetState.disabled)) {
        return RegalColors.vividRed.withOpacity(0.40);
      }
      return RegalColors.vividRed;
    }),
    yearBackgroundColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.selected)) {
        return RegalColors.vividRed;
      }
      return Colors.transparent;
    }),
    headerForegroundColor: RegalColors.snowWhite,
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
      color: RegalColors.grey.shade40,
    ),
    floatingLabelStyle:
        kInterTextTheme.bodyLarge?.copyWith(color: RegalColors.snowWhite),
  ),
  textSelectionTheme: TextSelectionThemeData(
    selectionColor: RegalColors.vividRed.withOpacity(0.40),
    selectionHandleColor: RegalColors.claretRed,
  ),
);
