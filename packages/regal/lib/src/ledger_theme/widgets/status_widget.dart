import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:regal/assets/assets.gen.dart';
import 'package:regal/src/ledger_theme/ledger_theme.dart';
import 'package:regal/src/spacing/spacing.dart';

class StatusWidget extends StatelessWidget {
  const StatusWidget({
    super.key,
    required this.type,
    this.title,
    this.titleStyle,
    this.description,
    this.descriptionStyle,
    this.cta,
    this.placeholder,
  });

  final StatusType type;
  final String? title;
  final TextStyle? titleStyle;
  final String? description;
  final TextStyle? descriptionStyle;
  final Widget? cta;
  final Widget? placeholder;

  @override
  Widget build(BuildContext context) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (placeholder != null) placeholder! else _buildIcon(context),
          if (title != null && title!.trim().isNotEmpty) ...[
            Spacing.lds300.yBox,
            CustomText.semantics(
              title!,
              textAlign: TextAlign.center,
              style: titleStyle ?? context.title3.bold,
            ),
          ],
          if (description != null && description!.trim().isNotEmpty) ...[
            Spacing.lds300.yBox,
            CustomText.semantics(
              description!,
              style: descriptionStyle ?? context.body2,
              textAlign: TextAlign.center,
            ),
          ],
          if (cta != null) ...[
            Spacing.lds300.yBox,
            Center(child: cta),
          ],
        ],
      );

  Widget _buildIcon(BuildContext context) {
    switch (type) {
      case StatusType.failed:
        return _Icon(Assets.icons.warningFill);
      case StatusType.processing:
        return _Icon(Assets.icons.hourglass);
      case StatusType.success:
        return LedgerCheckbox.circular (
          trackLabel: 'Success check',
          checked: true,
          semanticsLabel: 'success check',
          size: 100.sp,
          activeColor: context.positive.darker,
        );
      case StatusType.empty:
        return const SizedBox.shrink();
    }
  }
}

class _Icon extends StatelessWidget {
  const _Icon(this.assetPath);

  final String assetPath;

  @override
  Widget build(BuildContext context) {
    final filter = ColorFilter.mode(
      context.primary.shade100,
      BlendMode.srcIn,
    );
    return SvgPicture.asset(
      assetPath,
      colorFilter: filter,
      package: 'regal',
      height: 80.sp,
      width: 80.sp,
    );
  }
}

enum StatusType { failed, success, processing, empty }
