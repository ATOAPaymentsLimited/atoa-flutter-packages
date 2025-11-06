import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ledger_design_system/ledger_design_system.dart';

class SvgThemedIcon extends StatelessWidget {
  const SvgThemedIcon({
    required this.svgPath,
    this.size,
    this.color,
    this.semanticsLabel,
    this.package,
    this.fit,
    this.overrideColor = true,
    this.overrideSize = true,
    super.key,
  });
  final String svgPath;
  final double? size;
  final String? semanticsLabel;
  final Color? color;
  final String? package;
  final BoxFit? fit;
  final bool overrideColor;
  final bool overrideSize;

  @override
  Widget build(BuildContext context) {
    final theme = AppSvgThemeProvider.of(context);
    final effectiveSize = size ?? theme.defaultSize;
    final effectiveColor = color ?? theme.defaultColor;

    return SvgPicture.asset(
      svgPath,
      package: package,
      width: overrideSize ? effectiveSize : null,
      height: overrideSize ? effectiveSize : null,
      fit: fit ?? BoxFit.contain,
      semanticsLabel: semanticsLabel ??
          svgPath.split('/').lastOrNull?.replaceAll('.svg', ''),
      colorFilter: overrideColor
          ? ColorFilter.mode(effectiveColor, BlendMode.srcIn)
          : null,
    );
  }
}
