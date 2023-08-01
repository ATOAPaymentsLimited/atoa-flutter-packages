import 'package:flutter/material.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeModeNotifier extends StateNotifier<ThemeMode> {
  ThemeModeNotifier({
    required this.prefs,
    ThemeMode mode = ThemeMode.system,
    this.prefsKey = 'regal/theme_mode',
  }) : super(mode) {
    if (mode == ThemeMode.system) {
      _getModeFromPrefs();
    }
  }

  final SharedPreferences prefs;
  final String prefsKey;

  void _getModeFromPrefs() {
    final name = prefs.getString(prefsKey);

    for (final mode in ThemeMode.values) {
      if (name == mode.name) {
        state = mode;
      }
    }
  }

  void setDark() {
    state = ThemeMode.dark;
    prefs.setString(prefsKey, state.name);
  }

  void setLight() {
    state = ThemeMode.light;
    prefs.setString(prefsKey, state.name);
  }

  void setSystem() {
    state = ThemeMode.system;
    prefs.setString(prefsKey, state.name);
  }

  void onValueChanged(ThemeMode value) {
    state = value;
    prefs.setString(prefsKey, state.name);
  }
}
