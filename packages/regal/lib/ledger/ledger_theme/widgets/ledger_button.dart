import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:regal/ledger/ledger_theme/ledger_theme.dart';
import 'package:regal/ledger/mixin/mixins.dart';
import 'package:regal/ledger/spacing/spacing.dart';

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
    this.size = LedgerButtonSize.xtraLarge,
    this.loading = false,
    this.enable = true,
    this.trackProperties,
    this.semanticsLabel,
    this.shrink = false,
    this.loadingIndicatorColor,
    this.labelWidget,
    this.backgroundColor,
    this.foregroundColor,
    this.borderRadius,
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
    this.size = LedgerButtonSize.xtraLarge,
    this.loading = false,
    this.enable = true,
    this.trackProperties,
    this.semanticsLabel,
    this.shrink = false,
    this.loadingIndicatorColor,
    this.labelWidget,
    this.backgroundColor,
    this.foregroundColor,
    this.borderRadius,
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
    this.size = LedgerButtonSize.xtraLarge,
    this.loading = false,
    this.enable = true,
    this.trackProperties,
    this.semanticsLabel,
    this.shrink = false,
    this.loadingIndicatorColor,
    this.labelWidget,
    this.mainAxisAlignment = MainAxisAlignment.center,
    this.backgroundColor,
    this.foregroundColor,
    this.borderRadius,
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
    this.size = LedgerButtonSize.xtraLarge,
    this.loading = false,
    this.enable = true,
    this.trackProperties,
    this.semanticsLabel,
    this.shrink = false,
    this.loadingIndicatorColor,
    this.labelWidget,
    this.backgroundColor,
    this.foregroundColor,
    this.borderRadius,
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
    this.size = LedgerButtonSize.xtraLarge,
    this.loading = false,
    this.enable = true,
    this.trackProperties,
    this.semanticsLabel,
    this.shrink = false,
    this.loadingIndicatorColor,
    this.labelWidget,
    this.backgroundColor,
    this.foregroundColor,
    this.borderRadius,
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
    this.size = LedgerButtonSize.xtraLarge,
    this.loading = false,
    this.enable = true,
    this.trackProperties,
    this.semanticsLabel,
    this.shrink = false,
    this.loadingIndicatorColor,
    this.labelWidget,
    this.backgroundColor,
    this.foregroundColor,
    this.borderRadius,
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

  final Color? backgroundColor;

  final Color? foregroundColor;

  final double? borderRadius;

  @override
  Widget build(BuildContext context) {
    final child = Row(
      mainAxisSize: shrink ? MainAxisSize.min : MainAxisSize.max,
      mainAxisAlignment: mainAxisAlignment,
      children: [
        if (shrink) Spacing.lds300.xBox,
        if (loading) ...[
          LedgerInfiniteSpinner(
            color:
                loadingIndicatorColor ?? _type.loadingIndicatorColor(context),
            height: 18.sp,
          ),
          if (label != null) ...[
            Spacing.lds150.xBox,
            labelWidget ??
                AutoSizeText(
                  label!,
                  textAlign: TextAlign.center,
                  semanticsLabel: label,
                ),
          ],
        ] else ...[
          if (prefixIcon != null) prefixIcon!,
          if (prefixIcon != null && label != null) Spacing.lds150.xBox,
          if (label != null)
            labelWidget ??
                AutoSizeText(
                  label!,
                  textAlign: TextAlign.center,
                  semanticsLabel: label,
                ),
          if (suffixIcon != null && label != null) Spacing.lds100.xBox,
          if (suffixIcon != null) suffixIcon!,
          if (shrink) Spacing.lds300.xBox,
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
              textStyle: WidgetStatePropertyAll(size.style(context),),
              shape: WidgetStatePropertyAll(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(borderRadius ?? Spacing.lds150.value),
                ),
              ),
              foregroundColor: _ElevatedButtonColor(context.intactWhite),
              backgroundColor: _ElevatedButtonColor(context.primary.shade500),
              surfaceTintColor: WidgetStatePropertyAll(context.grey.shade500),
              elevation: const WidgetStatePropertyAll(0),
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
              textStyle: WidgetStatePropertyAll(size.style(context),),
              shape: WidgetStatePropertyAll(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(Spacing.lds150.value),
                ),
              ),
              foregroundColor: _ElevatedButtonColor(
                foregroundColor ?? context.baseWhite,
              ),
              backgroundColor: _ElevatedButtonColor(
                backgroundColor ?? context.baseBlack,
              ),
              surfaceTintColor: WidgetStatePropertyAll(context.grey.shade500),
              elevation: const WidgetStatePropertyAll(0),
            ),
            child: child,
          );
        case _LedgerButtonType.secondary:
          return ElevatedButton(
            onPressed: onPressed != null ? onClick(context) : null,
            style: (style ?? Theme.of(context).elevatedButtonTheme.style)
                ?.copyWith(
              fixedSize: WidgetStatePropertyAll(
                Size.fromHeight(size.value.sp),
              ),
              textStyle: WidgetStatePropertyAll(size.style(context),),
              shape: WidgetStatePropertyAll(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(Spacing.lds150.value),
                ),
              ),
              foregroundColor: _ElevatedButtonColor(
                foregroundColor ?? context.baseBlack,
              ),
              backgroundColor: _ElevatedButtonColor(
                backgroundColor ?? context.grey.shade50,
              ),
              surfaceTintColor: WidgetStatePropertyAll(context.grey.shade500),
              elevation: const WidgetStatePropertyAll(0),
            ),
            child: child,
          );
        case _LedgerButtonType.tertiary1:
          return ElevatedButton(
            onPressed: onPressed != null ? onClick(context) : null,
            style: (style ?? Theme.of(context).elevatedButtonTheme.style)
                ?.copyWith(
              fixedSize: WidgetStatePropertyAll(
                Size.fromHeight(size.value.sp),
              ),
              textStyle: WidgetStatePropertyAll(size.style(context),),
              shape: WidgetStatePropertyAll(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(Spacing.lds150.value),
                ),
              ),
              foregroundColor: _ElevatedButtonColor(context.primary.shade500),
              backgroundColor: _ElevatedButtonColor(Colors.transparent),
              surfaceTintColor: WidgetStatePropertyAll(context.grey.shade500),
              elevation: const WidgetStatePropertyAll(0),
            ),
            child: child,
          );
        case _LedgerButtonType.tertiary2:
          return ElevatedButton(
            onPressed: onPressed != null ? onClick(context) : null,
            style: (style ?? Theme.of(context).elevatedButtonTheme.style)
                ?.copyWith(
              fixedSize: WidgetStatePropertyAll(
                Size.fromHeight(size.value.sp),
              ),
              textStyle: WidgetStatePropertyAll(size.style(context),),
              shape: WidgetStatePropertyAll(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(Spacing.lds150.value),
                ),
              ),
              foregroundColor: _ElevatedButtonColor(context.baseBlack),
              backgroundColor: _ElevatedButtonColor(Colors.transparent),
              surfaceTintColor: WidgetStatePropertyAll(context.grey.shade500),
              elevation: const WidgetStatePropertyAll(0),
            ),
            child: child,
          );
        case _LedgerButtonType.ghost:
          return ElevatedButton(
            onPressed: onPressed != null ? onClick(context) : null,
            style: (style ?? Theme.of(context).elevatedButtonTheme.style)
                ?.copyWith(
              fixedSize: WidgetStatePropertyAll(
                Size.fromHeight(size.value.sp),
              ),
              textStyle: WidgetStatePropertyAll(size.style(context),),
              shape: WidgetStatePropertyAll(
                RoundedRectangleBorder(
                  side: BorderSide(
                    color: context.baseBlack,
                    width: 1.sp,
                  ),
                  borderRadius: BorderRadius.circular(Spacing.lds150.value),
                ),
              ),
              foregroundColor: _ElevatedButtonColor(context.baseBlack),
              backgroundColor: _ElevatedButtonColor(context.baseWhite),
              surfaceTintColor: WidgetStatePropertyAll(context.grey.shade500),
              elevation: const WidgetStatePropertyAll(0),
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
  ghost;

  Color loadingIndicatorColor(BuildContext ctx) => switch (this) {
        primary1 => ctx.intactWhite,
        primary2 => ctx.baseWhite,
        secondary => ctx.baseBlack,
        tertiary1 => ctx.baseBlack,
        tertiary2 => ctx.baseBlack,
        ghost => ctx.baseBlack,
      };
}

enum LedgerButtonSize {
  xtraLarge(48),
  large(40),
  medium(32),
  small(28),
  xtraSmall(24);

  const LedgerButtonSize(this.value);

  final double value;

  TextStyle style(BuildContext context) => switch (this) {
      LedgerButtonSize.xtraLarge => context.buttonMedium.bold,
      LedgerButtonSize.large => context.buttonMedium.bold,
      _ => context.buttonSmall.bold,
    };
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
