import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

const double ktiny = 2;
const double kMini = 4;
const double ksmall = 8;
const double kmedium = 12;
const double klarge = 16;
const double kMediumLarge = 18;
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

  /// 18
  mediumlarge,

  /// 20
  xtraLarge,

  /// 24
  huge;

  double operator *(double other) => value * other;

  double operator +(Spacing other) => value + other.value;
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
      case Spacing.mediumlarge:
        return kMediumLarge;
      case Spacing.xtraLarge:
        return kxtraLarge;
      case Spacing.huge:
        return kHuge;
    }
  }

  double get r => value.r;

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

  OperatorSizedBox get xBox => OperatorSizedBox.width(value.sp);

  OperatorSizedBox get yBox => OperatorSizedBox.height(value.sp);

  Radius get circular => Radius.circular(value.r);

  BorderRadius get brAll => BorderRadius.all(circular);
  BorderRadius get brTopLeft => BorderRadius.only(topLeft: circular);
  BorderRadius get brTopRight => BorderRadius.only(topRight: circular);
  BorderRadius get brBottomRight => BorderRadius.only(bottomRight: circular);

  BorderRadius get topCorners => BorderRadius.vertical(
        top: circular,
      );

  BorderRadius get bottomCorners => BorderRadius.vertical(
        bottom: circular,
      );
}

class OperatorSizedBox extends SizedBox {
  const OperatorSizedBox.height(double height, {super.key})
      : super(height: height);

  const OperatorSizedBox.width(double width, {super.key}) : super(width: width);

  const OperatorSizedBox.shrink({super.key}) : super.shrink();

  OperatorSizedBox operator *(double other) {
    if (height != null) return OperatorSizedBox.height(height! * other);

    if (width != null) return OperatorSizedBox.width(width! * other);

    return const OperatorSizedBox.shrink();
  }

  OperatorSizedBox operator +(SizedBox other) {
    if (height != null) return OperatorSizedBox.height(height! + other.height!);

    if (width != null) return OperatorSizedBox.width(width! + other.width!);

    return const OperatorSizedBox.shrink();
  }
}
