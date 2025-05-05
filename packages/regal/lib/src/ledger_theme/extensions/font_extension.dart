import 'package:flutter/material.dart';

extension FontExtension on TextStyle {
  TextStyle get light => copyWith(
        fontWeight: FontWeight.w300,
        fontVariations: [
          const FontVariation.weight(300),
        ],
      );
  TextStyle get regular => copyWith(
        fontWeight: FontWeight.w400,
        fontVariations: [
          const FontVariation.weight(400),
        ],
      );
  TextStyle get medium => copyWith(
        fontWeight: FontWeight.w500,
        fontVariations: [
          const FontVariation.weight(500),
        ],
      );
  TextStyle get semiBold => copyWith(
        fontWeight: FontWeight.w600,
        fontVariations: [
          const FontVariation.weight(600),
        ],
      );
  TextStyle get bold => copyWith(
        fontWeight: FontWeight.w700,
        fontVariations: [
          const FontVariation.weight(700),
        ],
      );
  TextStyle get extraBold => copyWith(
        fontWeight: FontWeight.w800,
        fontVariations: [
          const FontVariation.weight(800),
        ],
      );
}
