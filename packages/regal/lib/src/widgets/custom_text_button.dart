import 'dart:math' as math;
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:regal/src/mixin/event_track_mixin.dart';

class CustomTextButton extends TextButton with EventTrackMixin {
  const CustomTextButton({
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

  factory CustomTextButton.icon({
    Key? key,
    required BuildContext context,
    required String trackLabel,
    required VoidCallback? onPressed,
    VoidCallback? onLongPress,
    ValueChanged<bool>? onHover,
    ValueChanged<bool>? onFocusChange,
    ButtonStyle? style,
    FocusNode? focusNode,
    bool? autofocus,
    Clip? clipBehavior,
    MaterialStatesController? statesController,
    required Widget icon,
    required Widget label,
    bool enableTracking,
  }) = _CustomTextButtonWithIcon;

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

class _CustomTextButtonWithIcon extends CustomTextButton {
  _CustomTextButtonWithIcon({
    super.key,
    required super.context,
    required super.trackLabel,
    required super.onPressed,
    super.onLongPress,
    super.onHover,
    super.onFocusChange,
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
          child: _CustomTextButtonWithIconChild(icon: icon, label: label),
        );

  @override
  ButtonStyle defaultStyleOf(BuildContext context) {
    final scaledPadding = ButtonStyleButton.scaledPadding(
      const EdgeInsets.all(8),
      const EdgeInsets.symmetric(horizontal: 4),
      const EdgeInsets.symmetric(horizontal: 4),
      MediaQuery.maybeOf(context)?.textScaleFactor ?? 1,
    );
    return super.defaultStyleOf(context).copyWith(
          padding: MaterialStatePropertyAll<EdgeInsetsGeometry>(scaledPadding),
        );
  }
}

class _CustomTextButtonWithIconChild extends StatelessWidget {
  const _CustomTextButtonWithIconChild({
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
        Flexible(child: label)
      ],
    );
  }
}
