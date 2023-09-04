import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:regal/regal.dart';
import 'package:regal/src/mixin/event_track_mixin.dart';

class RegalButton extends StatelessWidget with EventTrackMixin {
  const RegalButton.primary({
    super.key,
    required this.trackLabel,
    this.enableTracking = true,
    this.label,
    this.prefixIcon,
    this.suffixIcon,
    this.onPressed,
    this.style,
    this.size = RegalButtonSize.large,
    this.loading = false,
    this.trackProperties,
    this.semanticsLabel,
  })  : _type = _RegalButtonType.primary,
        assert(
          label != null || prefixIcon != null || suffixIcon != null,
          'Label or icon must be provided.',
        );

  const RegalButton.secondary({
    super.key,
    required this.trackLabel,
    this.enableTracking = true,
    this.label,
    this.prefixIcon,
    this.suffixIcon,
    this.onPressed,
    this.style,
    this.size = RegalButtonSize.large,
    this.loading = false,
    this.trackProperties,
    this.semanticsLabel,
  })  : _type = _RegalButtonType.secondary,
        assert(
          label != null || prefixIcon != null || suffixIcon != null,
          'Label or icon must be provided.',
        );

  const RegalButton.tertiary({
    super.key,
    required this.trackLabel,
    this.enableTracking = true,
    this.label,
    this.prefixIcon,
    this.suffixIcon,
    this.onPressed,
    this.style,
    this.size = RegalButtonSize.large,
    this.loading = false,
    this.trackProperties,
    this.semanticsLabel,
  })  : _type = _RegalButtonType.tertiary,
        assert(
          label != null || prefixIcon != null || suffixIcon != null,
          'Label or icon must be provided.',
        );

  final String? label;

  final Widget? prefixIcon;

  final Widget? suffixIcon;

  final ButtonStyle? style;

  final VoidCallback? onPressed;

  final RegalButtonSize size;

  final _RegalButtonType _type;

  /// [trackLabel] helps to identify the button, on analytics
  final String trackLabel;

  final bool enableTracking;

  final bool loading;

  final Map<String, dynamic>? trackProperties;

  final String? semanticsLabel;

  @override
  Widget build(BuildContext context) {
    final child = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (loading)
          GradientCircularProgressIndicator(
            radius: 18.sp,
            gradientColor: context.theme.brightness == Brightness.light &&
                    (_type == _RegalButtonType.secondary ||
                        _type == _RegalButtonType.tertiary)
                ? context.theme.primaryColor
                : Colors.white,
          )
        else ...[
          if (prefixIcon != null) prefixIcon!,
          if (prefixIcon != null && label != null) Spacing.small.xBox,
          if (label != null)
            AutoSizeText(
              label!,
              textAlign: TextAlign.center,
              semanticsLabel: label,
            ),
          if (suffixIcon != null && label != null) Spacing.small.xBox,
          if (suffixIcon != null) suffixIcon!,
        ]
      ],
    );

    Widget buttonType() {
      switch (_type) {
        case _RegalButtonType.primary:
          return ElevatedButton(
            onPressed: onPressed != null ? onClick(context) : null,
            style: (style ?? Theme.of(context).elevatedButtonTheme.style)
                ?.copyWith(
              fixedSize:
                  MaterialStatePropertyAll(Size.fromHeight(size.value.sp)),
            ),
            child: child,
          );
        case _RegalButtonType.secondary:
          return OutlinedButton(
            onPressed: onPressed != null ? onClick(context) : null,
            style: (style ?? Theme.of(context).outlinedButtonTheme.style)
                ?.copyWith(
              fixedSize:
                  MaterialStatePropertyAll(Size.fromHeight(size.value.sp)),
            ),
            child: child,
          );
        case _RegalButtonType.tertiary:
          return TextButton(
            onPressed: onPressed != null ? onClick(context) : null,
            style: (style ?? Theme.of(context).textButtonTheme.style)?.copyWith(
              fixedSize:
                  MaterialStatePropertyAll(Size.fromHeight(size.value.sp)),
            ),
            child: child,
          );
      }
    }

    return Semantics(
      button: true,
      container: true,
      enabled: true,
      explicitChildNodes: true,
      label: semanticsLabel ?? '$label Button',
      child: buttonType(),
    );
  }

  VoidCallback? onClick(BuildContext context) => loading
      ? () {}
      : () {
          onPressed?.call();
          logClickEvent(
            context,
            trackLabel,
            enableTracking: enableTracking,
            trackProperties: trackProperties,
          );
        };
}

enum _RegalButtonType { primary, secondary, tertiary }

enum RegalButtonSize {
  large(60),
  small(44),
  mini(36);

  const RegalButtonSize(this.value);

  final double value;
}
