import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:regal/regal.dart';
import 'package:regal/src/mixin/event_track_mixin.dart';

class LedgerButton extends StatelessWidget with EventTrackMixin {
  const LedgerButton.primary1({
    super.key,
    required this.trackLabel,
    this.enableTracking = true,
    this.label,
    this.prefixIcon,
    this.suffixIcon,
    this.onPressed,
    this.style,
    this.size = LedgerButtonSize.large,
    this.loading = false,
    this.enable = true,
    this.trackProperties,
    this.semanticsLabel,
    this.shrink = false,
    this.loadingIndicatorColor,
    this.labelWidget,
  })  : _type = _LedgerButtonType.primary1,
        assert(
          label != null || prefixIcon != null || suffixIcon != null,
          'Label or icon must be provided.',
        ),
        mainAxisAlignment = MainAxisAlignment.center;

  const LedgerButton.primary2({
    super.key,
    required this.trackLabel,
    this.enableTracking = true,
    this.label,
    this.prefixIcon,
    this.suffixIcon,
    this.onPressed,
    this.style,
    this.size = LedgerButtonSize.large,
    this.loading = false,
    this.enable = true,
    this.trackProperties,
    this.semanticsLabel,
    this.shrink = false,
    this.loadingIndicatorColor,
    this.labelWidget,
  })  : _type = _LedgerButtonType.primary2,
        assert(
          label != null || prefixIcon != null || suffixIcon != null,
          'Label or icon must be provided.',
        ),
        mainAxisAlignment = MainAxisAlignment.center;

  const LedgerButton.secondary({
    super.key,
    required this.trackLabel,
    this.enableTracking = true,
    this.label,
    this.prefixIcon,
    this.suffixIcon,
    this.onPressed,
    this.style,
    this.size = LedgerButtonSize.large,
    this.loading = false,
    this.enable = true,
    this.trackProperties,
    this.semanticsLabel,
    this.shrink = false,
    this.loadingIndicatorColor,
    this.labelWidget,
    this.mainAxisAlignment = MainAxisAlignment.center,
  })  : _type = _LedgerButtonType.secondary,
        assert(
          label != null || prefixIcon != null || suffixIcon != null,
          'Label or icon must be provided.',
        );

  const LedgerButton.tertiary1({
    super.key,
    required this.trackLabel,
    this.enableTracking = true,
    this.label,
    this.prefixIcon,
    this.suffixIcon,
    this.onPressed,
    this.style,
    this.size = LedgerButtonSize.large,
    this.loading = false,
    this.enable = true,
    this.trackProperties,
    this.semanticsLabel,
    this.shrink = false,
    this.loadingIndicatorColor,
    this.labelWidget,
  })  : _type = _LedgerButtonType.tertiary1,
        assert(
          label != null || prefixIcon != null || suffixIcon != null,
          'Label or icon must be provided.',
        ),
        mainAxisAlignment = MainAxisAlignment.center;

  const LedgerButton.tertiary2({
    super.key,
    required this.trackLabel,
    this.enableTracking = true,
    this.label,
    this.prefixIcon,
    this.suffixIcon,
    this.onPressed,
    this.style,
    this.size = LedgerButtonSize.large,
    this.loading = false,
    this.enable = true,
    this.trackProperties,
    this.semanticsLabel,
    this.shrink = false,
    this.loadingIndicatorColor,
    this.labelWidget,
  })  : _type = _LedgerButtonType.tertiary2,
        assert(
          label != null || prefixIcon != null || suffixIcon != null,
          'Label or icon must be provided.',
        ),
        mainAxisAlignment = MainAxisAlignment.center;

  const LedgerButton.ghost({
    super.key,
    required this.trackLabel,
    this.enableTracking = true,
    this.label,
    this.prefixIcon,
    this.suffixIcon,
    this.onPressed,
    this.style,
    this.size = LedgerButtonSize.large,
    this.loading = false,
    this.enable = true,
    this.trackProperties,
    this.semanticsLabel,
    this.shrink = false,
    this.loadingIndicatorColor,
    this.labelWidget,
  })  : _type = _LedgerButtonType.ghost,
        assert(
          label != null || prefixIcon != null || suffixIcon != null,
          'Label or icon must be provided.',
        ),
        mainAxisAlignment = MainAxisAlignment.center;

