import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

typedef TrackClickEvent = void Function(
  BuildContext context,
  String trackLabel, {
  Map<String, dynamic>? trackProperties,
});

class CustomClickEventTrackHandler {
  static TrackClickEvent? _onCallback;

  // ignore: use_setters_to_change_properties
  static void registerCallback({required TrackClickEvent onClickEvent}) {
    if (_onCallback != null) {
      throw FlutterError(
        '''
  TrackClickEvent Callback is already registered.

  Did you call it multiple times in your application?
          ''',
      );
    }
    _onCallback = onClickEvent;
  }

  // ignore: invalid_internal_annotation
  @internal
  static void dispatch(
    BuildContext context,
    String trackLabel, {
    Map<String, dynamic>? trackProperties,
  }) {
    if (_onCallback == null) {
      throw UnimplementedError(
        '''
  TrackClickEvent Callback must be defined before using widgets that require it.
  Did you forget to do CustomClickEventTrackHandler.registerCallback() ?

  Register the callback at top-level of your app, to log and track your click events, 
  or you can disable tracking by setting enableTracking:false in your widget
          ''',
      );
    }
    _onCallback?.call(
      context,
      trackLabel,
      trackProperties: trackProperties,
    );
  }
}
