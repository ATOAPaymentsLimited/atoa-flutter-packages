import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:regal/regal.dart';

class RegalCheckbox extends StatefulWidget {
  const RegalCheckbox({
    super.key,
    required this.checked,
    required this.semanticsLabel,
    this.size = 20.0,
    this.activeColor,
    this.borderColor,
    this.checkColor = Colors.white,
    this.onChanged,
    this.label = '',
    this.labelStyle,
    this.circular = false,
  });
  final bool checked;
  final double size;
  final Color? activeColor;
  final Color? borderColor;
  final Color checkColor;
  final String label;
  final TextStyle? labelStyle;
  final bool circular;
  final ValueChanged<bool>? onChanged;
  final String semanticsLabel;

  @override
  State<RegalCheckbox> createState() => _RegalCheckboxState();
}

class _RegalCheckboxState extends State<RegalCheckbox> {
  late bool _checked;

  @override
  void initState() {
    super.initState();
    _checked = widget.checked;
  }

  @override
  void didUpdateWidget(RegalCheckbox oldWidget) {
    _checked = widget.checked;
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) => CustomGestureDetector(
        semanticsLabel: widget.semanticsLabel,
        context: context,
        trackLabel: 'Checkbox',
        onTap: () {
          widget.onChanged?.call(!_checked);
        },
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: 4.sp),
                AnimatedContainer(
                  duration: const Duration(milliseconds: 250),
                  height: widget.size,
                  width: widget.size,
                  decoration: BoxDecoration(
                    color: _checked
                        ? (widget.activeColor ?? context.theme.primaryColor)
                        : Colors.transparent,
                    borderRadius: widget.circular
                        ? BorderRadius.circular(widget.size)
                        : BorderRadius.circular(4),
                    border: Border.all(
                      color: (_checked
                              ? widget.activeColor
                              : widget.borderColor) ??
                          context.theme.primaryColor,
                    ),
                  ),
                  child: Center(
                    child: AnimatedOpacity(
                      duration: const Duration(milliseconds: 250),
                      opacity: _checked ? 1.0 : 0.0,
                      child: Icon(
                        Icons.done,
                        size: widget.size * 0.8,
                        color: widget.checkColor,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            if (widget.label.isNotEmpty) ...[
              const SizedBox(width: 12),
              Text(
                widget.label,
                style: widget.labelStyle,
                overflow: TextOverflow.ellipsis,
              ),
            ]
          ],
        ),
      );
}
