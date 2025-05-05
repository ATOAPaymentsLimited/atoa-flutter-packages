import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:regal/assets/fonts.gen.dart';
import 'package:regal/src/ledger_theme/colors/colors.dart';
import 'package:regal/src/ledger_theme/font/figtree.dart';
import 'package:regal/src/spacing/spacing.dart';

extension LightThemeDataExtension on ThemeData {
  TextTheme get _textTheme => kFigTreeTextTheme.apply(
        bodyColor: LedgerColors.lightColors.base.black,
        displayColor: LedgerColors.lightColors.base.black,
      );
  ThemeData get lightLedger => ThemeData.light().copyWith(
        extensions: [
          LedgerColors.lightColors,
        ],
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            elevation: 0,
            backgroundColor: LedgerColors.lightColors.brand.primary.shade500,
            foregroundColor: LedgerColors.lightColors.base.white,
            shape: const StadiumBorder(),
            disabledBackgroundColor:
                LedgerColors.lightColors.brand.primary.shade800,
            disabledForegroundColor: Colors.white,
            fixedSize: Size.fromHeight(60.sp),
            textStyle: TextStyle(
              fontFamily: FontFamily.figTree,
              package: 'regal',
              color: LedgerColors.lightColors.base.white,
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        dialogTheme: ThemeData.light().dialogTheme.copyWith(
              surfaceTintColor: LedgerColors.lightColors.base.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.r),
              ),
              titleTextStyle: _textTheme.labelLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
              contentTextStyle: _textTheme.bodyLarge,
            ),
        inputDecorationTheme: InputDecorationTheme(
          isDense: true,
          contentPadding: Spacing.lds200.all,
          fillColor: LedgerColors.lightColors.neutral.grey.shade50,
          border: OutlineInputBorder(
            borderRadius: RadiusSpacing.rdsxl.all,
            borderSide: BorderSide(
              color: LedgerColors.lightColors.neutral.grey.shade500,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: RadiusSpacing.rdsxl.all,
            borderSide: BorderSide(
              color: LedgerColors.lightColors.neutral.grey.shade500,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: RadiusSpacing.rdsxl.all,
            borderSide: BorderSide(color: LedgerColors.lightColors.base.black),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: RadiusSpacing.rdsxl.all,
            borderSide: BorderSide(
              color: LedgerColors.lightColors.neutral.grey.shade10,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: RadiusSpacing.rdsxl.all,
            borderSide: BorderSide(
              color: LedgerColors.lightColors.semantic.error.defaultColor,
            ),
          ),
          errorMaxLines: 2,
          hintStyle: kFigTreeTextTheme.labelSmall?.copyWith(
            color: LedgerColors.lightColors.neutral.grey.shade600,
            height: 1.3,
          ),
          errorStyle: kFigTreeTextTheme.bodyMedium?.copyWith(
            color: LedgerColors.lightColors.semantic.error.defaultColor,
          ),
          isCollapsed: true,
          labelStyle: kFigTreeTextTheme.labelSmall
              ?.copyWith(color: LedgerColors.lightColors.base.black),
          floatingLabelStyle: kFigTreeTextTheme.bodyLarge
              ?.copyWith(color: LedgerColors.lightColors.base.black),
        ),
        primaryColor: LedgerColors.lightColors.brand.primary.shade500,
        primaryColorDark: LedgerColors.lightColors.background.dark,
        scaffoldBackgroundColor: LedgerColors.lightColors.base.white,
        cardColor: LedgerColors.lightColors.base.white,
        colorScheme: ColorScheme.fromSeed(
          seedColor: LedgerColors.lightColors.brand.primary.shade500,
          onPrimary: LedgerColors.lightColors.base.white,
          error: LedgerColors.lightColors.semantic.error.defaultColor,
          primaryContainer: LedgerColors.lightColors.brand.primary.shade500,
          onPrimaryContainer: LedgerColors.lightColors.background.dark,
        ),
        appBarTheme: AppBarTheme(
          systemOverlayStyle: SystemUiOverlayStyle.dark,
          backgroundColor: LedgerColors.lightColors.base.white,
          centerTitle: true,
          elevation: 0,
          iconTheme: IconThemeData(
            color: LedgerColors.lightColors.background.dark,
          ),
          titleTextStyle: TextStyle(
            color: LedgerColors.lightColors.base.black,
            fontFamily: FontFamily.figTree,
            package: 'regal',
            fontSize: 20.sp,
            fontWeight: FontWeight.bold,
          ),
          surfaceTintColor: LedgerColors.lightColors.base.white,
        ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            shape: const StadiumBorder(),
            foregroundColor: LedgerColors.lightColors.brand.primary.shade500,
            disabledForegroundColor:
                LedgerColors.lightColors.brand.primary.shade800,
            textStyle: TextStyle(
              fontFamily: FontFamily.figTree,
              package: 'regal',
              color: LedgerColors.lightColors.brand.primary.shade500,
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
            foregroundColor: LedgerColors.lightColors.brand.primary.shade500,
            disabledForegroundColor:
                LedgerColors.lightColors.brand.primary.shade800,
            textStyle: TextStyle(
              fontFamily: FontFamily.figTree,
              package: 'regal',
              color: LedgerColors.lightColors.brand.primary.shade500,
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
            ),
            side: BorderSide(
              color: LedgerColors.lightColors.brand.primary.shade500,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(100.w),
            ),
          ).copyWith(
            side: WidgetStateProperty.resolveWith(
              (states) {
                if (states.contains(WidgetState.disabled)) {
                  return BorderSide(
                    color: LedgerColors.lightColors.brand.primary.shade800,
                  );
                }
                return BorderSide(
                  color: LedgerColors.lightColors.brand.primary.shade500,
                );
              },
            ),
          ),
        ),
        iconTheme: IconThemeData(
          color: LedgerColors.lightColors.background.dark,
        ),
        checkboxTheme: CheckboxThemeData(
          checkColor: WidgetStateProperty.all(Colors.white),
          fillColor:
              WidgetStateProperty.all(LedgerColors.lightColors.background.dark),
          shape: RoundedRectangleBorder(
            side: BorderSide(color: LedgerColors.lightColors.background.dark),
            borderRadius: BorderRadius.circular(4.r),
          ),
          visualDensity: VisualDensity.compact,
        ),
        bottomSheetTheme: BottomSheetThemeData(
          backgroundColor: Colors.white,
          surfaceTintColor: LedgerColors.lightColors.base.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(32.w),
              topRight: Radius.circular(32.w),
            ),
          ),
        ),
        datePickerTheme: DatePickerThemeData(
          backgroundColor: LedgerColors.lightColors.base.white,
          weekdayStyle: TextStyle(
            color: LedgerColors.lightColors.brand.primary.shade500,
          ),
          yearStyle: TextStyle(color: LedgerColors.lightColors.base.black),
          dayForegroundColor: WidgetStateProperty.resolveWith((states) {
            if (states.contains(WidgetState.disabled)) {
              return LedgerColors.lightColors.neutral.grey.shade500;
            }
            if (states.contains(WidgetState.selected)) {
              return LedgerColors.lightColors.base.white;
            }
            return LedgerColors.lightColors.base.black;
          }),
          dayBackgroundColor: WidgetStateProperty.resolveWith((states) {
            if (states.contains(WidgetState.selected)) {
              return LedgerColors.lightColors.brand.primary.shade500;
            }
            return Colors.transparent;
          }),
          yearForegroundColor: WidgetStateProperty.resolveWith((states) {
            if (states.contains(WidgetState.selected)) {
              return LedgerColors.lightColors.base.white;
            }
            if (states.contains(WidgetState.disabled)) {
              return LedgerColors.lightColors.neutral.grey.shade500;
            }

            return LedgerColors.lightColors.base.black;
          }),
          yearBackgroundColor: WidgetStateProperty.resolveWith((states) {
            if (states.contains(WidgetState.selected)) {
              return LedgerColors.lightColors.brand.primary.shade500;
            }
            return Colors.transparent;
          }),
          todayBackgroundColor: WidgetStateProperty.resolveWith((states) {
            if (states.contains(WidgetState.selected)) {
              return LedgerColors.lightColors.brand.primary.shade500;
            }
            return LedgerColors.lightColors.base.white;
          }),
          todayForegroundColor: WidgetStateProperty.resolveWith((states) {
            if (states.contains(WidgetState.selected)) {
              return LedgerColors.lightColors.base.white;
            }
            if (states.contains(WidgetState.disabled)) {
              return LedgerColors.lightColors.brand.primary.shade500
                  .withOpacity(0.40);
            }
            return LedgerColors.lightColors.brand.primary.shade500;
          }),
          yearOverlayColor: WidgetStateProperty.resolveWith((states) {
            if (states.contains(WidgetState.disabled)) {
              return LedgerColors.lightColors.neutral.grey.shade600;
            }
            return LedgerColors.lightColors.base.black;
          }),
          headerForegroundColor: LedgerColors.lightColors.base.black,
        ),
        textSelectionTheme: TextSelectionThemeData(
          selectionColor:
              LedgerColors.lightColors.brand.primary.shade500.withOpacity(0.40),
          selectionHandleColor: LedgerColors.lightColors.brand.primary.shade500,
        ),
        cupertinoOverrideTheme: CupertinoThemeData(
          primaryColor: LedgerColors.lightColors.brand.primary.shade500,
        ),
        textTheme: _textTheme,
      );
}
