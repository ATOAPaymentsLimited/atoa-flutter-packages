import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:regal/ledger/ledger_theme/colors/colors.dart';
import 'package:regal/ledger/ledger_theme/extensions/font_extension.dart';
import 'package:regal/ledger/ledger_theme/font/figtree.dart';
import 'package:regal/ledger/spacing/spacing.dart';

extension DarkThemeDataExtension on ThemeData {
  TextTheme get _textTheme => kFigTreeTextTheme.apply(
        bodyColor: LedgerColors.darkColors.base.black,
        displayColor: LedgerColors.darkColors.base.black,
      );

  ThemeData get darkLedger => ThemeData.dark().copyWith(
        textTheme: _textTheme,
        extensions: [
          LedgerColors.darkColors,
        ],
        iconTheme: IconThemeData(
          color: LedgerColors.darkColors.base.black,
        ),
        dialogTheme: ThemeData.dark().dialogTheme.copyWith(
              surfaceTintColor: LedgerColors.darkColors.base.white,
              backgroundColor: LedgerColors.darkColors.base.white,
            ),
        inputDecorationTheme: ThemeData.dark().inputDecorationTheme.copyWith(
              fillColor: LedgerColors.darkColors.neutral.grey.shade50,
              labelStyle: kFigTreeTextTheme.labelSmall?.copyWith(
                color: LedgerColors.darkColors.neutral.grey.shade600,
              ),
              isDense: true,
              contentPadding: Spacing.lds200.all,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14.sp),
                borderSide: BorderSide(
                  color: LedgerColors.darkColors.neutral.grey.shade100,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14.sp),
                borderSide: BorderSide(
                  color: LedgerColors.darkColors.neutral.grey.shade100,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14.sp),
                borderSide:
                    BorderSide(color: LedgerColors.darkColors.base.black),
              ),
              disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14.sp),
                borderSide: BorderSide(
                  color: LedgerColors.darkColors.neutral.grey.shade10,
                ),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14.sp),
                borderSide: BorderSide(
                  color: LedgerColors.darkColors.semantic.error.darker,
                ),
              ),
              errorMaxLines: 2,
              hintStyle: _textTheme.bodyLarge!.copyWith(
                color: LedgerColors.darkColors.neutral.grey.shade600,
              ),
              errorStyle: _textTheme.labelSmall!.copyWith(
                color: LedgerColors.darkColors.semantic.error.darker,
              ),
              isCollapsed: true,
              floatingLabelStyle: _textTheme.bodyLarge
                  ?.copyWith(color: LedgerColors.darkColors.base.black),
            ),
        primaryColor: LedgerColors.darkColors.brand.primary.shade500,
        primaryColorDark: LedgerColors.darkColors.brand.primary.shade500,
        scaffoldBackgroundColor: LedgerColors.darkColors.base.white,
        cardColor: LedgerColors.darkColors.base.white,
        brightness: Brightness.dark,
        colorScheme: ColorScheme.fromSeed(
          seedColor: LedgerColors.darkColors.brand.primary.shade500,
          primary: LedgerColors.darkColors.background.light,
          onPrimary: LedgerColors.darkColors.base.black,
          brightness: Brightness.dark,
          error: LedgerColors.darkColors.semantic.error.defaultColor,
          primaryContainer: LedgerColors.darkColors.background.light,
          onPrimaryContainer: LedgerColors.darkColors.base.black,
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: LedgerColors.darkColors.base.white,
          systemOverlayStyle: SystemUiOverlayStyle.light,
          actionsIconTheme: IconThemeData(
            color: LedgerColors.darkColors.base.black,
          ),
          elevation: 0,
          centerTitle: true,
          titleTextStyle: _textTheme.titleMedium!.bold.copyWith(
            color: LedgerColors.darkColors.base.black,
          ),
          surfaceTintColor: LedgerColors.darkColors.base.white,
        ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            foregroundColor: LedgerColors.darkColors.brand.primary.shade500,
            shape: const StadiumBorder(),
            disabledForegroundColor:
                LedgerColors.darkColors.brand.primary.shade800,
            textStyle: _textTheme.bodyLarge!.bold.copyWith(
              color: LedgerColors.darkColors.brand.primary.shade500,
            ),
          ).copyWith(
            elevation: const WidgetStatePropertyAll(0),
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            shape: const StadiumBorder(),
            backgroundColor: LedgerColors.darkColors.brand.primary.shade500,
            disabledBackgroundColor:
                LedgerColors.darkColors.brand.primary.shade800,
            foregroundColor: LedgerColors.darkColors.base.black,
            textStyle: _textTheme.bodyLarge!.bold.copyWith(
              color: LedgerColors.darkColors.base.black,
            ),
          ).copyWith(
            elevation: const WidgetStatePropertyAll(0),
          ),
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
            foregroundColor: LedgerColors.darkColors.base.black,
            disabledForegroundColor:
                LedgerColors.darkColors.neutral.grey.shade500,
            textStyle: _textTheme.bodyLarge!.bold.copyWith(
              color: LedgerColors.darkColors.brand.primary.shade500,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(100.w),
            ),
          ).copyWith(
            elevation: const WidgetStatePropertyAll(0),
            side: WidgetStateProperty.resolveWith(
              (states) {
                if (states.contains(WidgetState.disabled)) {
                  return BorderSide(
                    color: LedgerColors.darkColors.neutral.grey.shade500,
                  );
                }
                return BorderSide(color: LedgerColors.darkColors.base.black);
              },
            ),
          ),
        ),
        bottomSheetTheme: BottomSheetThemeData(
          backgroundColor: LedgerColors.darkColors.base.white,
          surfaceTintColor: LedgerColors.darkColors.base.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(32.w),
              topRight: Radius.circular(32.w),
            ),
          ),
        ),
        datePickerTheme: DatePickerThemeData(
          backgroundColor: LedgerColors.darkColors.base.white,
          weekdayStyle: TextStyle(
            color: LedgerColors.darkColors.brand.primary.shade500,
          ),
          yearStyle: TextStyle(color: LedgerColors.darkColors.base.black),
          dayForegroundColor: WidgetStateProperty.resolveWith((states) {
            if (states.contains(WidgetState.disabled)) {
              return LedgerColors.darkColors.neutral.grey.shade200;
            }

            return LedgerColors.darkColors.base.black;
          }),
          yearForegroundColor: WidgetStateProperty.resolveWith((states) {
            if (states.contains(WidgetState.disabled)) {
              return LedgerColors.darkColors.neutral.grey.shade200;
            }

            return LedgerColors.darkColors.base.black;
          }),
          dayBackgroundColor: WidgetStateProperty.resolveWith((states) {
            if (states.contains(WidgetState.selected)) {
              return LedgerColors.darkColors.brand.primary.shade500;
            }
            return Colors.transparent;
          }),
          todayBackgroundColor: WidgetStateProperty.resolveWith((states) {
            if (states.contains(WidgetState.selected)) {
              return LedgerColors.darkColors.brand.primary.shade500;
            }
            return LedgerColors.darkColors.base.white;
          }),
          todayForegroundColor: WidgetStateProperty.resolveWith((states) {
            if (states.contains(WidgetState.selected)) {
              return LedgerColors.darkColors.base.black;
            }
            if (states.contains(WidgetState.disabled)) {
              return LedgerColors.darkColors.brand.primary.shade500
                  .withOpacity(0.40);
            }
            return LedgerColors.darkColors.brand.primary.shade500;
          }),
          yearBackgroundColor: WidgetStateProperty.resolveWith((states) {
            if (states.contains(WidgetState.selected)) {
              return LedgerColors.darkColors.brand.primary.shade500;
            }
            return Colors.transparent;
          }),
          headerForegroundColor: LedgerColors.darkColors.base.black,
        ),
        textSelectionTheme: TextSelectionThemeData(
          selectionColor:
              LedgerColors.darkColors.brand.primary.shade500.withOpacity(0.40),
          selectionHandleColor: LedgerColors.darkColors.brand.primary.shade500,
        ),
        cupertinoOverrideTheme: CupertinoThemeData(
          primaryColor: LedgerColors.darkColors.brand.primary.shade500,
        ),
      );
}
