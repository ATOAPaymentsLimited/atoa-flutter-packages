import 'package:flutter/material.dart';
import 'package:ledger_design_system/ledger_design_system.dart';

class AppSvgThemeProvider extends InheritedWidget {
  const AppSvgThemeProvider({
    required this.config,
    required super.child,
    super.key,
  });
  final SvgThemeConfig config;

  static SvgThemeConfig of(BuildContext context) {
    final inherited = context.dependOnInheritedWidgetOfExactType<AppSvgThemeProvider>();
    return inherited?.config ??
        SvgThemeConfig(
          defaultSize: Spacing.lds250.value,
          defaultColor: Colors.black,
        );
  }

  @override
  bool updateShouldNotify(AppSvgThemeProvider oldWidget) => config != oldWidget.config;
}

class SvgThemeConfig {
  const SvgThemeConfig({
    required this.defaultSize,
    required this.defaultColor,
  });
  final double defaultSize;
  final Color defaultColor;
}
