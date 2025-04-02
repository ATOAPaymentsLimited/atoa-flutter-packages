import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:regal/ledger/ledger_theme/ledger_theme.dart';
import 'package:regal/ledger/mixin/mixins.dart';
import 'package:regal/ledger/spacing/spacing.dart';

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
        margin: EmptySpacing.lds50.right + EmptySpacing.lds50.y,
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
    final close = LedgerIconButton.iconData(
      semanticsLabel: 'Close Snackbar',
      onPressed: (context) => onClose?.call(),
      iconData: Icons.close,
      trackLabel: 'Close Snackbar',
      size: LedgerIconButtonSize.medium,
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
              visualDensity: VisualDensity.compact,
              foregroundColor: snackbar.type.ctaColor(context),
            ),
            child: snackbar.loading
                ? LedgerInfiniteSpinner(
                    height: EmptySpacing.lds100.value,
                  )
                : Text(snackbar.ctaText!),
          )
        : null;

    if (cta != null) {
      return Expanded(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (showClose) ...[
              EmptySpacing.lds150.xBox,
              cta,
              EmptySpacing.lds150.xBox,
              _verticalDivider(context),
              EmptySpacing.lds25.xBox,
              close,
            ] else ...[
              _verticalDivider(context),
              EmptySpacing.lds25.xBox,
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
        minimum: EmptySpacing.lds300.y,
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
    final listTile = Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (snackbar.headerIcon != null && snackbar.headerText != null)
          Container(
            padding: EmptySpacing.lds150.all,
            decoration: BoxDecoration(
              color: snackbar.type.bg(context),
              border: Border.all(color: context.grey.shade400),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.sp),
                topRight: Radius.circular(20.sp),
              ),
            ),
            child: Row(
              children: [
                snackbar.headerIcon!,
                EmptySpacing.lds150.xBox,
                Text(
                  snackbar.headerText!,
                  style: context.body2.copyWith(
                    color: snackbar.type.textColor(context),
                  ),
                ),
              ],
            ),
          ),
        ListTile(
          horizontalTitleGap: 12.sp,
          contentPadding: EmptySpacing.lds150.x + EmptySpacing.lds100.y,
          tileColor: snackbar.type.bg(context),
          leading: leading ?? snackbar.type.leading(context),
          title: Text(snackbar.title),
          titleTextStyle: titleTextStyle ??
              context.body2.copyWith(
                color: snackbar.type.textColor(context),
              ),
          subtitle: snackbar.description != null
              ? Text(
                  snackbar.description!,
                  style: context.body2.copyWith(
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
        padding: EmptySpacing.lds200.x,
        child: wrap(listTile, context),
      ),
    );
  }
}

extension on SnackbarTypeEnum {
  Widget leading(BuildContext context) => switch (this) {
        SnackbarTypeEnum.success => Icon(
            Icons.check_circle,
            color: context.baseWhite,
            size: 20.sp,
          ),
        SnackbarTypeEnum.error => Icon(
            Icons.error_outline,
            color: context.baseWhite,
            size: 20.sp,
          ),
        SnackbarTypeEnum.info => Icon(
            Icons.info_outline,
            color: context.grey.shade500,
          ),
      };

  Color bg(BuildContext context) => switch (this) {
        SnackbarTypeEnum.success => context.positive.darker,
        SnackbarTypeEnum.error => context.error.defaultColor,
        SnackbarTypeEnum.info => context.grey.shade50,
      };

  Color textColor(BuildContext context) => switch (this) {
        SnackbarTypeEnum.success => context.baseWhite,
        SnackbarTypeEnum.error => context.baseWhite,
        SnackbarTypeEnum.info => context.baseBlack,
      };

  Color closeColor(BuildContext context) => switch (this) {
        SnackbarTypeEnum.success => context.grey.shade200,
        SnackbarTypeEnum.error => context.grey.shade200,
        SnackbarTypeEnum.info => context.grey.shade500,
      };

  Color ctaColor(BuildContext context) => switch (this) {
        SnackbarTypeEnum.success => context.baseWhite,
        SnackbarTypeEnum.error => context.baseWhite,
        SnackbarTypeEnum.info => context.primary.shade500,
      };
}
