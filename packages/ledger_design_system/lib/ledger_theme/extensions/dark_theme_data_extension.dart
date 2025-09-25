import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ledger_design_system/ledger_design_system.dart';

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
        dialogTheme: ThemeData.dark().dialogTheme.copyWith(
              surfaceTintColor: LedgerColors.darkColors.base.white,
              backgroundColor: LedgerColors.darkColors.base.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.r),
              ),
              titleTextStyle: _textTheme.labelLarge!.copyWith(
                fontWeight: FontWeight.bold,
              ),
              contentTextStyle: _textTheme.bodyLarge,
            ),
        inputDecorationTheme: ThemeData.dark().inputDecorationTheme.copyWith(
              isDense: true,
              isCollapsed: true,
              contentPadding:
                  Spacing.lds200.x + Spacing.lds150.y + Spacing.lds25.y,
              border: OutlineInputBorder(
                borderRadius: RadiusSpacing.rdsm.all,
                borderSide: BorderSide(
                  color: LedgerColors.darkColors.neutral.grey.shade700,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: RadiusSpacing.rdsm.all,
                borderSide: BorderSide(
                  color: LedgerColors.darkColors.neutral.grey.shade300,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: RadiusSpacing.rdsm.all,
                borderSide: BorderSide(
                  width: 1.5,
                  color: LedgerColors.darkColors.neutral.grey.shade700,
                ),
              ),
              disabledBorder: OutlineInputBorder(
                borderRadius: RadiusSpacing.rdsm.all,
                borderSide: BorderSide(
                  color: LedgerColors.darkColors.neutral.grey.shade200,
                ),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: RadiusSpacing.rdsm.all,
                borderSide: BorderSide(
                  width: 1.5,
                  color: LedgerColors.darkColors.semantic.error.darker,
                ),
              ),
              errorMaxLines: 2,
              labelStyle: _textTheme.bodyLarge!
                  .copyWith(color: LedgerColors.darkColors.base.black),
              floatingLabelStyle: _textTheme.bodyLarge!
                  .copyWith(color: LedgerColors.darkColors.base.black),
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
        checkboxTheme: CheckboxThemeData(
          checkColor:
              WidgetStateProperty.all(LedgerColors.darkColors.background.light),
          fillColor:
              WidgetStateProperty.all(LedgerColors.darkColors.background.dark),
          shape: RoundedRectangleBorder(
            side: BorderSide(color: LedgerColors.darkColors.background.dark),
            borderRadius: BorderRadius.circular(4.r),
          ),
          visualDensity: VisualDensity.compact,
        ),
        bottomSheetTheme: BottomSheetThemeData(
          backgroundColor: LedgerColors.darkColors.base.white,
          surfaceTintColor: LedgerColors.darkColors.base.white,
          shape: RoundedRectangleBorder(
            borderRadius: RadiusSpacing.rds2xl.topCorners,
          ),
        ),
        datePickerTheme: DatePickerThemeData(
          headerHeadlineStyle: _textTheme.titleSmall,
          backgroundColor: LedgerColors.darkColors.base.white,
          weekdayStyle: _textTheme.bodySmall!.copyWith(
            color: LedgerColors.darkColors.brand.primary.shade500,
          ),
          yearStyle: _textTheme.bodySmall!
              .copyWith(color: LedgerColors.darkColors.base.black),
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
