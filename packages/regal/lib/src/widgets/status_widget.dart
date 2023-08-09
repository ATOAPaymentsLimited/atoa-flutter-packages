import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:regal/regal.dart';

class StatusWidget extends StatelessWidget {
  const StatusWidget({
    super.key,
    required this.type,
    required this.title,
    required this.description,
    this.cta,
  });

  final StatusType type;
  final String title;
  final String description;
  final RegalButton? cta;

  @override
  Widget build(BuildContext context) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildIcon(),
          Spacing.huge.yBox,
          CustomText.semantics(
            title,
            textAlign: TextAlign.center,
            style: context.labelMedium!.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          Spacing.huge.yBox,
          CustomText.semantics(
            description,
            style: context.bodyLarge,
            textAlign: TextAlign.center,
          ),
          if (cta != null) ...[
            Spacing.huge.yBox,
            cta!,
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
      height: 100.sp,
      width: 100.sp,
    );
  }
}

enum StatusType { failed, success, processing }
