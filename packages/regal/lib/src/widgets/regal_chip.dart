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
    this.expand = false,
    this.bgColor,
    this.labelColor,
  });

  final bool isSelected;
  final String label;
  final VoidCallback? onRemove;
  final VoidCallback? onTap;
  final bool expand;
  final Color? bgColor;
  final Color? labelColor;

  @override
  Widget build(BuildContext context) => Center(
        widthFactor: expand ? null : 1,
        child: CustomGestureDetector(
          context: context,
          trackLabel: 'OnTap chip $label',
          semanticsLabel: 'OnTap chip $label',
          onTap: onTap,
          child: Container(
            padding: Spacing.medium.x + (Spacing.tiny.y * 2.5),
            decoration: BoxDecoration(
              color: bgColor ??
                  (isSelected ? RegalColors.vividRed : context.vividRed.tint05),
              borderRadius: Spacing.small.brAll,
            ),
            child: Row(
              mainAxisSize: expand ? MainAxisSize.max : MainAxisSize.min,
              mainAxisAlignment:
                  expand ? MainAxisAlignment.center : MainAxisAlignment.start,
              children: [
                CustomText.semantics(
                  label,
                  style: context.bodyLarge!.w600.copyWith(
                    color: labelColor ??
                        context.brightness.map(
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
                ],
              ],
            ),
          ),
        ),
      );
}
