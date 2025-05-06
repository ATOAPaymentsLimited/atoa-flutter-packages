import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:regal/src/ledger_theme/ledger_theme.dart';

class LedgerIconButton extends StatelessWidget {
  const LedgerIconButton({
    super.key,
    required this.assetPath,
    this.size = LedgerIconButtonSize.large,
    this.onPressed,
    this.iconColor,
    required this.semanticsLabel,
    required this.trackLabel,
    this.borderRadius,
    this.color,
    this.padding,
    this.border,
    this.bgOpacity,
    this.package,
  });

  final LedgerIconButtonSize size;
  final void Function(BuildContext context)? onPressed;
  final Color? iconColor;
  final String assetPath;
  final String trackLabel;
  final String semanticsLabel;
  final BorderRadius? borderRadius;
  final Color? color;
  final EdgeInsets? padding;
  final BoxBorder? border;
  final double? bgOpacity;
  final String? package;

  @override
  Widget build(BuildContext context) {
    final disabled = onPressed == null;
    return CustomGestureDetector(
      semanticsLabel: semanticsLabel,
      context: context,
      trackLabel: trackLabel,
      onTap: () => onPressed?.call(context),
      behavior: HitTestBehavior.translucent,
      child: Container(
        width: size.value,
        padding: padding,
        decoration: BoxDecoration(
          color: color?.withOpacity(disabled ? 0.3 : bgOpacity ?? 1.0),
          border: border,
          borderRadius: borderRadius ?? BorderRadius.circular(16.r),
        ),
        child: Center(
          child: _BuildIcon(
            assetPath: assetPath,
            iconColor: iconColor,
            iconSize: size.value,
            disabled: disabled,
            package: package,
          ),
        ),
      ),
    );
  }
}

class _BuildIcon extends StatelessWidget {
  const _BuildIcon({
    required this.assetPath,
    this.package,
    this.iconColor,
    this.iconSize,
    this.disabled = false,
  });
  final String assetPath;
  final Color? iconColor;
  final double? iconSize;
  final bool disabled;
  final String? package;

  @override
  Widget build(BuildContext context) => SvgPicture.asset(
      assetPath,
      colorFilter: ColorFilter.mode(
        (iconColor ?? context.baseBlack).withOpacity(disabled ? 0.3 : 1.0),
        BlendMode.srcIn,
      ),
      height: iconSize,
      width: iconSize,
      fit: BoxFit.scaleDown,
      package: package,
    );
}

enum LedgerIconButtonSize {
  /// 16.sp
  small(16),

  /// 20.sp
  medium(20),

  /// 24.sp
  large(24),

  /// 32.sp
  extraLarge(32),

  /// 48.sp
  huge(48);

  const LedgerIconButtonSize(this.size);

  final double size;

  /// Give value in sp
  double get value => size.sp;
}
