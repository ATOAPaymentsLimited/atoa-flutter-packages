import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:regal/src/ledger_theme/widgets/app_svg_theme_provider.dart';

class SvgThemedIcon extends StatelessWidget {
  const SvgThemedIcon({
    required this.svgPath,
    this.size,
    this.color,
    this.semanticsLabel,
    this.package,
    this.fit,
    super.key,
  });
  final String svgPath;
  final double? size;
  final String? semanticsLabel;
  final Color? color;
  final String? package;
  final BoxFit? fit;

  @override
  Widget build(BuildContext context) {
    final theme = AppSvgThemeProvider.of(context);
    final effectiveSize = size ?? theme.defaultSize;
    final effectiveColor = color ?? theme.defaultColor;

    return SvgPicture.asset(
      svgPath,
      package: package,
      width: effectiveSize,
      height: effectiveSize,
      fit: fit,
      semanticsLabel: semanticsLabel ??
          svgPath.split('/').lastOrNull?.replaceAll('.svg', ''),
      colorFilter: ColorFilter.mode(effectiveColor, BlendMode.srcIn),
    );
  }
}
