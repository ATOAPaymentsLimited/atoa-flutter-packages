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
}

abstract class LedgerSemanticColorSystem {
  Color get subtle;
  Color get lighter;
  Color get defaultColor;
  Color get darker;
  Color get deep;
}

abstract class LedgerBaseColorSystem {
  Color get white;
  Color get black;
}

abstract class LedgerBackgroundColorSystem {
  Color get light;
  Color get dark;
}
