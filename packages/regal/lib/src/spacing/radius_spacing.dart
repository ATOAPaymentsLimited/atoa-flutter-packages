import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

enum RadiusSpacing {
  /// 0 radius spacing
  rdsnull(0),
  /// 4 radius spacing
  rdsxs(4),
  /// 8 radius spacing
  rdss(8),
  /// 10 radius spacing
  rdsm(10),
  /// 12 radius spacing
  rdsl(12),
  /// 16 radius spacing
  rdsxl(16),
  /// 20 radius spacing
  rds2xl(20),
  /// 100 radius spacing
  rdscircular(100);

  const RadiusSpacing(this.value);
  final double value;

  double operator +(double other) => value.sp + other;
  double operator *(double other) => value.sp * other;

  Radius get r => Radius.circular(value.sp);

  BorderRadius get all => BorderRadius.all(r);
  BorderRadius get topLeft => BorderRadius.only(topLeft: r);
  BorderRadius get topRight => BorderRadius.only(topRight: r);
  BorderRadius get bottomLeft => BorderRadius.only(bottomLeft: r);
  BorderRadius get bottomRight => BorderRadius.only(bottomRight: r);

  BorderRadius get topCorners => topLeft + topRight;
  BorderRadius get bottomCorners => bottomLeft + bottomRight;
  BorderRadius get leftCorners => topLeft + bottomLeft;
  BorderRadius get rightCorners => topRight + bottomRight;
}
