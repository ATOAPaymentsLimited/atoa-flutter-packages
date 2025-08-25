import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:regal/assets/assets.gen.dart';
import 'package:regal/src/ledger_theme/ledger_theme.dart';
import 'package:regal/src/spacing/spacing.dart';

class LedgerSearchBar extends StatefulWidget {
  const LedgerSearchBar({
    super.key,
    this.onChanged,
    this.hintText,
    this.onClear,
    this.hintStyle,
    this.border,
    this.filled,
    this.fillColor,
    this.autofocus = false,
    this.showClose = true,
    this.label,
    this.showFloatingLabel,
    this.isLightMode = false,
    this.textStyle,
    required this.searchController,
    required this.semanticsLabel,
    this.prefixIcon,
  });
  final TextEditingController searchController;
  final String? hintText;
  final ValueChanged<String>? onChanged;
  final VoidCallback? onClear;
  final bool autofocus;
  final bool showClose;
  final String semanticsLabel;
  final TextStyle? hintStyle;
  final BorderSide? border;
  final bool? filled;
  final Color? fillColor;
  final Widget? label;
  final bool isLightMode;
  final FloatingLabelBehavior? showFloatingLabel;
  final TextStyle? textStyle;
  final Widget? prefixIcon;

  @override
  State<LedgerSearchBar> createState() => _LedgerSearchBarState();
}

class _LedgerSearchBarState extends State<LedgerSearchBar> {
  bool _showClear = false;

  @override
  void initState() {
    super.initState();
    widget.searchController.addListener(() {
      if (mounted) {
        setState(() {
          _showClear = widget.searchController.text.trim().isNotEmpty;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) => Semantics(
        container: true,
        enabled: true,
        explicitChildNodes: true,
        label: widget.semanticsLabel,
        textField: true,
        child: TextField(
          autofocus: widget.autofocus,
          controller: widget.searchController,
          keyboardType: TextInputType.text,
          style: widget.textStyle ??
              context.labelSmall.copyWith(
                color: context.baseBlack,
              ),
          cursorColor: context.baseBlack,
          decoration: InputDecoration(
            isDense: true,
            fillColor: widget.fillColor ?? context.grey.shade50,
            filled: widget.filled ?? true,
            disabledBorder: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: RadiusSpacing.rdscircular.all,
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: widget.border ?? BorderSide.none,
              borderRadius: RadiusSpacing.rdscircular.all,
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: widget.border ?? BorderSide.none,
              borderRadius: RadiusSpacing.rdscircular.all,
            ),
            hintText: widget.hintText,
            hintStyle: widget.hintStyle ??
                context.labelSmall.copyWith(
                  color: context.grey.shade600,
                ),
            contentPadding: Spacing.lds150.y + Spacing.lds200.x,
            prefixIcon: widget.prefixIcon,
            label: widget.label,
            floatingLabelBehavior: widget.showFloatingLabel,
            suffixIcon: _showClear && widget.showClose
                ? CustomGestureDetector(
                    context: context,
                    semanticsLabel: 'Clear Search Bar Icon',
                    trackLabel: 'Clear Icon Search Bar',
                    onTap: () {
                      widget.searchController.clear();
                      widget.onClear?.call();
                    },
                    child: SvgPicture.asset(
                      Assets.icons.close,
                      width: Spacing.lds250.value,
                      height: Spacing.lds250.value,
                      colorFilter: ColorFilter.mode(
                        context.baseBlack,
                        BlendMode.srcIn,
                      ),
                    ),
                  )
                : null,
          ),
          onChanged: (value) {
            widget.onChanged?.call(value.trim());
          },
        ),
      );
}
