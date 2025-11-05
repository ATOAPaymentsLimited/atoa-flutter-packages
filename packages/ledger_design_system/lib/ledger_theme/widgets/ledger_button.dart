import 'package:flutter/material.dart';
import 'package:ledger_design_system/ledger_design_system.dart';

import '../../mixin/mixins.dart';

class LedgerButton extends StatelessWidget with EventTrackMixin {
  const LedgerButton.primary1({
    super.key,
    required this.trackLabel,
    this.enableTracking = true,
    this.label,
    this.prefixIconPath,
    this.suffixIconPath,
    this.onPressed,
    this.size = LedgerButtonSize.xtraLarge,
    this.loading = false,
    this.enable = true,
    this.trackProperties,
    this.semanticsLabel,
    this.foregroundColor,
    this.backgroundColor,
    this.labelWidget,
    this.textStyle,
    this.shrink = false,
    this.enableFeedback,
  })  : _type = _LedgerButtonType.primary1,
        assert(
          label != null || prefixIconPath != null || suffixIconPath != null,
          'Label or icon must be provided.',
        );

  const LedgerButton.primary2({
    super.key,
    required this.trackLabel,
    this.enableTracking = true,
    this.label,
    this.prefixIconPath,
    this.suffixIconPath,
    this.onPressed,
    this.size = LedgerButtonSize.xtraLarge,
    this.loading = false,
    this.enable = true,
    this.trackProperties,
    this.semanticsLabel,
    this.foregroundColor,
    this.backgroundColor,
    this.labelWidget,
    this.textStyle,
    this.shrink = false,
    this.enableFeedback,
  })  : _type = _LedgerButtonType.primary2,
        assert(
          label != null || prefixIconPath != null || suffixIconPath != null,
          'Label or icon must be provided.',
        );

  const LedgerButton.secondary({
    super.key,
    required this.trackLabel,
    this.enableTracking = true,
    this.label,
    this.prefixIconPath,
    this.suffixIconPath,
    this.onPressed,
    this.size = LedgerButtonSize.xtraLarge,
    this.loading = false,
    this.enable = true,
    this.trackProperties,
    this.semanticsLabel,
    this.foregroundColor,
    this.backgroundColor,
    this.labelWidget,
    this.textStyle,
    this.shrink = false,
    this.enableFeedback,
  })  : _type = _LedgerButtonType.secondary,
        assert(
          label != null || prefixIconPath != null || suffixIconPath != null,
          'Label or icon must be provided.',
        );

  const LedgerButton.tertiary1({
    super.key,
    required this.trackLabel,
    this.enableTracking = true,
    this.label,
    this.prefixIconPath,
    this.suffixIconPath,
    this.onPressed,
    this.size = LedgerButtonSize.xtraLarge,
    this.loading = false,
    this.enable = true,
    this.trackProperties,
    this.semanticsLabel,
    this.foregroundColor,
    this.backgroundColor,
    this.labelWidget,
    this.textStyle,
    this.shrink = false,
    this.enableFeedback,
  })  : _type = _LedgerButtonType.tertiary1,
        assert(
          label != null || prefixIconPath != null || suffixIconPath != null,
          'Label or icon must be provided.',
        );

  const LedgerButton.tertiary2({
    super.key,
    required this.trackLabel,
    this.enableTracking = true,
    this.label,
    this.prefixIconPath,
    this.suffixIconPath,
    this.onPressed,
    this.size = LedgerButtonSize.xtraLarge,
    this.loading = false,
    this.enable = true,
    this.trackProperties,
    this.semanticsLabel,
    this.foregroundColor,
    this.backgroundColor,
    this.labelWidget,
    this.textStyle,
    this.shrink = false,
    this.enableFeedback,
  })  : _type = _LedgerButtonType.tertiary2,
        assert(
          label != null || prefixIconPath != null || suffixIconPath != null,
          'Label or icon must be provided.',
        );

  const LedgerButton.ghost({
    super.key,
    required this.trackLabel,
    this.enableTracking = true,
    this.label,
    this.prefixIconPath,
    this.suffixIconPath,
    this.onPressed,
    this.size = LedgerButtonSize.xtraLarge,
    this.loading = false,
    this.enable = true,
    this.trackProperties,
    this.semanticsLabel,
    this.foregroundColor,
    this.backgroundColor,
    this.labelWidget,
    this.textStyle,
    this.shrink = false,
    this.enableFeedback,
  })  : _type = _LedgerButtonType.ghost,
        assert(
          label != null || prefixIconPath != null || suffixIconPath != null,
          'Label or icon must be provided.',
        );

  final String? label;

  final Widget? labelWidget;

  final bool shrink;

  final String? prefixIconPath;

  final String? suffixIconPath;

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

  final Color? foregroundColor;

  final Color? backgroundColor;

  final TextStyle? textStyle;

  final bool? enableFeedback;

