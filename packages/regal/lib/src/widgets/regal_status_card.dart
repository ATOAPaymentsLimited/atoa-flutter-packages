import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:regal/regal.dart';

class RegalStatusCard extends StatelessWidget {
  const RegalStatusCard.info({
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
  })  : _type = RegalStatusCardTypeEnum.info,
        assert(
          prefixIcon is Icon || prefixIcon is SvgPicture,
          'Prefix icon can be icon or svg',
        );

  const RegalStatusCard.pending({
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
  })  : _type = RegalStatusCardTypeEnum.pending,
        assert(
          prefixIcon is Icon || prefixIcon is SvgPicture,
          'Prefix icon can be icon or svg',
        );

  const RegalStatusCard.success({
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
  })  : _type = RegalStatusCardTypeEnum.success,
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

  /// [RegalStatusCardTypeEnum] used internally inside widget for
  /// speciying named constructor
  final RegalStatusCardTypeEnum _type;

  /// [onClose] adds a close icon on top right, when not null
  final void Function(BuildContext context)? onClose;

  /// [ctaButtonKey] takes the Key parameter of the cta button
  final Key? ctaButtonKey;

  @override
  Widget build(BuildContext context) => Container(
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Spacing.xtraLarge.value),
          color: bgColor ?? _type.bgColor(context),
        ),
        width: double.infinity,
        child: Padding(
          padding: Spacing.large.all,
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (prefixIcon != null) ...[
                    prefixIcon!,
                    Spacing.medium.xBox,
                  ],
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (title != null && title!.isNotEmpty)
                          CustomText.semantics(
                            title!,
                            style: titleStyle ??
                                context.montserrat.headlineLarge.copyWith(
                                  fontSize: 16.sp,
                                  color: textColor ??
                                      _type.foregroundColor(context),
                                  height: 1.3,
                                ),
                          ),
                        if (description != null && description!.isNotEmpty)
                          CustomText.semantics(
                            description!,
                            style: descriptionStyle ??
                                context.bodyLarge?.copyWith(
                                  height: 1.5,
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
                        child: RegalIconButton.iconData(
                          semanticsLabel: 'Close Button',
                          iconData: Icons.close,
                          trackLabel: 'Close Button',
                          iconColor:
                              textColor ?? _type.foregroundColor(context),
                          onPressed: onClose,
                        ),
                      ),
                    ),
                ],
              ),
              if (body != null) ...[
                Spacing.medium.yBox,
                body!,
              ],
              if (onTapCta != null && ctaText != null) ...[
                Spacing.medium.yBox,
                RegalButton.primary(
                  label: ctaText,
                  size: RegalButtonSize.small,
                  style: ElevatedButton.styleFrom(
                    foregroundColor: RegalColors.vividRed,
                    backgroundColor: RegalColors.snowWhite,
                  ),
                  trackLabel: ctaText!,
                  onPressed: onTapCta,
                ),
              ],
            ],
          ),
        ),
      );
}

enum RegalStatusCardTypeEnum {
  info(),
  pending(),
  success();

  const RegalStatusCardTypeEnum();

  Color bgColor(BuildContext context) {
    switch (this) {
      case RegalStatusCardTypeEnum.info:
        return context.grey.shade05;
      case RegalStatusCardTypeEnum.pending:
        return RegalColors.liteOrange;
      case RegalStatusCardTypeEnum.success:
        return RegalColors.darkCyan;
    }
  }

  Color foregroundColor(BuildContext context) {
    switch (this) {
      case RegalStatusCardTypeEnum.info:
        return context.regalColor.licoriceBlack;
      case RegalStatusCardTypeEnum.pending:
        return RegalColors.licoriceBlack;
      case RegalStatusCardTypeEnum.success:
        return RegalColors.snowWhite;
    }
  }
}
