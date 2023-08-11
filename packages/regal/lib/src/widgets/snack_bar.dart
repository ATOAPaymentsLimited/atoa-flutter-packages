import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:regal/regal.dart';
import 'package:regal/src/mixin/mixins.dart';
import 'package:regal/src/models/snackbar_type.dart';

class Snackbar extends StatelessWidget with EventTrackMixin {
  const Snackbar(
    this.snackbar, {
    super.key,
    this.onClose,
  });

  final SnackbarType snackbar;
  final VoidCallback? onClose;

  Widget? trailing(BuildContext context) {
    final close = RegalIconButton.iconData(
      semanticsLabel: 'Close Snackbar Button',
      onPressed: (context) => onClose?.call(),
      iconData: Icons.close,
      trackLabel: 'Close Snackbar',
      size: RegalIconButtonSize.medium,
      iconColor: snackbar.type.closeColor(context),
    );

    final cta = snackbar.ctaText != null && snackbar.onCTA != null
        ? TextButton(
            onPressed: () {
              snackbar.onCTA!();
              logClickEvent(
                context,
                '$snackbar.ctaText CTA',
                enableTracking: true,
              );
            },
            style: TextButton.styleFrom(
              padding: EdgeInsets.zero,
              visualDensity: VisualDensity.compact,
              foregroundColor: snackbar.type.ctaColor(context),
            ),
            child: Text(snackbar.ctaText!),
          )
        : null;

    if (cta != null) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 1.sp,
            height: 24.sp,
            margin: Spacing.mini.right,
            decoration: BoxDecoration(
              border: Border(
                left: Divider.createBorderSide(
                  context,
                  color: RegalColors.grey.shade20,
                  width: 1.sp,
                ),
              ),
            ),
          ),
          Spacing.tiny.xBox,
          cta,
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

  Widget wrap(Widget widget, BuildContext context) {
    if (snackbar.type == SnackbarTypeEnum.info) {
      return Material(
        color: Colors.transparent,
        child: DecoratedBox(
          decoration: BoxDecoration(
            border: Border.all(color: context.grey.shade20),
            borderRadius: BorderRadius.circular(20.sp),
          ),
          child: widget,
        ),
      );
    }

    return Material(color: Colors.transparent, child: widget);
  }

  @override
  Widget build(BuildContext context) {
    final listTile = ListTile(
      // default is 16 and design has 12
      horizontalTitleGap: -4.sp,
      contentPadding: Spacing.medium.x + Spacing.small.y,
      tileColor: snackbar.type.bg(context),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.sp),
      ),
      leading: snackbar.type.leading(context),
      title: Text(snackbar.title),
      titleTextStyle: context.montserrat.headlineSmall.copyWith(
        color: snackbar.type.textColor(context),
        fontSize: 14.sp,
      ),
      subtitle: snackbar.description != null
          ? Text(
              snackbar.description!,
              style: context.bodyLarge?.copyWith(
                color: snackbar.type.textColor(context),
                fontSize: 14.sp,
              ),
            )
          : null,
      trailing: trailing(context),
    );

    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: Spacing.large.x,
        child: wrap(listTile, context),
      ),
    );
  }
}

extension on SnackbarTypeEnum {
  Widget leading(BuildContext context) => switch (this) {
        SnackbarTypeEnum.success => Icon(
            Icons.check_circle,
            color: RegalColors.snowWhite,
            size: 20.sp,
          ),
        SnackbarTypeEnum.error => Icon(
            Icons.error_outline,
            color: RegalColors.snowWhite,
            size: 20.sp,
          ),
        SnackbarTypeEnum.info => Icon(
            Icons.info_outline,
            color: context.grey.shade40,
          ),
      };

  Color bg(BuildContext context) => switch (this) {
        SnackbarTypeEnum.success => RegalColors.darkCyan,
        SnackbarTypeEnum.error => RegalColors.darkOrange,
        SnackbarTypeEnum.info => context.grey.shade05,
      };

  Color textColor(BuildContext context) => switch (this) {
        SnackbarTypeEnum.success => RegalColors.snowWhite,
        SnackbarTypeEnum.error => RegalColors.snowWhite,
        SnackbarTypeEnum.info => context.regalColor.licoriceBlack,
      };

  Color closeColor(BuildContext context) => switch (this) {
        SnackbarTypeEnum.success => RegalColors.grey.shade10,
        SnackbarTypeEnum.error => RegalColors.grey.shade10,
        SnackbarTypeEnum.info => context.grey.shade40,
      };

  Color ctaColor(BuildContext context) => switch (this) {
        SnackbarTypeEnum.success => RegalColors.snowWhite,
        SnackbarTypeEnum.error => RegalColors.snowWhite,
        SnackbarTypeEnum.info => context.regalColor.pink,
      };
}
