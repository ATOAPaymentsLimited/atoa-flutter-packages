import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:regal/assets/assets.gen.dart';
import 'package:regal/src/ledger_theme/ledger_theme.dart';
import 'package:regal/src/mixin/mixins.dart';
import 'package:regal/src/spacing/spacing.dart';

export 'snackbar_type.dart';

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
    final close = LedgerIconButton(
      semanticsLabel: 'Close Snackbar',
      onPressed: (context) => onClose?.call(),
      assetPath: Assets.icons.close,
      package: 'regal',
      trackLabel: 'Close Snackbar',
      size: LedgerIconButtonSize.small,
      iconColor: snackbar.type.closeColor(context),
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
                ? LedgerInfiniteSpinner(
                    height: Spacing.lds100.value,
                  )
                : CustomText.semantics(snackbar.ctaText!),
          )
        : null;

    if (cta != null) {
      return Expanded(
        child: Row(
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
        ),
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

  Widget wrap(Widget widget, BuildContext context) => SafeArea(
        minimum: Spacing.lds300.y,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          mainAxisSize: MainAxisSize.min,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20.sp),
              child: Material(
                color: Colors.transparent,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    border: Border.all(color: context.grey.shade400),
                    borderRadius: BorderRadius.circular(20.sp),
                  ),
                  child: widget,
                ),
              ),
            ),
          ],
        ),
      );

  @override
  Widget build(BuildContext context) {
    final hasHeader =
        snackbar.headerIcon != null && snackbar.headerText != null;
    final listTile = Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (hasHeader)
          Container(
            padding: Spacing.lds150.all,
            decoration: BoxDecoration(
              color: snackbar.type.bg(context),
              border: Border.all(color: context.grey.shade400),
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
        ListTile(
          dense: true,
          shape: RoundedRectangleBorder(
            borderRadius: hasHeader
                ? RadiusSpacing.rdsl.bottomCorners
                : RadiusSpacing.rdsl.all,
            side: BorderSide(
              color: snackbar.type.borderColor(context),
            ),
          ),
          horizontalTitleGap: 12.sp,
          contentPadding: Spacing.lds150.x + Spacing.lds100.y,
          tileColor: snackbar.type.bg(context),
          leading: leading ?? snackbar.type.leading(context),
          title: CustomText.semantics(snackbar.title),
          titleTextStyle: titleTextStyle ??
              context.body3.copyWith(
                color: snackbar.type.textColor(context),
              ),
          subtitle: snackbar.description != null
              ? CustomText.semantics(
                  snackbar.description!,
                  style: context.body3.copyWith(
                    color: snackbar.type.textColor(context),
                  ),
                )
              : null,
          trailing: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (trailing(context) != null) ...[
                trailing(context)!,
              ],
            ],
          ),
        ),
      ],
    );

    return Align(
      alignment: alignment ?? Alignment.bottomCenter,
      child: Padding(
        padding: Spacing.lds200.x + Spacing.lds400.bottom,
        child: wrap(listTile, context),
      ),
    );
  }
}

extension on SnackbarTypeEnum {
  Widget leading(BuildContext context) => switch (this) {
        SnackbarTypeEnum.success => SvgThemedIcon(
            svgPath: Assets.icons.successFill,
            package: 'regal',
            color: context.positive.defaultColor,
            size: Spacing.lds250.value,
          ),
        SnackbarTypeEnum.error => SvgThemedIcon(
            svgPath: Assets.icons.warningFill,
            package: 'regal',
            color: context.error.defaultColor,
            size: Spacing.lds250.value,
          ),
        SnackbarTypeEnum.info => SvgThemedIcon(
            svgPath: Assets.icons.infoFill,
            package: 'regal',
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
