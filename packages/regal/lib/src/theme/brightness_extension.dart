import 'package:flutter/foundation.dart';

extension BrightnessX on Brightness {
  T map<T>(T Function(Brightness l) light, T Function(Brightness d) dark) {
    switch (this) {
      case Brightness.light:
        return light(Brightness.light);

      case Brightness.dark:
        return dark(Brightness.dark);
    }
  }
}
