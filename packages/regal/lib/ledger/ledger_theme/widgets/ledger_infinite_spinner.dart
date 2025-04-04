import 'package:flutter/material.dart';
import 'package:regal/assets/assets.gen.dart';
import 'package:regal/ledger/ledger_theme/colors/colors.dart';

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

class LedgerInfiniteSpinnerState extends State<LedgerInfiniteSpinner>
    with SingleTickerProviderStateMixin {
  late final AnimationController animationController;
  late final Animation<double> animation;

  @override
  void initState() {
    super.initState();

    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    );
    animation = Tween<double>(
      begin: 0,
      end: 12.5664, // 2 Radians (360 degrees)
    ).animate(animationController);

    animationController.forward();

    animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        animationController.repeat();
      }
    });
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => AnimatedBuilder(
        animation: animationController,
        builder: (context, child) => Transform.rotate(
          angle: animation.value,
          child: Assets.icons.ledger.spinner.svg(
            package: 'regal',
            height: widget.height,
            colorFilter: ColorFilter.mode(
              widget.color ?? _defaultColor(context),
              BlendMode.srcIn,
            ),
          ),
        ),
      );

  Color _defaultColor(BuildContext context) {
    print(Theme.of(context).brightness == Brightness.light);
    return Theme.of(context).brightness == Brightness.light
        ? LedgerColors.lightColors.base.black
        : LedgerColors.darkColors.base.black;
  }
}
