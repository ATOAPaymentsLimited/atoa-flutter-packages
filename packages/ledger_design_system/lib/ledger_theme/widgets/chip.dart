import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ledger_design_system/ledger_design_system.dart';

class LedgerChip extends StatelessWidget {
  const LedgerChip({
    super.key,
    this.isSelected = false,
    required this.label,
    this.onRemove,
    this.onTap,
    this.expand = false,
    this.bgColor,
    this.selectedColor,
    this.baseColor,
    this.labelColor,
    this.iconColor,
    this.borderRadius,
    this.labelStyle,
    this.spacing,
  });

  final bool isSelected;
  final String label;
  final VoidCallback? onRemove;
  final VoidCallback? onTap;
  final bool expand;
  final Color? bgColor;
  final Color? selectedColor;
  final Color? baseColor;
  final Color? labelColor;
  final Color? iconColor;
  final BorderRadius? borderRadius;
  final SizedBox? spacing;
  final TextStyle? labelStyle;

  @override
  Widget build(BuildContext context) => Center(
        widthFactor: expand ? null : 1,
        child: CustomGestureDetector(
          context: context,
          trackLabel: 'OnTap chip $label',
          semanticsLabel: 'OnTap chip $label',
          onTap: onTap,
          child: Container(
            padding: Spacing.lds150.x + (Spacing.lds25.y * 2.5),
            decoration: BoxDecoration(
              color: (isSelected ? selectedColor : baseColor) ??
                  bgColor ??
                  (isSelected
                      ? context.primary.shade500
                      : context.primary.shade100),
              borderRadius: borderRadius ?? RadiusSpacing.rdss.all,
            ),
            child: Row(
              mainAxisSize: expand ? MainAxisSize.max : MainAxisSize.min,
              mainAxisAlignment:
                  expand ? MainAxisAlignment.center : MainAxisAlignment.start,
              children: [
                CustomText.semantics(
                  label,
                  style: labelStyle ??
                      context.body2.semiBold.copyWith(
                        color: labelColor ??
                            (isSelected
                                ? context.baseWhite
                                : context.baseBlack),
                      ),
                ),
                if (onRemove != null) ...[
                  spacing ?? Spacing.lds100.xBox,
                  CustomGestureDetector(
                    context: context,
                    trackLabel: 'Deselect chip $label',
                    semanticsLabel: 'Desect chip $label',
                    onTap: onRemove,
                    child: Icon(
                      Icons.close,
                      size: context.title3.fontSize ?? 18.0.sp,
                      color: iconColor ?? context.grey.shade600,
                    ),
                  ),
                ],
              ],
            ),
          ),
        ),
      );
}