  final String? label;

  final Widget? labelWidget;

  final Widget? prefixIcon;

  final Widget? suffixIcon;

  final ButtonStyle? style;

  final VoidCallback? onPressed;

  final LedgerButtonSize size;

  final _LedgerButtonType _type;

  /// [trackLabel] helps to identify the button, on analytics
  final String trackLabel;

  final bool enableTracking;

  final bool loading;

  final bool enable;

  final Map<String, dynamic>? trackProperties;

  final String? semanticsLabel;
  final MainAxisAlignment mainAxisAlignment;

  final Color? loadingIndicatorColor;

  /// [shrink] will minimize the button width to hug its contents
  final bool shrink;

  @override
  Widget build(BuildContext context) {
    final child = Row(
      mainAxisSize: shrink ? MainAxisSize.min : MainAxisSize.max,
      mainAxisAlignment: mainAxisAlignment,
      children: [
        if (shrink) Spacing.medium.xBox,
        if (loading)
          GradientCircularProgressIndicator(
            radius: 18.sp,
            gradientColor: context.theme.brightness == Brightness.light &&
                    (_type == _LedgerButtonType.secondary ||
                        _type == _LedgerButtonType.tertiary1 ||
                        _type == _LedgerButtonType.tertiary2)
                ? context.theme.primaryColor
                : loadingIndicatorColor ?? Colors.white,
          )
        else ...[
          if (prefixIcon != null) prefixIcon!,
          if (prefixIcon != null && label != null) Spacing.small.xBox,
          if (label != null)
            labelWidget ??
                AutoSizeText(
                  label!,
                  textAlign: TextAlign.center,
                  semanticsLabel: label,
                ),
          if (suffixIcon != null && label != null) Spacing.small.xBox,
          if (suffixIcon != null) suffixIcon!,
          if (shrink) Spacing.medium.xBox,
        ],
      ],
    );

    Widget buttonType() {
      switch (_type) {
        case _LedgerButtonType.primary1:
          return ElevatedButton(
            onPressed: onPressed != null ? onClick(context) : null,
            style: (style ?? Theme.of(context).elevatedButtonTheme.style)
                ?.copyWith(
              fixedSize: WidgetStatePropertyAll(
                Size.fromHeight(size.value.sp),
              ),
              shape: WidgetStatePropertyAll(
                RoundedRectangleBorder(
                  side: BorderSide(
                    color: context.baseColors.black,
                    width: 1.sp,
                  ),
                  borderRadius:
                      BorderRadius.circular(Spacing.smallMedium.value),
                ),
              ),
              foregroundColor: _ElevatedButtonColor(context.intactColors.white),
              backgroundColor:
                  _ElevatedButtonColor(context.brandColors.primary.shade500),
            ),
            child: child,
          );
        case _LedgerButtonType.primary2:
          return ElevatedButton(
            onPressed: onPressed != null ? onClick(context) : null,
            style: (style ?? Theme.of(context).elevatedButtonTheme.style)
                ?.copyWith(
              fixedSize: WidgetStatePropertyAll(
                Size.fromHeight(size.value.sp),
              ),
              shape: WidgetStatePropertyAll(
                RoundedRectangleBorder(
                  side: BorderSide(
                    color: context.baseColors.black,
                    width: 1.sp,
                  ),
                  borderRadius:
                      BorderRadius.circular(Spacing.smallMedium.value),
                ),
              ),
              foregroundColor: _ElevatedButtonColor(context.baseColors.white),
              backgroundColor: _ElevatedButtonColor(context.baseColors.black),
            ),
            child: child,
          );
        case _LedgerButtonType.secondary:
          return OutlinedButton(
            onPressed: onPressed != null ? onClick(context) : null,
            style: (style ?? Theme.of(context).outlinedButtonTheme.style)
                ?.copyWith(
              fixedSize: WidgetStatePropertyAll(
                Size.fromHeight(size.value.sp),
              ),
              shape: WidgetStatePropertyAll(
                RoundedRectangleBorder(
                  side: BorderSide(
                    color: context.baseColors.black,
                    width: 1.sp,
                  ),
                  borderRadius:
                      BorderRadius.circular(Spacing.smallMedium.value),
                ),
              ),
              foregroundColor: _ElevatedButtonColor(context.baseColors.black),
              backgroundColor:
                  _ElevatedButtonColor(context.neutralColors.grey.shade50),
            ),
            child: child,
          );
        case _LedgerButtonType.tertiary1:
          return TextButton(
            onPressed: onPressed != null ? onClick(context) : null,
            style: (style ?? Theme.of(context).textButtonTheme.style)?.copyWith(
              fixedSize: WidgetStatePropertyAll(
                Size.fromHeight(size.value.sp),
              ),
              shape: WidgetStatePropertyAll(
                RoundedRectangleBorder(
                  side: BorderSide(
                    color: context.baseColors.black,
                    width: 1.sp,
                  ),
                  borderRadius:
                      BorderRadius.circular(Spacing.smallMedium.value),
                ),
              ),
              foregroundColor:
                  _ElevatedButtonColor(context.brandColors.primary.shade500),
              backgroundColor: _ElevatedButtonColor(context.baseColors.white),
            ),
            child: child,
          );
        case _LedgerButtonType.tertiary2:
          return TextButton(
            onPressed: onPressed != null ? onClick(context) : null,
            style: (style ?? Theme.of(context).textButtonTheme.style)?.copyWith(
              fixedSize: WidgetStatePropertyAll(
                Size.fromHeight(size.value.sp),
              ),
              shape: WidgetStatePropertyAll(
                RoundedRectangleBorder(
                  side: BorderSide(
                    color: context.baseColors.black,
                    width: 1.sp,
                  ),
                  borderRadius:
                      BorderRadius.circular(Spacing.smallMedium.value),
                ),
              ),
              foregroundColor: _ElevatedButtonColor(context.baseColors.black),
              backgroundColor: _ElevatedButtonColor(context.baseColors.white),
            ),
            child: child,
          );
        case _LedgerButtonType.ghost:
          return TextButton(
            onPressed: onPressed != null ? onClick(context) : null,
            style: (style ?? Theme.of(context).textButtonTheme.style)?.copyWith(
              fixedSize: WidgetStatePropertyAll(
                Size.fromHeight(size.value.sp),
              ),
              shape: WidgetStatePropertyAll(
                RoundedRectangleBorder(
                  side: BorderSide(
                    color: context.baseColors.black,
                    width: 1.sp,
                  ),
                  borderRadius:
                      BorderRadius.circular(Spacing.smallMedium.value),
                ),
              ),
              foregroundColor: _ElevatedButtonColor(context.baseColors.black),
              backgroundColor: _ElevatedButtonColor(context.baseColors.white),
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
      child: DisableWidget(
        ignoring: !enable,
        child: buttonType(),
      ),
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

enum _LedgerButtonType {
  primary1,
  primary2,
  secondary,
  tertiary1,
  tertiary2,
  ghost
}

enum LedgerButtonSize {
  xtraLarge(48),
  large(40),
  medium(32),
  small(28),
  xtraSmall(24);

  const LedgerButtonSize(this.value);

  final double value;
}

class _ElevatedButtonColor extends WidgetStateProperty<Color?>
    with Diagnosticable {
  _ElevatedButtonColor(this.color);

  final Color color;

  @override
  Color? resolve(Set<WidgetState> states) {
    if (states.contains(WidgetState.disabled)) {
      return color.withOpacity(0.4);
    }
    return color;
  }
}
