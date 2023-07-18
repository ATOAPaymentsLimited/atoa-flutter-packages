import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:regal/regal.dart';

class RegalSwitch extends StatefulWidget {
  const RegalSwitch({
    super.key,
    this.value = false,
    required this.onChanged,
    this.activeColor,
    this.inActiveColor,
  });
  final bool value;
  final ValueChanged<bool> onChanged;
  final Color? activeColor;
  final Color? inActiveColor;

  @override
  State<RegalSwitch> createState() => _RegalSwitchState();
}

class _RegalSwitchState extends State<RegalSwitch> {
  Alignment switchControlAlignment = Alignment.centerLeft;

  @override
  Widget build(BuildContext context) => CustomInkWell(
        context: context,
        trackLabel: 'Switch',
        trackProperties: <String, dynamic>{
          'updated_value': !widget.value,
        },
        splashColor: Colors.transparent,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          curve: Curves.decelerate,
          width: 40.sp,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: widget.value
                ? (widget.activeColor ?? context.theme.primaryColor)
                : (widget.inActiveColor ?? RegalColors.grey.shade20),
          ),
          child: AnimatedAlign(
            duration: const Duration(milliseconds: 300),
            alignment:
                widget.value ? Alignment.centerRight : Alignment.centerLeft,
            curve: Curves.decelerate,
            child: Padding(
              padding: EdgeInsets.all(4.sp),
              child: Container(
                width: 16.sp,
                height: 16.sp,
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      offset: const Offset(2, 0),
                      blurRadius: 5.r,
                      color: Colors.black.withOpacity(0.2),
                    )
                  ],
                  borderRadius: BorderRadius.circular(100),
                ),
              ),
            ),
          ),
        ),
        onTap: () {
          setState(() {
            widget.onChanged(!widget.value);
          });
        },
      );
}