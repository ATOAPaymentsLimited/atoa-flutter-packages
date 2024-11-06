import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

abstract class LedgerShadeColorSystem {
  const LedgerShadeColorSystem();

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

  static LedgerShadeColorSystem? lerp(
    LedgerShadeColorSystem shadeColorSystem,
    LedgerShadeColorSystem other,
    double t,
  ) {
    throw UnimplementedError();
  }
}

abstract class LedgerSemanticColorSystem {
  const LedgerSemanticColorSystem();

  Color get subtle;
  Color get lighter;
  Color get defaultColor;
  Color get darker;
  Color get deep;

  static LedgerSemanticColorSystem? lerp(
    LedgerSemanticColorSystem semanticColorSystem,
    LedgerSemanticColorSystem other,
    double t,
  ) {
    throw UnimplementedError();
  }
}
