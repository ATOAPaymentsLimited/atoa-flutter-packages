import 'package:flutter/material.dart';
import 'package:regal/regal.dart';

class LedgerCheckbox extends StatefulWidget {
  const LedgerCheckbox({
    super.key,
    required this.checked,
    required this.trackLabel,
    required this.semanticsLabel,
    this.size = 20.0,
    this.activeColor,
    this.borderColor,
    this.checkColor = Colors.white,
    this.onChanged,
    this.label = '',
    this.subtitle,
    this.labelStyle,
    this.subtitleStyle,
    this.circular = false,
  });
  final bool checked;
  final double size;
  final Color? activeColor;
  final Color? borderColor;
  final Color checkColor;
  final String label;
  final TextStyle? labelStyle;
  final String? subtitle;
  final TextStyle? subtitleStyle;
  final bool circular;
  final ValueChanged<bool>? onChanged;
  final String semanticsLabel;
  final String trackLabel;

  @override
  State<LedgerCheckbox> createState() => _LedgerCheckboxState();
}

class _LedgerCheckboxState extends State<LedgerCheckbox> {
  late bool _checked;

  @override
  void initState() {
    super.initState();
    _checked = widget.checked;
  }

  @override
  void didUpdateWidget(LedgerCheckbox oldWidget) {
    _checked = widget.checked;
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) => Semantics(
        checked: widget.checked,
        child: CustomGestureDetector(
          behavior: HitTestBehavior.translucent,
          semanticsLabel: widget.semanticsLabel,
          context: context,
          trackLabel: widget.trackLabel,
          onTap: () {
            widget.onChanged?.call(!_checked);
          },
          child: Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: Spacing.tiny.y,
                child: AnimatedContainer(
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
              ),
              Spacing.medium.xBox,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (widget.label.isNotEmpty) ...[
                      Row(
                        children: [
                          Expanded(
                            child: CustomText.semantics(
                              widget.label,
                              style: widget.labelStyle ??
                                  Theme.of(context).textTheme.bodyLarge,
                            ),
                          ),
                        ],
                      ),
                    ],
                    if (widget.subtitle?.isNotEmpty ?? false) ...[
                      Spacing.mini.yBox,
                      Row(
                        children: [
                          Expanded(
                            child: CustomText.semantics(
                              widget.subtitle!,
                              style: widget.subtitleStyle ??
                                  Theme.of(context)
                                      .textTheme
                                      .bodyLarge
                                      ?.copyWith(
                                        color: context.grey.shade20,
                                      ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ],
                ),
              ),
            ],
          ),
        ),
      );
}
