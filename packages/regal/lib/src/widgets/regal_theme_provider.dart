// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:regal/src/regal.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegalThemeProvider extends StatefulWidget {
  const RegalThemeProvider({
    super.key,
    required this.builder,
    this.child,
    required this.prefs,
  });

  final ThemeModeWidgetBuilder builder;
  final Widget? child;
  final SharedPreferences prefs;

  @override
  _RegalThemeProviderState createState() => _RegalThemeProviderState();
}

class _RegalThemeProviderState extends State<RegalThemeProvider> {
  late ThemeModeNotifier stateNotifier;

  @override
  void initState() {
    super.initState();
    stateNotifier = ThemeModeNotifier(prefs: widget.prefs);
  }

  @override
  Widget build(BuildContext context) =>
      StateNotifierProvider<ThemeModeNotifier, ThemeMode>.value(
        value: stateNotifier,
        child: StateNotifierBuilder<ThemeMode>(
          stateNotifier: stateNotifier,
          builder: widget.builder,
          child: widget.child,
        ),
      );

  @override
  void dispose() {
    stateNotifier.dispose();
    super.dispose();
  }
}

typedef ThemeModeWidgetBuilder = Widget Function(
  BuildContext context,
  ThemeMode themeMode,
  Widget? child,
);
