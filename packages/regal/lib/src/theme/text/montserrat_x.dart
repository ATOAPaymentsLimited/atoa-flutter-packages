import 'package:flutter/material.dart';

@immutable
class MontserratX extends ThemeExtension<MontserratX> {
  const MontserratX({
    required this.textTheme,
  });

  final TextTheme textTheme;

  @override
  ThemeExtension<MontserratX> copyWith({
    TextTheme? textTheme,
  }) =>
      MontserratX(
        textTheme: textTheme ?? this.textTheme,
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
      textTheme: TextTheme.lerp(textTheme, other.textTheme, t),
    );
  }
}
