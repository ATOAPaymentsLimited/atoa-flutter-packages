import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

enum Spacing {
  /// 0 Empty Spacing
  lds0(0),
  /// 2 Empty Spacing
  lds25(2),
  /// 4 Empty Spacing
  lds50(4),
  /// 6 Empty Spacing
  lds75(6),
  /// 8 Empty Spacing
  lds100(8),
  /// 12 Empty Spacing
  lds150(12),
  /// 16 Empty Spacing
  lds200(16),
  /// 20 Empty Spacing
  lds250(20),
  /// 24 Empty Spacing
  lds300(24),
  /// 32 Empty Spacing
  lds400(32),
  /// 40 Empty Spacing
  lds500(40),
  /// 48 Empty Spacing
  lds600(48),
  /// 56 Empty Spacing
  lds700(56),
  /// 64 Empty Spacing
  lds800(64),
  /// 80 Empty Spacing
  lds1000(80),
  /// 96 Empty Spacing
  lds1200(96),
  /// 112 Empty Spacing
  lds1400(112);

  const Spacing(this.value);

  final double value;

  double operator *(double other) => value * other;
  double operator +(double other) => value + other;

  EdgeInsets get x => EdgeInsets.symmetric(horizontal: value.sp);
  EdgeInsets get y => EdgeInsets.symmetric(vertical: value.sp);
  EdgeInsets get all => EdgeInsets.all(value.sp);

  EdgeInsets get left => EdgeInsets.only(left: value.sp);
  EdgeInsets get right => EdgeInsets.only(right: value.sp);
  EdgeInsets get top => EdgeInsets.only(top: value.sp);
  EdgeInsets get bottom => EdgeInsets.only(bottom: value.sp);

  SizedBox get xBox => SizedBox(width: value.sp);
  SizedBox get yBox => SizedBox(height: value.sp);
}

extension EmptySpacingX on SizedBox {
  SizedBox operator *(double other) {
    if (height != null) return SizedBox(height: height! * other);

    if (width != null) return SizedBox(width: width! * other);

    return const SizedBox.shrink();
  }

  SizedBox operator +(SizedBox other) {
    if (height != null) return SizedBox(height: height! + other.height!);

    if (width != null) return SizedBox(width: width! + other.width!);

    return const SizedBox.shrink();
  }
}
