import 'package:flutter/material.dart';
import 'package:regal/assets/assets.gen.dart';
import 'package:regal/src/ledger_theme/widgets/app_svg_theme_provider.dart';

class SvgThemedIcon extends StatelessWidget {
  const SvgThemedIcon({
    required this.svg,
    this.size,
    this.color,
    this.semanticsLabel,
    super.key,
  });
  final SvgGenImage svg;
  final double? size;
  final String? semanticsLabel;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final theme = AppSvgThemeProvider.of(context);
    final effectiveSize = size ?? theme.defaultSize;
    final effectiveColor = color ?? theme.defaultColor;

    return svg.svg(
      width: effectiveSize,
      height: effectiveSize,
      semanticsLabel: semanticsLabel ?? svg.path.split('/').lastOrNull,
      colorFilter: ColorFilter.mode(effectiveColor, BlendMode.srcIn),
    );
  }
}
