// ignore_for_file: public_member_api_docs

import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// TODO(amanxatoa): ask @Skand for common spacing values
const double ktiny = 5;
const double ksmall = 10;
const double kmedium = 18;
const double klarge = 25;
const double kxtraLarge = 30;

enum Spacing {
  tiny,
  small,
  medium,
  large,
  xtraLarge,
}

extension SpacingX on Spacing {
  double get value {
    switch (this) {
      case Spacing.tiny:
        return ktiny;
      case Spacing.small:
        return ksmall;
      case Spacing.medium:
        return kmedium;
      case Spacing.large:
        return klarge;
      case Spacing.xtraLarge:
        return kxtraLarge;
    }
  }

  EdgeInsets get x => EdgeInsets.symmetric(horizontal: value.w);

  EdgeInsets get y => EdgeInsets.symmetric(vertical: value.h);

  EdgeInsets get all =>
      EdgeInsets.symmetric(vertical: value.h, horizontal: value.w);

  EdgeInsets get left => EdgeInsets.only(left: value.w);

  EdgeInsets get right => EdgeInsets.only(right: value.w);

  EdgeInsets get top => EdgeInsets.only(top: value.h);

  EdgeInsets get bottom => EdgeInsets.only(bottom: value.h);

  SizedBox get xBox => SizedBox(width: value.w);

  SizedBox get yBox => SizedBox(height: value.h);
}
