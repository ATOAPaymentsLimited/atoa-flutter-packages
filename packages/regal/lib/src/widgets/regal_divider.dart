import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:regal/regal.dart';

class RegalDivider extends StatelessWidget {
  const RegalDivider({super.key, this.color});
  final Color? color;

  @override
  Widget build(BuildContext context) => Divider(
        height: 0,
        thickness: 1.sp,
        color: color ?? context.grey.shade05,
      );
}
