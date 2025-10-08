import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

abstract class ShadeColorSystem {
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

  ShadeColorSystem copyWith({
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

  ShadeColorSystem lerp(
    covariant ShadeColorSystem? other,
    double t,
  );
}

abstract class SemanticColorSystem {
  Color get subtle;
  Color get lighter;
  Color get defaultColor;
  Color get darker;
  Color get deep;

  SemanticColorSystem copyWith({
    Color? subtle,
    Color? lighter,
    Color? defaultColor,
    Color? darker,
    Color? deep,
  });

  SemanticColorSystem lerp(
    covariant SemanticColorSystem? other,
    double t,
  );
}

abstract class BaseColorSystem {
  Color get white;
  Color get black;

  BaseColorSystem copyWith({
    Color? white,
    Color? black,
  });

  BaseColorSystem lerp(covariant BaseColorSystem? other, double t);
}

abstract class BackgroundColorSystem {
  Color get light;
  Color get dark;

  BackgroundColorSystem copyWith({
    Color? light,
    Color? dark,
  });

  BackgroundColorSystem lerp(
    covariant BackgroundColorSystem? other,
    double t,
  );
}