  @override
  Widget build(BuildContext context) {
    final prefixIcon = prefixIconPath != null
        ? SvgThemedIcon(
            svgPath: prefixIconPath!,
            color: _type.iconColor(context),
          )
        : null;
    final suffixIcon = suffixIconPath != null
        ? SvgThemedIcon(
            svgPath: suffixIconPath!,
            color: _type.iconColor(context),
          )
        : null;
    final child = Padding(
      padding: Spacing.lds300.x,
      child: Row(
        mainAxisSize: shrink && size != LedgerButtonSize.xtraLarge
            ? MainAxisSize.min
            : mainAxisSize,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (loading)
            _type.spinner(context)
          else ...[
            if (prefixIcon != null) prefixIcon,
            if (prefixIcon != null) Spacing.lds150.xBox,
            if (labelWidget != null) labelWidget!,
            if (labelWidget != null) Spacing.lds150.xBox,
            if (label != null)
              CustomText.semantics(
                label!,
                textAlign: TextAlign.center,
                style: style(context),
              ),
            if (suffixIcon != null) Spacing.lds150.xBox,
            if (suffixIcon != null) suffixIcon,
          ],
        ],
      ),
    );

    return DisableWidget(
      ignoring: !enable,
      child: CustomInkWell(
        trackLabel: semanticsLabel ?? '$label Button',
        semanticsLabel: semanticsLabel ?? '$label Button',
        context: context,
        enableFeedback: enableFeedback ?? LedgerUtility.enableButtonFeedbacks,
        onTap: onClick(context),
        enabled: enable,
        focusColor: context.grey.shade50,
        borderRadius: borderRadius,
        splashColor: context.grey.shade50,
        hoverColor: context.grey.shade100,
        child: Container(
          height: size.value,
          decoration: BoxDecoration(
            border: _type == _LedgerButtonType.ghost
                ? Border.all(
                    color: context.baseBlack,
                  )
                : null,
            color: backgroundColor ?? _type.backgroundColor(context),
            borderRadius: borderRadius,
          ),
          child: child,
        ),
      ),
    );
  }

  TextStyle style(BuildContext context) {
    if (textStyle != null) return textStyle!;
    final sizeStyle = switch (size) {
      LedgerButtonSize.xtraLarge => context.buttonMedium.bold,
      LedgerButtonSize.large => context.buttonMedium.bold,
      _ => context.buttonSmall.bold,
    };
    final typeStyle = switch (_type) {
      _LedgerButtonType.primary1 =>
        sizeStyle.copyWith(color: foregroundColor ?? context.intactWhite),
      _LedgerButtonType.primary2 =>
        sizeStyle.copyWith(color: foregroundColor ?? context.baseWhite),
      _LedgerButtonType.secondary =>
        sizeStyle.copyWith(color: foregroundColor ?? context.baseBlack),
      _LedgerButtonType.tertiary1 =>
        sizeStyle.copyWith(color: foregroundColor ?? context.primary.shade500),
      _LedgerButtonType.tertiary2 =>
        sizeStyle.copyWith(color: foregroundColor ?? context.baseBlack),
      _LedgerButtonType.ghost =>
        sizeStyle.copyWith(color: foregroundColor ?? context.baseBlack),
    };
    return typeStyle;
  }

  BorderRadius get borderRadius => switch (size) {
        LedgerButtonSize.medium => RadiusSpacing.rdss.all,
        LedgerButtonSize.small => RadiusSpacing.rdsxs.all,
        _ => RadiusSpacing.rdsm.all,
      };

  Widget get spacing => switch (size) {
        LedgerButtonSize.small => Spacing.lds200.xBox,
        LedgerButtonSize.xtraSmall => Spacing.lds200.xBox,
        _ => Spacing.lds300.xBox,
      };

  MainAxisSize get mainAxisSize => switch (size) {
        LedgerButtonSize.medium => MainAxisSize.min,
        LedgerButtonSize.small => MainAxisSize.min,
        LedgerButtonSize.xtraSmall => MainAxisSize.min,
        _ => switch (_type) {
            _LedgerButtonType.tertiary1 => MainAxisSize.min,
            _LedgerButtonType.tertiary2 => MainAxisSize.min,
            _ => MainAxisSize.max,
          },
      };

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

  Color iconColor(BuildContext ctx) => switch (this) {
        primary1 => ctx.intactWhite,
        primary2 => ctx.baseWhite,
        secondary => ctx.baseBlack,
        tertiary1 => ctx.primary.shade500,
        tertiary2 => ctx.baseBlack,
        ghost => ctx.baseBlack,
      };

  LedgerInfiniteSpinner spinner(BuildContext context) => switch (this) {
        primary1 => LedgerInfiniteSpinner.dark(size: spinnerSize),
        primary2 => context.brightness.map(
            (l) => LedgerInfiniteSpinner.dark(size: spinnerSize),
            (d) => LedgerInfiniteSpinner.light(size: spinnerSize),
          ),
        secondary => LedgerInfiniteSpinner.dark(size: spinnerSize),
        tertiary1 => LedgerInfiniteSpinner(size: spinnerSize),
        tertiary2 => LedgerInfiniteSpinner(size: spinnerSize),
        ghost => LedgerInfiniteSpinner(size: spinnerSize),
      };

  double get spinnerSize => Spacing.lds500.value;

  Color backgroundColor(BuildContext context) => switch (this) {
        primary1 => context.primary.shade500,
        primary2 => context.baseBlack,
        secondary => context.grey.shade50,
        tertiary1 => Colors.transparent,
        tertiary2 => Colors.transparent,
        ghost => context.baseWhite,
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
}
