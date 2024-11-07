import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

abstract class LedgerShadeColorSystem {
  Color get shade10;
  Color get shade50;
  Color get shade100;
  Color get shade200;
  Color get shade300;
  Color get shade400;
  Color get shade500;
  Color get shade600;
  Color get shade700;
  Color get shade800;
  Color get shade900;

  LedgerShadeColorSystem copyWith({
    Color? shade10,
    Color? shade50,
    Color? shade100,
    Color? shade200,
    Color? shade300,
    Color? shade400,
    Color? shade500,
    Color? shade600,
    Color? shade700,
    Color? shade800,
    Color? shade900,
  });

  LedgerShadeColorSystem lerp(
    covariant LedgerShadeColorSystem? other,
    double t,
  );
}

abstract class LedgerSemanticColorSystem {
  Color get subtle;
  Color get lighter;
  Color get defaultColor;
  Color get darker;
  Color get deep;

  LedgerSemanticColorSystem copyWith({
    Color? subtle,
    Color? lighter,
    Color? defaultColor,
    Color? darker,
    Color? deep,
  });

  LedgerSemanticColorSystem lerp(
    covariant LedgerSemanticColorSystem? other,
    double t,
  );
}

abstract class LedgerBaseColorSystem {
  Color get white;
  Color get black;

  LedgerBaseColorSystem copyWith({
    Color? white,
    Color? black,
  });

  LedgerBaseColorSystem lerp(covariant LedgerBaseColorSystem? other, double t);
}

abstract class LedgerBackgroundColorSystem {
  Color get light;
  Color get dark;

  LedgerBackgroundColorSystem copyWith({
    Color? light,
    Color? dark,
  });

  LedgerBackgroundColorSystem lerp(
    covariant LedgerBackgroundColorSystem? other,
    double t,
  );
}
