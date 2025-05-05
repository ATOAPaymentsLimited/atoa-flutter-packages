import 'package:flutter/material.dart';

import 'package:regal/src/callbacks/callbacks.dart';
import 'package:regal/src/utils/utility.dart';

mixin EventTrackMixin<T extends Widget> {
  void logClickEvent(
    BuildContext context,
    String trackLabel, {
    Map<String, dynamic>? trackProperties,
    required bool enableTracking,
  }) {
    if (!(enableTracking || DlsUtility.enableTracking)) {
      return;
    }
    try {
      CustomClickEventTrackHandler.dispatch(
        context,
        trackLabel,
        trackProperties: trackProperties,
      );
    } catch (e) {
      if (e is UnimplementedError) {
        throw FlutterError(
          e.message ?? 'Seems that callback is not registered',
        );
      }
      // Fail Silently
    }
  }
}
