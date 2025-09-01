import 'package:flutter/material.dart';
import 'package:ledger_design_system/ledger_design_system.dart';

class LedgerCheckboxWithLabel extends StatefulWidget {
  const LedgerCheckboxWithLabel({
    super.key,
    required this.checked,
    required this.trackLabel,
    required this.semanticsLabel,
    this.size = 20.0,
    this.activeColor,
    this.borderColor,
    this.checkColor,
    this.onChanged,
    this.label = '',
    this.subtitle,
    this.labelStyle,
    this.subtitleStyle,
  }) : _type = _LedgerCheckboxType._checkbox;

  const LedgerCheckboxWithLabel.circular({
    super.key,
    required this.checked,
    required this.trackLabel,
    required this.semanticsLabel,
    this.size = 20.0,
    this.activeColor,
    this.borderColor,
    this.checkColor,
    this.onChanged,
    this.label = '',
    this.subtitle,
    this.labelStyle,
    this.subtitleStyle,
  }) : _type = _LedgerCheckboxType._circular;

  final bool checked;
  final double size;
  final Color? activeColor;
  final Color? borderColor;
  final Color? checkColor;
  final String label;
  final TextStyle? labelStyle;
  final String? subtitle;
  final TextStyle? subtitleStyle;
  final ValueChanged<bool>? onChanged;
  final String semanticsLabel;
  final String trackLabel;
  final _LedgerCheckboxType _type;

  @override
  State<LedgerCheckboxWithLabel> createState() =>
      _LedgerCheckboxWithLabelState();
}

class _LedgerCheckboxWithLabelState extends State<LedgerCheckboxWithLabel> {
  late bool _checked;

  @override
  void initState() {
    super.initState();
    _checked = widget.checked;
  }

  @override
  void didUpdateWidget(LedgerCheckboxWithLabel oldWidget) {
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
                padding: Spacing.lds25.y,
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 250),
                  height: widget.size,
                  width: widget.size,
                  decoration: BoxDecoration(
                    color: _checked
                        ? (widget.activeColor ??
                            widget._type.activeColor(context))
                        : Colors.transparent,
                    borderRadius: widget._type.borderRadius(context),
                    border: Border.all(
                      color: (_checked
                          ? widget.activeColor ??
                              widget._type.activeColor(context)
                          : widget.borderColor ??
                              widget._type.borderColor(context)),
                    ),
                  ),
                  child: Center(
                    child: AnimatedOpacity(
                      duration: const Duration(milliseconds: 250),
                      opacity: _checked ? 1.0 : 0.0,
                      child: Icon(
                        Icons.done,
                        size: widget.size * 0.8,
                        color: widget.checkColor ??
                            widget._type.checkColor(context),
                      ),
                    ),
                  ),
                ),
              ),
              Spacing.lds150.xBox,
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
                      Spacing.lds50.yBox,
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
                                        color: context.grey.shade400,
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

class LedgerCheckbox extends StatefulWidget {
  const LedgerCheckbox({
    super.key,
    required this.checked,
    required this.trackLabel,
    required this.semanticsLabel,
    this.size = 20.0,
    this.activeColor,
    this.borderColor,
    this.checkColor,
    this.onChanged,
  }) : _type = _LedgerCheckboxType._checkbox;

  const LedgerCheckbox.circular({
    super.key,
    required this.checked,
    required this.trackLabel,
    required this.semanticsLabel,
    this.size = 20.0,
    this.activeColor,
    this.borderColor,
    this.checkColor,
    this.onChanged,
  }) : _type = _LedgerCheckboxType._circular;

  final bool checked;
  final double size;
  final Color? activeColor;
  final Color? borderColor;
  final Color? checkColor;
  final ValueChanged<bool>? onChanged;
  final String semanticsLabel;
  final String trackLabel;
  final _LedgerCheckboxType _type;

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
          child: Padding(
            padding: Spacing.lds25.y,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 250),
              height: widget.size,
              width: widget.size,
              decoration: BoxDecoration(
                color: _checked
                    ? (widget.activeColor ?? widget._type.activeColor(context))
                    : Colors.transparent,
                borderRadius: widget._type.borderRadius(context),
                border: Border.all(
                  color: (_checked
                      ? widget.activeColor ?? widget._type.activeColor(context)
                      : widget.borderColor ??
                          widget._type.borderColor(context)),
                ),
              ),
              child: Center(
                child: AnimatedOpacity(
                  duration: const Duration(milliseconds: 250),
                  opacity: _checked ? 1.0 : 0.0,
                  child: Icon(
                    Icons.done,
                    size: widget.size * 0.8,
                    color:
                        widget.checkColor ?? widget._type.checkColor(context),
                  ),
                ),
              ),
            ),
          ),
        ),
      );
}

enum _LedgerCheckboxType {
  _checkbox,
  _circular;

  Color activeColor(BuildContext ctx) => switch (this) {
        _checkbox => ctx.baseBlack,
        _circular => ctx.primary.shade500
      };

  Color borderColor(BuildContext ctx) => switch (this) {
        _checkbox => ctx.brightness == Brightness.light
            ? ctx.baseBlack
            : ctx.grey.shade300,
        _circular => ctx.brightness == Brightness.light
            ? ctx.baseBlack
            : ctx.grey.shade300,
      };

  Color checkColor(BuildContext ctx) => switch (this) {
        _checkbox => ctx.baseWhite,
        _circular => ctx.intactWhite
      };

  BorderRadius borderRadius(BuildContext ctx) => switch (this) {
        _checkbox => BorderRadius.circular(Spacing.lds50.value),
        _circular => BorderRadius.circular(Spacing.lds1000.value),
      };
}
