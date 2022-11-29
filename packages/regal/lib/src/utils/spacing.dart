import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

const double ktiny = 2;
const double kMini = 4;
const double ksmall = 8;
const double kmedium = 12;
const double klarge = 16;
const double kxtraLarge = 20;
const double kHuge = 24;

enum Spacing {
  /// 2
  tiny,

  /// 4
  mini,

  /// 8
  small,

  /// 12
  medium,

  /// 16
  large,

  /// 20
  xtraLarge,

  /// 24
  huge,
}

extension SpacingX on Spacing {
  double get value {
    switch (this) {
      case Spacing.tiny:
        return ktiny;
      case Spacing.mini:
        return kMini;
      case Spacing.small:
        return ksmall;
      case Spacing.medium:
        return kmedium;
      case Spacing.large:
        return klarge;
      case Spacing.xtraLarge:
        return kxtraLarge;
      case Spacing.huge:
        return kHuge;
    }
  }

  EdgeInsets get x => EdgeInsets.symmetric(horizontal: value.sp);

  EdgeInsets get y => EdgeInsets.symmetric(vertical: value.sp);

  EdgeInsets get all => EdgeInsets.symmetric(
        vertical: value.sp,
        horizontal: value.sp,
      );

  EdgeInsets get left => EdgeInsets.only(left: value.sp);

  EdgeInsets get right => EdgeInsets.only(right: value.sp);

  EdgeInsets get top => EdgeInsets.only(top: value.sp);

  EdgeInsets get bottom => EdgeInsets.only(bottom: value.sp);

  SizedBox get xBox => SizedBox(width: value.sp);

  SizedBox get yBox => SizedBox(height: value.sp);
}
