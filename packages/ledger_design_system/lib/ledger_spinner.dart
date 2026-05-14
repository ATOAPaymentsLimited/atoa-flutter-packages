import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ledger_design_system/ledger_design_system.dart';

class LedgerSpinner extends StatefulWidget {
  const LedgerSpinner({
    super.key,
    this.height,
    this.color,
  });

  final Color? color;
  final double? height;

  @override
  State<LedgerSpinner> createState() => LedgerSpinnerState();
}

class LedgerSpinnerState extends State<LedgerSpinner>
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
          child: SvgPicture.asset(
            'assets/icons/spinner.svg',
            colorFilter: ColorFilter.mode(
              widget.color ?? context.baseBlack,
              BlendMode.srcIn,
            ),
            package: 'ledger_design_system',
            height: widget.height,
          ),
        ),
      );
}
