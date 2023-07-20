import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:regal/regal.dart';

class RegalSearchBar extends StatefulWidget {
  const RegalSearchBar({
    super.key,
    this.onChanged,
    this.hintText,
    this.onTapClose,
    this.autofocus = false,
    this.showClose = true,
    required this.searchController,
  });
  final TextEditingController searchController;
  final String? hintText;
  final ValueChanged<String>? onChanged;
  final VoidCallback? onTapClose;
  final bool autofocus;
  final bool showClose;

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
  Widget build(BuildContext context) => TextField(
        autofocus: widget.autofocus,
        controller: widget.searchController,
        keyboardType: TextInputType.text,
        style: context.labelSmall,
        cursorColor: context.regalColor.licoriceBlack,
        decoration: InputDecoration(
          isDense: true,
          fillColor: context.grey.shade05,
          filled: true,
          disabledBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(100),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(100),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(100),
          ),
          hintText: widget.hintText,
          hintStyle: context.labelSmall!.copyWith(
            color: context.grey.shade60,
          ),
          contentPadding:
              EdgeInsets.symmetric(horizontal: 15.sp, vertical: 12.sp),
          prefixIcon: Padding(
            padding: Spacing.medium.left,
            child: Icon(
              Icons.search,
              size: 18.sp,
              color: context.regalColor.licoriceBlack,
            ),
          ),
          suffixIcon: _showClear && widget.showClose
              ? CustomGestureDetector(
                  context: context,
                  trackLabel: 'Clear Icon Search Bar',
                  onTap: () {
                    widget.searchController.clear();
                    widget.onTapClose?.call();
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
      );
}
