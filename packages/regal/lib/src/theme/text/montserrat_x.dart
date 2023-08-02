import 'package:flutter/material.dart';

@immutable
class MontserratX extends ThemeExtension<MontserratX> {
  const MontserratX({
    required this.displayLarge,
    required this.displayMedium,
    required this.displaySmall,
    required this.headlineLarge,
    required this.headlineMedium,
    required this.headlineSmall,
    required this.titleLarge,
    required this.titleMedium,
    required this.titleSmall,
    required this.labelLarge,
    required this.labelMedium,
    required this.labelSmall,
    required this.bodyLarge,
    required this.bodyMedium,
    required this.bodySmall,
  });

  /// performs a simple [Theme.of(context).displayLarge] action and returns given [displayLarge]
  /// ```
  /// displayLarge        48.0  FontWeight.w700
  /// ```
  final TextStyle displayLarge;

  /// performs a simple [Theme.of(context).displayMedium] action and returns given [displayMedium]
  /// ```
  /// displayMedium       36.0  FontWeight.w700
  /// ```
  final TextStyle displayMedium;

  /// performs a simple [Theme.of(context).displaySmall] action and returns given [displaySmall]
  /// ```
  /// displayMedium       32.0  FontWeight.w700
  /// ```
  final TextStyle displaySmall;

  /// performs a simple [Theme.of(context).headlineLarge] action and returns given [headlineLarge]
  /// ```
  /// headlineLarge        32.0  FontWeight.w700
  /// ```
  final TextStyle headlineLarge;

  /// performs a simple [Theme.of(context).headlineMedium] action and returns given [headlineMedium]
  /// ```
  /// headlineMedium       28.0  FontWeight.w700
  /// ```
  final TextStyle headlineMedium;

  /// performs a simple [Theme.of(context).headlineSmall] action and returns given [headlineSmall]
  /// ```
  /// headlineMedium       24.0  FontWeight.w700
  /// ```
  final TextStyle headlineSmall;

  /// performs a simple [Theme.of(context).titleLarge] action and returns given [titleLarge]
  /// ```
  /// titleLarge           24.0  FontWeight.w400
  /// ```
  final TextStyle titleLarge;

  /// performs a simple [Theme.of(context).titleMedium] action and returns given [titleMedium]
  /// ```
  /// titleLarge           20.0  FontWeight.w400
  /// ```
  final TextStyle titleMedium;

  /// performs a simple [Theme.of(context).titleSmall] action and returns given [titleSmall]
  /// ```
  /// titleLarge           16.0  FontWeight.w400
  /// ```
  final TextStyle titleSmall;

  /// performs a simple [Theme.of(context).labelLarge] action and returns given [labelLarge]
  /// ```
  /// labelLarge           20.0  FontWeight.w400
  /// ```
  final TextStyle labelLarge;

  /// performs a simple [Theme.of(context).labelMedium] action and returns given [labelMedium]
  /// ```
  /// labelMedium          18.0  FontWeight.w400
  /// ```
  final TextStyle labelMedium;

  /// performs a simple [Theme.of(context).labelSmall] action and returns given [labelSmall]
  /// ```
  /// labelSmall           16.0  FontWeight.w400
  /// ```
  final TextStyle labelSmall;

  /// performs a simple [Theme.of(context).bodyLarge] action and returns given [bodyLarge]
  /// ```
  /// bodyLarge            14.0  FontWeight.w400
  /// ```
  final TextStyle bodyLarge;

  /// performs a simple [Theme.of(context).bodyMedium] action and returns given [bodyMedium]
  /// ```
  /// bodyMedium           12.0  FontWeight.w400
  /// ```
  final TextStyle bodyMedium;

  /// performs a simple [Theme.of(context).bodySmall] action and returns given [bodySmall]
  /// ```
  /// bodySmall            11.0  FontWeight.w400
  /// ```
  final TextStyle bodySmall;

  @override
  ThemeExtension<MontserratX> copyWith({
    TextStyle? displayLarge,
    TextStyle? displayMedium,
    TextStyle? displaySmall,
    TextStyle? headlineLarge,
    TextStyle? headlineMedium,
    TextStyle? headlineSmall,
    TextStyle? titleLarge,
    TextStyle? titleMedium,
    TextStyle? titleSmall,
    TextStyle? labelLarge,
    TextStyle? labelMedium,
    TextStyle? labelSmall,
    TextStyle? bodyLarge,
    TextStyle? bodyMedium,
    TextStyle? bodySmall,
  }) =>
      MontserratX(
        displayLarge: displayLarge ?? this.displayLarge,
        displayMedium: displayMedium ?? this.displayMedium,
        displaySmall: displaySmall ?? this.displaySmall,
        headlineLarge: headlineLarge ?? this.headlineLarge,
        headlineMedium: headlineMedium ?? this.headlineMedium,
        headlineSmall: headlineSmall ?? this.headlineSmall,
        titleLarge: titleLarge ?? this.titleLarge,
        titleMedium: titleMedium ?? this.titleMedium,
        titleSmall: titleSmall ?? this.titleSmall,
        labelLarge: labelLarge ?? this.labelLarge,
        labelMedium: labelMedium ?? this.labelMedium,
        labelSmall: labelSmall ?? this.labelSmall,
        bodyLarge: bodyLarge ?? this.bodyLarge,
        bodyMedium: bodyMedium ?? this.bodyMedium,
        bodySmall: bodySmall ?? this.bodySmall,
      );

  @override
  ThemeExtension<MontserratX> lerp(
    covariant ThemeExtension<MontserratX>? other,
    double t,
  ) {
    if (other is! MontserratX) {
      return this;
    }

    return MontserratX(
      displayLarge: TextStyle.lerp(displayLarge, other.displayLarge, t)!,
      displayMedium: TextStyle.lerp(displayMedium, other.displayMedium, t)!,
      displaySmall: TextStyle.lerp(displaySmall, other.displaySmall, t)!,
      headlineLarge: TextStyle.lerp(headlineLarge, other.headlineLarge, t)!,
      headlineMedium: TextStyle.lerp(headlineMedium, other.headlineMedium, t)!,
      headlineSmall: TextStyle.lerp(headlineSmall, other.headlineSmall, t)!,
      titleLarge: TextStyle.lerp(titleLarge, other.titleLarge, t)!,
      titleMedium: TextStyle.lerp(titleMedium, other.titleMedium, t)!,
      titleSmall: TextStyle.lerp(titleSmall, other.titleSmall, t)!,
      labelLarge: TextStyle.lerp(labelLarge, other.labelLarge, t)!,
      labelMedium: TextStyle.lerp(labelMedium, other.labelMedium, t)!,
      labelSmall: TextStyle.lerp(labelSmall, other.labelSmall, t)!,
      bodyLarge: TextStyle.lerp(bodyLarge, other.bodyLarge, t)!,
      bodyMedium: TextStyle.lerp(bodyMedium, other.bodyMedium, t)!,
      bodySmall: TextStyle.lerp(bodySmall, other.bodySmall, t)!,
    );
  }
}
