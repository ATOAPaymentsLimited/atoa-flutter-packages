import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ledger_design_system/ledger_design_system.dart';

class LedgerDivider extends StatelessWidget {
  const LedgerDivider({super.key, this.color, this.height});
  final Color? color;
  final double? height;

  @override
  Widget build(BuildContext context) => Divider(
        height: height ?? 0,
        thickness: 1.sp,
        color: color ?? context.grey.shade50,
      );
}
