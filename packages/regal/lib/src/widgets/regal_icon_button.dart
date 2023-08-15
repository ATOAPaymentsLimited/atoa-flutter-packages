import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:regal/regal.dart';

class RegalIconButton extends StatelessWidget {
  const RegalIconButton.asset({
    super.key,
    required String assetPath,
    this.size = RegalIconButtonSize.large,
    this.onPressed,
    this.iconColor,
    required this.semanticsLabel,
    required this.trackLabel,
    this.borderRadius,
    this.color,
  })  : _type = _RegalIconButtonType.asset,
        _assetPath = assetPath,
        _iconData = null;

  const RegalIconButton.iconData({
    super.key,
    required IconData iconData,
    this.size = RegalIconButtonSize.large,
    this.onPressed,
    this.iconColor,
    required this.trackLabel,
    required this.semanticsLabel,
    this.borderRadius,
    this.color,
  })  : _type = _RegalIconButtonType.icon,
        _assetPath = '',
        _iconData = iconData;
  final _RegalIconButtonType _type;
  final RegalIconButtonSize size;
  final void Function(BuildContext context)? onPressed;
  final Color? iconColor;
  final String _assetPath;
  final IconData? _iconData;
  final String trackLabel;
  final String semanticsLabel;
  final BorderRadius? borderRadius;
  final Color? color;

  @override
  Widget build(BuildContext context) => CustomGestureDetector(
        semanticsLabel: semanticsLabel,
        context: context,
        trackLabel: trackLabel,
        onTap: () => onPressed?.call(context),
        behavior: HitTestBehavior.translucent,
        child: Container(
          width: size.value,
          decoration: BoxDecoration(
            color: color,
            borderRadius: borderRadius ?? BorderRadius.circular(16.r),
          ),
          child: Center(
            child: _BuildIcon(
              type: _type,
              assetPath: _assetPath,
              iconData: _iconData,
              iconColor: iconColor,
              iconSize: size.value,
            ),
          ),
        ),
      );
}

class _BuildIcon extends StatelessWidget {
  const _BuildIcon({
    required this.type,
    this.assetPath = '',
    this.iconData = Icons.close,
    this.iconColor,
    this.iconSize,
  });
  final _RegalIconButtonType type;
  final String assetPath;
  final IconData? iconData;
  final Color? iconColor;
  final double? iconSize;

  @override
  Widget build(BuildContext context) {
    if (type == _RegalIconButtonType.asset) {
      return SvgPicture.asset(
        assetPath,
        colorFilter: ColorFilter.mode(
          iconColor ?? context.regalColor.licoriceBlack,
          BlendMode.srcIn,
        ),
        height: iconSize,
        width: iconSize,
        fit: BoxFit.scaleDown,
      );
    }
    if (type == _RegalIconButtonType.icon) {
      return Icon(
        iconData,
        color: iconColor ?? context.regalColor.licoriceBlack,
        size: iconSize,
      );
    }
    return const SizedBox.shrink();
  }
}

enum _RegalIconButtonType { icon, asset }

enum RegalIconButtonSize {
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

  const RegalIconButtonSize(this.size);

  final double size;

  /// Give value in sp
  double get value => size.sp;
}
