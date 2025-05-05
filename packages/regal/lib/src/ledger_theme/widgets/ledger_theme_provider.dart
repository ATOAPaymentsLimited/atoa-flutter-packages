// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:regal/src/utils/theme_mode_notifier.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LedgerThemeProvider extends StatefulWidget {
  const LedgerThemeProvider({
    super.key,
    required this.builder,
    this.child,
    required this.prefs,
  });

  final ThemeModeWidgetBuilder builder;
  final Widget? child;
  final SharedPreferences prefs;

  @override
  _LedgerThemeProviderState createState() => _LedgerThemeProviderState();
}

class _LedgerThemeProviderState extends State<LedgerThemeProvider> {
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
