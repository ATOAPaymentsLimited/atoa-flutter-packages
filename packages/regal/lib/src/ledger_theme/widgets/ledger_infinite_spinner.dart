import 'package:flutter/material.dart';
import 'package:regal/assets/assets.gen.dart';
import 'package:regal/ledger.dart';

class LedgerInfiniteSpinner extends StatefulWidget {
  const LedgerInfiniteSpinner({
    super.key,
    this.size,
  }) : brightness = null;

  const LedgerInfiniteSpinner.dark({
    super.key,
    this.size,
  }) : brightness = Brightness.light;

  const LedgerInfiniteSpinner.light({
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
  Widget build(BuildContext context) => Assets.animations.ledgerLoader.lottie(
        package: 'regal',
        animate: true,
        repeat: true,
        height: widget.size ?? Spacing.lds250.value,
        width: widget.size ?? Spacing.lds250.value,
      );
}
