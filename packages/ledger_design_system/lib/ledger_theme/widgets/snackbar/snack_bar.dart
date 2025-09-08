import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ledger_design_system/ledger_design_system.dart';

import '../../../mixin/mixins.dart';

class Snackbar extends StatelessWidget with EventTrackMixin {
  const Snackbar(
    this.snackbar, {
    super.key,
    this.onClose,
    this.alignment,
    this.leading,
    this.titleTextStyle,
    this.showClose = true,
  });

  final SnackbarType snackbar;
  final VoidCallback? onClose;
  final Alignment? alignment;
  final Widget? leading;
  final bool showClose;
  final TextStyle? titleTextStyle;

  Widget _verticalDivider(BuildContext context) => Container(
        width: 1.sp,
        margin: Spacing.lds50.right + Spacing.lds50.y,
        decoration: BoxDecoration(
          border: Border(
            left: Divider.createBorderSide(
              context,
              color: context.grey.shade400,
              width: 1.sp,
            ),
          ),
        ),
      );

  Widget? trailing(BuildContext context) {
    final close = SizedBox.square(
      dimension: LedgerIconButtonSize.small.value,
      child: LedgerIconButton(
        semanticsLabel: 'Close Snackbar',
        onPressed: (context) => onClose?.call(),
        assetPath: 'assets/icons/close.svg',
        package: 'ledger_design_system',
        trackLabel: 'Close Snackbar',
        size: LedgerIconButtonSize.small,
        iconColor: snackbar.type.closeColor(context),
      ),
    );

    final cta = snackbar.ctaText != null && snackbar.onCTA != null
        ? TextButton(
            onPressed: () {
              snackbar.onCTA!();
              logClickEvent(
                context,
                '${snackbar.ctaText} CTA',
                enableTracking: true,
              );
            },
            style: TextButton.styleFrom(
              padding: EdgeInsets.zero,
              textStyle: context.body3,
              visualDensity: VisualDensity.compact,
              foregroundColor: snackbar.type.ctaColor(context),
            ),
            child: snackbar.loading
                ? LedgerInfiniteSpinner(size: Spacing.lds400.value)
                : CustomText.semantics(snackbar.ctaText!),
          )
        : null;

    if (cta != null) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (showClose) ...[
            Spacing.lds150.xBox,
            cta,
            Spacing.lds150.xBox,
            _verticalDivider(context),
            Spacing.lds25.xBox,
            close,
          ] else ...[
            _verticalDivider(context),
            Spacing.lds25.xBox,
            cta,
          ],
        ],
      );
    }

    if (cta != null) {
      return cta;
    }

    if (onClose != null) {
      return close;
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    final hasHeader =
        snackbar.headerIcon != null && snackbar.headerText != null;
    return Container(
      padding: Spacing.lds200.all,
      alignment: Alignment.bottomCenter - const Alignment(0, 0.25),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (hasHeader)
            Container(
              padding: Spacing.lds150.all,
              decoration: BoxDecoration(
                color: snackbar.type.bg(context),
                border: Border.all(
                  color: snackbar.type.borderColor(context),
                ),
                borderRadius: RadiusSpacing.rds2xl.topCorners,
              ),
              child: Row(
                children: [
                  snackbar.headerIcon!,
                  Spacing.lds150.xBox,
                  CustomText.semantics(
                    snackbar.headerText!,
                    style: context.body2.copyWith(
                      color: snackbar.type.textColor(context),
                    ),
                  ),
                ],
              ),
            ),
          Container(
            padding: Spacing.lds150.x + Spacing.lds250.y,
            decoration: BoxDecoration(
              color: snackbar.type.bg(context),
              borderRadius: hasHeader
                  ? RadiusSpacing.rds2xl.bottomCorners
                  : RadiusSpacing.rds2xl.all,
              border: Border.all(
                color: snackbar.type.borderColor(context),
              ),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                leading ?? snackbar.type.leading(context),
                Spacing.lds150.xBox,
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText.semantics(
                        snackbar.title,
                        style: titleTextStyle ??
                            context.body3.medium.copyWith(
                              color: snackbar.type.textColor(context),
                            ),
                      ),
                      if (snackbar.description != null)
                        CustomText.semantics(
                          snackbar.description!,
                          style: context.body2.copyWith(
                            color: snackbar.type.textColor(context),
                          ),
                          textAlign: TextAlign.left,
                        ),
                    ],
                  ),
                ),
                Spacing.lds150.xBox,
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (trailing(context) != null) ...[
                      trailing(context)!,
                    ],
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

extension on SnackbarTypeEnum {
  Widget leading(BuildContext context) => switch (this) {
        SnackbarTypeEnum.success => SvgThemedIcon(
            svgPath: 'assets/icons/success_fill.svg',
            package: 'ledger_design_system',
            color: context.positive.defaultColor,
            size: Spacing.lds250.value,
          ),
        SnackbarTypeEnum.error => SvgThemedIcon(
            svgPath: 'assets/icons/warning_fill.svg',
            package: 'ledger_design_system',
            color: context.error.defaultColor,
            size: Spacing.lds250.value,
          ),
        SnackbarTypeEnum.info => SvgThemedIcon(
            svgPath: 'assets/icons/info_fill.svg',
            package: 'ledger_design_system',
            color: context.grey.shade600,
            size: Spacing.lds250.value,
          ),
      };

  Color bg(BuildContext context) => switch (this) {
        SnackbarTypeEnum.success => context.positive.subtle,
        SnackbarTypeEnum.error => context.error.subtle,
        SnackbarTypeEnum.info => context.grey.shade50,
      };

  Color borderColor(BuildContext context) => switch (this) {
        SnackbarTypeEnum.success => context.positive.lighter,
        SnackbarTypeEnum.error => context.error.lighter,
        SnackbarTypeEnum.info => context.grey.shade200,
      };

  Color textColor(BuildContext context) => switch (this) {
        SnackbarTypeEnum.success => context.positive.deep,
        SnackbarTypeEnum.error => context.error.deep,
        SnackbarTypeEnum.info => context.grey.shade600,
      };

  Color closeColor(BuildContext context) => switch (this) {
        SnackbarTypeEnum.success => context.positive.deep,
        SnackbarTypeEnum.error => context.error.deep,
        SnackbarTypeEnum.info => context.grey.shade600,
      };

  Color ctaColor(BuildContext context) => switch (this) {
        SnackbarTypeEnum.success => context.positive.deep,
        SnackbarTypeEnum.error => context.error.deep,
        SnackbarTypeEnum.info => context.grey.shade600,
      };
}
