import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:regal/regal.dart';

class StatusWidget extends StatelessWidget {
  const StatusWidget({
    super.key,
    required this.type,
    this.title,
    this.description,
    this.cta,
    this.placeholder,
  });

  final StatusType type;
  final String? title;
  final String? description;
  final RegalButton? cta;
  final Widget? placeholder;

  @override
  Widget build(BuildContext context) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (placeholder != null) placeholder! else _buildIcon(),
          if (title != null && title!.trim().isNotEmpty) ...[
            Spacing.huge.yBox,
            CustomText.semantics(
              title!,
              textAlign: TextAlign.center,
              style: context.labelMedium!.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
          if (description != null && description!.trim().isNotEmpty) ...[
            Spacing.huge.yBox,
            CustomText.semantics(
              description!,
              style: context.bodyLarge?.copyWith(
                height: 1.5,
              ),
              textAlign: TextAlign.center,
            ),
          ],
          if (cta != null) ...[
            Spacing.huge.yBox,
            Center(child: cta),
          ],
        ],
      );

  Widget _buildIcon() {
    switch (type) {
      case StatusType.failed:
        return const _Icon(
          'assets/icons/icon_error.svg',
        );
      case StatusType.processing:
        return const _Icon(
          'assets/icons/icon_hourglass_empty.svg',
        );
      case StatusType.success:
        return RegalCheckbox(
          checked: true,
          semanticsLabel: 'success check',
          circular: true,
          size: 100.sp,
          activeColor: RegalColors.darkCyan,
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
      context.vividRed.tint20,
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
