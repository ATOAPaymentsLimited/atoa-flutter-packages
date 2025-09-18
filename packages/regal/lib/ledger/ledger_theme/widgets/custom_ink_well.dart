import 'package:flutter/material.dart';

import 'package:regal/ledger/mixin/mixins.dart';

class CustomInkWell extends InkWell with EventTrackMixin {
  const CustomInkWell({
    super.key,
    required this.context,
    required this.trackLabel,
    required this.semanticsLabel,
    super.child,
    super.onTap,
    super.onDoubleTap,
    super.onLongPress,
    super.onTapDown,
    super.onTapUp,
    super.onTapCancel,
    super.onHighlightChanged,
    super.onHover,
    super.mouseCursor,
    super.focusColor,
    super.hoverColor,
    super.highlightColor,
    super.overlayColor,
    super.splashColor,
    super.splashFactory,
    super.radius,
    super.borderRadius,
    super.customBorder,
    super.excludeFromSemantics,
    super.focusNode,
    super.canRequestFocus,
    super.onFocusChange,
    super.autofocus,
    super.statesController,
    this.trackProperties,
    this.enableTracking = true,
  }) : super();

  final BuildContext context;

  /// [trackLabel] helps to identify the button, on analytics
  final String trackLabel;

  final Map<String, dynamic>? trackProperties;

  final bool enableTracking;

  final String semanticsLabel;

  @override
  VoidCallback? get onTap => super.onTap != null
      ? () {
          super.onTap?.call();
          logClickEvent(
            context,
            trackLabel,
            trackProperties: trackProperties,
            enableTracking: enableTracking,
          );
        }
      : null;

  @override
  Widget? get child => super.child != null
      ? Semantics(
          label: semanticsLabel,
          container: true,
          enabled: true,
          explicitChildNodes: true,
          child: super.child,
        )
      : null;
}
