import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:regal/regal.dart';

class RegalSearchBar extends StatefulWidget {
  const RegalSearchBar({
    super.key,
    this.onChanged,
    this.hintText,
    this.onClear,
    this.hintStyle,
    this.iconSize,
    this.border,
    this.filled,
    this.fillColor,
    this.autofocus = false,
    this.showClose = true,
    required this.searchController,
    required this.semanticsLabel,
  });
  final TextEditingController searchController;
  final String? hintText;
  final ValueChanged<String>? onChanged;
  final VoidCallback? onClear;
  final bool autofocus;
  final bool showClose;
  final String semanticsLabel;
  final TextStyle? hintStyle;
  final double? iconSize;
  final BorderSide? border;
  final bool? filled;
  final Color? fillColor;

  @override
  State<RegalSearchBar> createState() => _RegalSearchBarState();
}

class _RegalSearchBarState extends State<RegalSearchBar> {
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
          style: context.labelSmall,
          cursorColor: context.regalColor.licoriceBlack,
          decoration: InputDecoration(
            isDense: true,
            fillColor: widget.fillColor ?? context.grey.shade05,
            filled: widget.filled ?? true,
            disabledBorder: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(100),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: widget.border ?? BorderSide.none,
              borderRadius: BorderRadius.circular(100),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: widget.border ?? BorderSide.none,
              borderRadius: BorderRadius.circular(100),
            ),
            hintText: widget.hintText,
            hintStyle: widget.hintStyle ??
                context.labelSmall!.copyWith(
                  color: context.grey.shade60,
                ),
            contentPadding:
                EdgeInsets.symmetric(horizontal: 15.sp, vertical: 12.sp),
            prefixIcon: Padding(
              padding: Spacing.medium.left,
              child: Icon(
                Icons.search,
                size: widget.iconSize ?? 18.sp,
                color: context.regalColor.licoriceBlack,
              ),
            ),
            suffixIcon: _showClear && widget.showClose
                ? CustomGestureDetector(
                    context: context,
                    semanticsLabel: 'Clear Search Bar Icon',
                    trackLabel: 'Clear Icon Search Bar',
                    onTap: () {
                      widget.searchController.clear();
                      widget.onClear?.call();
                    },
                    child: Icon(
                      Icons.clear_sharp,
                      size: 18.sp,
                      color: context.regalColor.licoriceBlack,
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
