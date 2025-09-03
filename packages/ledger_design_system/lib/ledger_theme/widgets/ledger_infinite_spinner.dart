import 'package:flutter/material.dart';
import 'package:ledger_design_system/ledger_design_system.dart';
import 'package:lottie/lottie.dart';

class LedgerInfiniteSpinner extends StatefulWidget {
  const LedgerInfiniteSpinner({
    super.key,
    this.size,
  }) : brightness = null;

  const LedgerInfiniteSpinner.light({
    super.key,
    this.size,
  }) : brightness = Brightness.light;

  const LedgerInfiniteSpinner.dark({
    super.key,
    this.size,
  }) : brightness = Brightness.dark;

  final Brightness? brightness;
  final double? size;

  @override
  State<LedgerInfiniteSpinner> createState() => LedgerInfiniteSpinnerState();
}

class LedgerInfiniteSpinnerState extends State<LedgerInfiniteSpinner> {
  Brightness get resolvedBrightness =>
      widget.brightness ?? Theme.of(context).brightness;
  @override
  Widget build(BuildContext context) => LottieBuilder.asset(
        resolvedBrightness == Brightness.light
            ? 'assets/animations/ledger_loader_dark.json'
            : 'assets/animations/ledger_loader_light.json',
        package: 'ledger_design_system',
        animate: true,
        repeat: true,
        height: widget.size ?? Spacing.lds250.value,
        width: widget.size ?? Spacing.lds250.value,
      );
}
