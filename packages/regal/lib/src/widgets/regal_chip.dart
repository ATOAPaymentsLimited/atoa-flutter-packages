import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:regal/regal.dart';

class RegalChip extends StatelessWidget {
  const RegalChip({
    super.key,
    this.isSelected = false,
    required this.label,
    this.onRemove,
    this.onTap,
  });

  final bool isSelected;
  final String label;
  final VoidCallback? onRemove;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) => Center(
        widthFactor: 1,
        child: CustomGestureDetector(
          context: context,
          trackLabel: 'OnTap chip $label',
          semanticsLabel: 'OnTap chip $label',
          onTap: onTap,
          child: Container(
            padding: Spacing.medium.x + (Spacing.tiny.y * 2),
            decoration: BoxDecoration(
              color:
                  isSelected ? RegalColors.vividRed : context.vividRed.tint05,
              borderRadius: Spacing.small.brAll,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                CustomText.semantics(
                  label,
                  style: context.bodyLarge!.w600.copyWith(
                    color: context.brightness.map(
                      (l) => isSelected
                          ? RegalColors.snowWhite
                          : RegalColors.licoriceBlack,
                      (d) => RegalColors.snowWhite,
                    ),
                  ),
                ),
                if (onRemove != null) ...[
                  Spacing.small.xBox,
                  CustomGestureDetector(
                    context: context,
                    trackLabel: 'Deselect chip $label',
                    semanticsLabel: 'Desect chip $label',
                    onTap: onRemove,
                    child: Icon(
                      Icons.close,
                      size: context.labelMedium?.fontSize ?? 18.0.sp,
                      color: context.grey.shade60,
                    ),
                  ),
                ]
              ],
            ),
          ),
        ),
      );
}
