import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ledger_design_system/ledger_design_system.dart';

class LedgerStatusCard extends StatelessWidget {
  const LedgerStatusCard.info({
    super.key,
    this.title,
    this.description,
    this.prefixIcon,
    this.body,
    this.ctaText,
    this.onTapCta,
    this.onClose,
    this.ctaButtonKey,
    this.bgColor,
    this.textColor,
    this.titleStyle,
    this.descriptionStyle,
    this.trailingAssetPath,
    this.onTrailingPressed,
  })  : _type = LedgerStatusCardTypeEnum.info,
        assert(
          prefixIcon is Icon || prefixIcon is SvgPicture,
          'Prefix icon can be icon or svg',
        );

  const LedgerStatusCard.pending({
    super.key,
    this.description,
    this.title,
    this.prefixIcon,
    this.body,
    this.ctaText,
    this.onTapCta,
    this.onClose,
    this.ctaButtonKey,
    this.bgColor,
    this.textColor,
    this.titleStyle,
    this.descriptionStyle,
    this.trailingAssetPath,
    this.onTrailingPressed,
  })  : _type = LedgerStatusCardTypeEnum.pending,
        assert(
          prefixIcon is Icon || prefixIcon is SvgPicture,
          'Prefix icon can be icon or svg',
        );

  const LedgerStatusCard.success({
    super.key,
    this.title,
    this.description,
    this.prefixIcon,
    this.body,
    this.onClose,
    this.bgColor,
    this.titleStyle,
    this.descriptionStyle,
    this.textColor,
    this.trailingAssetPath,
    this.onTrailingPressed,
  })  : _type = LedgerStatusCardTypeEnum.success,
        ctaText = null,
        onTapCta = null,
        ctaButtonKey = null,
        assert(
          prefixIcon is Icon || prefixIcon is SvgPicture,
          'Prefix icon can be icon or svg',
        );

  /// [title] specifies the heading of the card.
  final String? title;

  /// [title] specifies the heading of the card.
  final String? description;

  /// [titleStyle] specifies the style of heading of the card.
  final TextStyle? titleStyle;

  /// [descriptionStyle] specifies the style of the description of the card.
  final TextStyle? descriptionStyle;

  /// [prefixIcon] defines the icon to show before
  /// title, and description in a row
  final Widget? prefixIcon;

  /// [body] can be used to show custom ui elements
  /// specific to status card like progress, or any
  /// other info.
  ///
  /// It will be displayed just after description,
  /// but before CTA
  final Widget? body;

  /// [ctaText] will be the label of the main cta button
  ///
  /// The cta will still be invisible, until a callback is
  /// provided with [onTapCta]
  final String? ctaText;

  /// [onTapCta] will be used to provide callback to main cta
  ///
  /// This requires [ctaText] to show CTA button on card
  final VoidCallback? onTapCta;

  /// [bgColor] Can be used to change background color
  ///
  /// Should be used specifically, as by default all cards have
  /// their corresponding background colors
  final Color? bgColor;

  /// [textColor] Can be used to change text color
  ///
  /// Should be used specifically, as by default all cards have
  /// their corresponding text colors
  final Color? textColor;

  /// [LedgerStatusCardTypeEnum] used internally inside widget for
  /// speciying named constructor
  final LedgerStatusCardTypeEnum _type;

  /// [onClose] adds a close icon on top right, when not null
  final void Function(BuildContext context)? onClose;

  /// [ctaButtonKey] takes the Key parameter of the cta button
  final Key? ctaButtonKey;

  /// [trailingAssetPath] sets the icon data for trailing cta, when not null
  ///
  /// [onTrailingPressed] and [trailingAssetPath] should be not null for trailing icon to render
  final String? trailingAssetPath;

  /// [onTrailingPressed] adds a trailing icon on right, when not null
  ///
  /// [onTrailingPressed] and [trailingAssetPath] should be not null for trailing icon to render
  final void Function(BuildContext context)? onTrailingPressed;

  @override
  Widget build(BuildContext context) => Semantics(
        container: true,
        label: 'Ledger Status Card',
        child: Container(
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(Spacing.lds250.value),
            color: bgColor ?? _type.bgColor(context),
          ),
          width: double.infinity,
          child: Padding(
            padding: Spacing.lds200.all,
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (prefixIcon != null) ...[
                      prefixIcon!,
                      Spacing.lds150.xBox,
                    ],
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (title != null && title!.isNotEmpty)
                            CustomText.semantics(
                              title!,
                              style: titleStyle ??
                                  context.body1.bold.copyWith(
                                    color: textColor ??
                                        _type.foregroundColor(context),
                                  ),
                            ),
                          if (description != null && description!.isNotEmpty)
                            CustomText.semantics(
                              description!,
                              style: descriptionStyle ??
                                  context.body2.copyWith(
                                    color: textColor ??
                                        _type.foregroundColor(context),
                                  ),
                            ),
                        ],
                      ),
                    ),
                    if (onClose != null)
                      Transform.translate(
                        offset: Offset(6.sp, 0.sp),
                        child: Semantics(
                          button: true,
                          enabled: true,
                          label: 'Close Button',
                          child: LedgerIconButton(
                            semanticsLabel: 'Close Button',
                            assetPath: 'assets/icons/close.svg',
                            trackLabel: 'Close Button',
                            iconColor:
                                textColor ?? _type.foregroundColor(context),
                            onPressed: onClose,
                          ),
                        ),
                      ),
                    if (trailingAssetPath != null && onTrailingPressed != null)
                      LedgerIconButton(
                        assetPath: trailingAssetPath!,
                        trackLabel: 'Trailing Icon Button',
                        semanticsLabel: 'Trailing Icon Button',
                        onPressed: onTrailingPressed,
                      ),
                  ],
                ),
                if (body != null) ...[
                  Spacing.lds150.yBox,
                  body!,
                ],
                if (onTapCta != null && ctaText != null) ...[
                  Spacing.lds150.yBox,
                  LedgerButton.primary2(
                    label: ctaText,
                    style: ElevatedButton.styleFrom(
                      foregroundColor: LedgerColors.lightColors.brand.primary.shade500,
                      backgroundColor: LedgerColors.lightColors.base.white,
                    ),
                    trackLabel: ctaText!,
                    onPressed: onTapCta,
                  ),
                ],
              ],
            ),
          ),
        ),
      );
}

enum LedgerStatusCardTypeEnum {
  info(),
  pending(),
  success();

  const LedgerStatusCardTypeEnum();

  Color bgColor(BuildContext context) {
    switch (this) {
      case LedgerStatusCardTypeEnum.info:
        return context.grey.shade50;
      case LedgerStatusCardTypeEnum.pending:
        return LedgerColors.lightColors.semantic.notice.defaultColor;
      case LedgerStatusCardTypeEnum.success:
        return LedgerColors.lightColors.semantic.positive.defaultColor;
    }
  }

  Color foregroundColor(BuildContext context) {
    switch (this) {
      case LedgerStatusCardTypeEnum.info:
        return context.baseBlack;
      case LedgerStatusCardTypeEnum.pending:
        return context.intactBlack;
      case LedgerStatusCardTypeEnum.success:
        return context.intactWhite;
    }
  }
}
