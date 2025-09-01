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
  
  TextStyle get height160 => copyWith(height: 1.6);
  TextStyle get height150 => copyWith(height: 1.5);
  TextStyle get height145 => copyWith(height: 1.45);
  TextStyle get height140 => copyWith(height: 1.4);
  TextStyle get height130 => copyWith(height: 1.3);
  TextStyle get height120 => copyWith(height: 1.2);
  TextStyle get height110 => copyWith(height: 1.1);
  TextStyle get height100 => copyWith(height: 1);
}
