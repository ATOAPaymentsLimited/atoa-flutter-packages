import 'package:flutter/widgets.dart';

class DisableWidget extends StatelessWidget {
  const DisableWidget({
    super.key,
    this.ignoring = true,
    this.opacity = 0.5,
    required this.child,
  });

  final bool ignoring;
  final double opacity;
  final Widget child;

  @override
  Widget build(BuildContext context) => !ignoring
      ? child
      : Opacity(
          opacity: opacity,
          child: IgnorePointer(
            child: child,
          ),
        );
}
