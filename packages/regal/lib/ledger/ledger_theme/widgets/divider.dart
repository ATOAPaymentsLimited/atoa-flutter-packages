import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:regal/ledger/ledger_theme/ledger_theme.dart';

class LedgerDivider extends StatelessWidget {
  const LedgerDivider({super.key, this.color});
  final Color? color;

  @override
  Widget build(BuildContext context) => Divider(
        height: 0,
        thickness: 1.sp,
        color: color ?? context.grey.shade50,
      );
}
