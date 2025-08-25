import 'package:flutter/material.dart';
import 'package:regal/assets/assets.gen.dart';
import 'package:regal/ledger.dart';

class LedgerInfiniteSpinner extends StatefulWidget {
  const LedgerInfiniteSpinner({
    super.key,
    this.height,
  }) : brightness = null;

  const LedgerInfiniteSpinner.dark({
    super.key,
    this.height,
  }) : brightness = Brightness.light;

  const LedgerInfiniteSpinner.light({
    super.key,
    this.height,
  }) : brightness = Brightness.dark;

  final Brightness? brightness;
  final double? height;

  @override
  State<LedgerInfiniteSpinner> createState() => LedgerInfiniteSpinnerState();
}

class LedgerInfiniteSpinnerState extends State<LedgerInfiniteSpinner> {
  Brightness get resolvedBrightness =>
      widget.brightness ?? Theme.of(context).brightness;
  @override
  Widget build(BuildContext context) => Assets.animations.ledgerLoader.lottie(
        package: 'regal',
        animate: true,
        repeat: true,
        height: widget.height ?? Spacing.lds250.value,
        width: widget.height ?? Spacing.lds250.value,
      );
}
