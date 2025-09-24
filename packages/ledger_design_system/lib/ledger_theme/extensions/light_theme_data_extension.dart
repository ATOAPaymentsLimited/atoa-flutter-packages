import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ledger_design_system/ledger_design_system.dart';

extension LightThemeDataExtension on ThemeData {
  TextTheme get _textTheme => kFigTreeTextTheme.apply(
        bodyColor: LedgerColors.lightColors.base.black,
        displayColor: LedgerColors.lightColors.base.black,
      );
  ThemeData get lightLedger => ThemeData.light().copyWith(
        textTheme: _textTheme,
        extensions: [
          LedgerColors.lightColors,
        ],
        iconTheme: IconThemeData(
          color: LedgerColors.lightColors.background.dark,
        ),
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
            textStyle: _textTheme.bodyLarge!.bold.copyWith(
              color: LedgerColors.lightColors.base.white,
            ),
          ),
        ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            shape: const StadiumBorder(),
            foregroundColor: LedgerColors.lightColors.brand.primary.shade500,
            disabledForegroundColor:
                LedgerColors.lightColors.brand.primary.shade800,
            textStyle: _textTheme.bodyLarge!.bold.copyWith(
              color: LedgerColors.lightColors.brand.primary.shade500,
            ),
          ),
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
            foregroundColor: LedgerColors.lightColors.brand.primary.shade500,
            disabledForegroundColor:
                LedgerColors.lightColors.brand.primary.shade800,
            textStyle: _textTheme.bodyLarge!.bold.copyWith(
              color: LedgerColors.lightColors.brand.primary.shade500,
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
        dialogTheme: ThemeData.light().dialogTheme.copyWith(
              surfaceTintColor: LedgerColors.lightColors.base.white,
              backgroundColor: LedgerColors.lightColors.base.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.r),
              ),
              titleTextStyle: _textTheme.labelSmall!.copyWith(
                fontWeight: FontWeight.bold,
              ),
              contentTextStyle: _textTheme.bodyLarge,
            ),
        inputDecorationTheme: InputDecorationTheme(
          isDense: true,
          isCollapsed: true,
          contentPadding: Spacing.lds200.x + Spacing.lds150.y + Spacing.lds25.y,
          border: OutlineInputBorder(
            borderRadius: RadiusSpacing.rdsm.all,
            borderSide: BorderSide(
              color: LedgerColors.lightColors.neutral.grey.shade700,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: RadiusSpacing.rdsm.all,
            borderSide: BorderSide(
              color: LedgerColors.lightColors.neutral.grey.shade300,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: RadiusSpacing.rdsm.all,
            borderSide: BorderSide(
              width: 1.5,
              color: LedgerColors.lightColors.neutral.grey.shade700,
            ),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: RadiusSpacing.rdsm.all,
            borderSide: BorderSide(
              color: LedgerColors.lightColors.neutral.grey.shade200,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: RadiusSpacing.rdsm.all,
            borderSide: BorderSide(
              width: 1.5,
              color: LedgerColors.lightColors.semantic.error.defaultColor,
            ),
          ),
          errorMaxLines: 2,
          labelStyle: kFigTreeTextTheme.labelSmall!
              .copyWith(color: LedgerColors.lightColors.base.black),
          floatingLabelStyle: kFigTreeTextTheme.bodyLarge!
              .copyWith(color: LedgerColors.lightColors.base.black),
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
          titleTextStyle: _textTheme.titleMedium!.bold.copyWith(
            color: LedgerColors.lightColors.base.black,
          ),
          surfaceTintColor: LedgerColors.lightColors.base.white,
        ),
        checkboxTheme: CheckboxThemeData(
          checkColor: WidgetStateProperty.all(
              LedgerColors.lightColors.background.light),
          fillColor:
              WidgetStateProperty.all(LedgerColors.lightColors.background.dark),
          shape: RoundedRectangleBorder(
            side: BorderSide(color: LedgerColors.lightColors.background.dark),
            borderRadius: BorderRadius.circular(4.r),
          ),
          visualDensity: VisualDensity.compact,
        ),
        bottomSheetTheme: BottomSheetThemeData(
          backgroundColor: LedgerColors.lightColors.base.white,
          surfaceTintColor: LedgerColors.lightColors.base.white,
          shape: RoundedRectangleBorder(
            borderRadius: RadiusSpacing.rds2xl.topCorners,
          ),
        ),
        datePickerTheme: DatePickerThemeData(
          headerHeadlineStyle: _textTheme.titleSmall,
          backgroundColor: LedgerColors.lightColors.base.white,
          weekdayStyle: _textTheme.bodySmall!.copyWith(
            color: LedgerColors.lightColors.brand.primary.shade500,
          ),
          yearStyle: _textTheme.bodySmall!
              .copyWith(color: LedgerColors.lightColors.base.black),
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
      );
}
