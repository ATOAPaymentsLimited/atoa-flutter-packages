import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:regal/src/regal.dart';

extension SnackbarExtension on BuildContext {
  void showSnackbar(
    SnackbarType snackbar, {
    Widget? leading,
    bool infiniteDuration = false,
  }) {
    BotToast.showAnimationWidget(
      onlyOne: true,
      duration: infiniteDuration ? null : snackbar.type.duration,
      animationDuration: const Duration(milliseconds: 200),
      backButtonBehavior: BackButtonBehavior.close,
      wrapToastAnimation: (controller, cancel, child) => _CustomOffsetAnimation(
        controller: controller,
        child: child,
      ),
      toastBuilder: (cancelFunc) => Snackbar(
        snackbar,
        leading: leading,
        onClose: cancelFunc,
      ),
    );
  }
}

extension on SnackbarTypeEnum {
  Duration get duration => switch (this) {
        SnackbarTypeEnum.error => const Duration(seconds: 4),
        SnackbarTypeEnum.success => const Duration(seconds: 3),
        SnackbarTypeEnum.info => const Duration(seconds: 3),
      };
}

class _CustomOffsetAnimation extends StatefulWidget {
  const _CustomOffsetAnimation({
    required this.controller,
    required this.child,
  });
  final AnimationController controller;
  final Widget child;

  @override
  __CustomOffsetAnimationState createState() => __CustomOffsetAnimationState();
}

class __CustomOffsetAnimationState extends State<_CustomOffsetAnimation> {
  late Tween<Offset> tweenOffset;

  late Animation<double> animation;

  @override
  void initState() {
    tweenOffset = Tween<Offset>(
      begin: const Offset(0, 0.8),
      end: Offset.zero,
    );
    animation =
        CurvedAnimation(parent: widget.controller, curve: Curves.decelerate);
    super.initState();
  }

  @override
  Widget build(BuildContext context) => AnimatedBuilder(
        animation: widget.controller,
        builder: (BuildContext context, Widget? child) => FractionalTranslation(
          translation: tweenOffset.evaluate(animation),
          child: Opacity(
            opacity: animation.value,
            child: child,
          ),
        ),
        child: widget.child,
      );
}
