import 'package:flutter/material.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeModeNotifier extends StateNotifier<ThemeMode> {
  ThemeModeNotifier({
    required this.prefs,
    ThemeMode mode = ThemeMode.system,
    this.oldPrefsKey = 'regal/theme_mode',
    this.prefsKey = 'atoa_dls/theme_mode',
  }) : super(mode) {
    if (mode == ThemeMode.system) {
      _getModeFromPrefs();
    }
  }

  final SharedPreferences prefs;
  final String prefsKey;
  final String oldPrefsKey;

  ThemeMode get themeMode => state;

  void _getModeFromPrefs() {
    var name = prefs.getString(prefsKey);
    if (name == null) {
      name = prefs.getString(oldPrefsKey);
      prefs
        ..remove(oldPrefsKey)
        ..setString(prefsKey, name ?? ThemeMode.system.name);
    }

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
