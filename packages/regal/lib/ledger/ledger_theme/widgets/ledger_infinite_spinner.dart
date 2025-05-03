import 'package:flutter/material.dart';
import 'package:regal/assets/assets.gen.dart';

class LedgerInfiniteSpinner extends StatefulWidget {
  const LedgerInfiniteSpinner({
    super.key,
    this.height,
    this.color,
  });

  final Color? color;
  final double? height;

  @override
  State<LedgerInfiniteSpinner> createState() => LedgerInfiniteSpinnerState();
}

class LedgerInfiniteSpinnerState extends State<LedgerInfiniteSpinner> {
  @override
  Widget build(BuildContext context) => Assets.animations.ledgerLoader.lottie(
        package: 'regal',
        animate: true,
        repeat: true,
        height: widget.height,
      );
}
