import 'package:flutter/material.dart';

import 'package:regal/ledger/mixin/mixins.dart';

class CustomGestureDetector extends GestureDetector with EventTrackMixin {
  CustomGestureDetector({
    super.key,
    required this.context,
    required this.trackLabel,
    required this.semanticsLabel,
    super.child,
    super.onTapDown,
    super.onTapUp,
    super.onTap,
    super.onTapCancel,
    super.onSecondaryTap,
    super.onSecondaryTapDown,
    super.onSecondaryTapUp,
    super.onSecondaryTapCancel,
    super.onTertiaryTapDown,
    super.onTertiaryTapUp,
    super.onTertiaryTapCancel,
    super.onDoubleTapDown,
    super.onDoubleTap,
    super.onDoubleTapCancel,
    super.onLongPressDown,
    super.onLongPressCancel,
    super.onLongPress,
    super.onLongPressStart,
    super.onLongPressMoveUpdate,
    super.onLongPressUp,
    super.onLongPressEnd,
    super.onSecondaryLongPressDown,
    super.onSecondaryLongPressCancel,
    super.onSecondaryLongPress,
    super.onSecondaryLongPressStart,
    super.onSecondaryLongPressMoveUpdate,
    super.onSecondaryLongPressUp,
    super.onSecondaryLongPressEnd,
    super.onTertiaryLongPressDown,
    super.onTertiaryLongPressCancel,
    super.onTertiaryLongPress,
    super.onTertiaryLongPressStart,
    super.onTertiaryLongPressMoveUpdate,
    super.onTertiaryLongPressUp,
    super.onTertiaryLongPressEnd,
    super.onVerticalDragDown,
    super.onVerticalDragStart,
    super.onVerticalDragUpdate,
    super.onVerticalDragEnd,
    super.onVerticalDragCancel,
    super.onHorizontalDragDown,
    super.onHorizontalDragStart,
    super.onHorizontalDragUpdate,
    super.onHorizontalDragEnd,
    super.onHorizontalDragCancel,
    super.onForcePressStart,
    super.onForcePressPeak,
    super.onForcePressUpdate,
    super.onForcePressEnd,
    super.onPanDown,
    super.onPanStart,
    super.onPanUpdate,
    super.onPanEnd,
    super.onPanCancel,
    super.onScaleStart,
    super.onScaleUpdate,
    super.onScaleEnd,
    super.behavior,
    super.excludeFromSemantics = false,
    super.dragStartBehavior,
    super.supportedDevices,
    this.trackProperties,
    this.enableTracking = true,
  });

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
