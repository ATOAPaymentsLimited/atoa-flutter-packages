import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:ledger_design_system/ledger_design_system.dart';

class LedgerBottomSpacer extends StatelessWidget {
  const LedgerBottomSpacer({super.key});

  @override
  Widget build(BuildContext context) {
    final bottomPadding = MediaQuery.of(context).viewInsets.bottom;

    return SizedBox(height: math.max(bottomPadding, Spacing.lds400.value));
  }
}
