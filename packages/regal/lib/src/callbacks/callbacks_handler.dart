import 'package:flutter/material.dart';

typedef TrackClickEvent = void Function(
  BuildContext context,
  String trackLabel, {
  Map<String, dynamic>? trackProperties,
});

class CustomClickEventTrackHandler {
  static TrackClickEvent? _onCallback;

  // ignore: use_setters_to_change_properties
  static void registerCallback(TrackClickEvent onCallback) {
    _onCallback = onCallback;
  }
}

/// Done this to hide it access/view outside the package
extension TrackCustomClickEvent on CustomClickEventTrackHandler {
  static void dispatch(
    BuildContext context,
    String trackLabel, {
    Map<String, dynamic>? trackProperties,
  }) {
    if (CustomClickEventTrackHandler._onCallback == null) {
      throw FlutterError(
        'TrackClickEvent Callback must be defined before using widgets that require it',
      );
    }
    CustomClickEventTrackHandler._onCallback?.call(
      context,
      trackLabel,
      trackProperties: trackProperties,
    );
  }
}
