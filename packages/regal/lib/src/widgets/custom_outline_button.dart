import 'dart:math' as math;
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:regal/src/mixin/event_track_mixin.dart';

class CustomOutlinedButton extends OutlinedButton with EventTrackMixin {
  @Deprecated('Use RegalButton.secondary')
  const CustomOutlinedButton({
    super.key,
    required this.context,
    required this.trackLabel,
    required super.onPressed,
    super.onLongPress,
    super.onHover,
    super.onFocusChange,
    super.style,
    super.focusNode,
    super.autofocus = false,
    super.clipBehavior = Clip.none,
    super.statesController,
    required super.child,
    this.enableTracking = true,
  });

  @Deprecated('Use RegalButton.secondary with prefixIcon')
  factory CustomOutlinedButton.icon({
    Key? key,
    required BuildContext context,
    required String trackLabel,
    required VoidCallback? onPressed,
    VoidCallback? onLongPress,
    ButtonStyle? style,
    FocusNode? focusNode,
    bool? autofocus,
    Clip? clipBehavior,
    MaterialStatesController? statesController,
    required Widget icon,
    required Widget label,
    bool enableTracking,
  }) = _CustomOutlinedButtonWithIcon;

  final BuildContext context;

  /// [trackLabel] helps to identify the button, on analytics
  final String trackLabel;

  final bool enableTracking;

  @override
  VoidCallback? get onPressed => super.onPressed != null
      ? () {
          super.onPressed?.call();
          logClickEvent(context, trackLabel, enableTracking: enableTracking);
        }
      : null;
}

class _CustomOutlinedButtonWithIcon extends CustomOutlinedButton {
  _CustomOutlinedButtonWithIcon({
    super.key,
    required super.context,
    required super.trackLabel,
    required super.onPressed,
    super.onLongPress,
    super.style,
    super.focusNode,
    bool? autofocus,
    Clip? clipBehavior,
    super.statesController,
    required Widget icon,
    required Widget label,
    super.enableTracking = true,
  }) : super(
          autofocus: autofocus ?? false,
          clipBehavior: clipBehavior ?? Clip.none,
          child: _CustomOutlinedButtonWithIconChild(icon: icon, label: label),
        );
}

class _CustomOutlinedButtonWithIconChild extends StatelessWidget {
  const _CustomOutlinedButtonWithIconChild({
    required this.label,
    required this.icon,
  });

  final Widget label;
  final Widget icon;

  @override
  Widget build(BuildContext context) {
    final scale = MediaQuery.maybeOf(context)?.textScaleFactor ?? 1;
    final gap = scale <= 1 ? 8 : lerpDouble(8, 4, math.min(scale - 1, 1))!;
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        icon,
        SizedBox(width: gap.toDouble()),
        Flexible(child: label),
      ],
    );
  }
}
