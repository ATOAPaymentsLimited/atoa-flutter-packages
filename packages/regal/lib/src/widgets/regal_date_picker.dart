import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:regal/regal.dart';
import 'package:intl/intl.dart';

class CustomDatePicker extends StatefulWidget {
  const CustomDatePicker({
    super.key,
    this.selectedDate,
    this.initialDate,
    this.minDate,
    this.maxDate,
    this.placeHolder,
    this.bgColor = RegalColors.grey,
    this.iconColor,
    this.placeholderText = '',
    this.onSelected,
    this.dateDisplayFormat = 'dd-MM-yyyy',
    this.textStyle,
    this.borderColor,
    this.borderRadius = 14.0,
    this.placeholderTextStyle,
    this.readOnly = false,
    this.showIcon = true,
  });
  final DateTime? selectedDate;
  final DateTime? minDate;
  final DateTime? maxDate;
  final DateTime? initialDate;
  final Widget? placeHolder;
  final String placeholderText;
  final TextStyle? textStyle;
  final TextStyle? placeholderTextStyle;
  final Color bgColor;
  final bool showIcon;
  final Color? borderColor;
  final Color? iconColor;
  final double borderRadius;
  final Function(DateTime)? onSelected;
  final String dateDisplayFormat;
  final bool readOnly;

  @override
  State<CustomDatePicker> createState() => _CustomDatePickerState();
}

class _CustomDatePickerState extends State<CustomDatePicker> {
  late DateTime? _selected;
  late DateTime? _tempSelected;

  @override
  void initState() {
    super.initState();
    _selected = _getInitialDate();
    _tempSelected = null;
  }

  @override
  void didUpdateWidget(covariant CustomDatePicker oldWidget) {
    _selected = _getInitialDate();
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) => CustomInkWell(
        context: context,
        semanticsLabel: 'Date Picker',
        trackLabel: 'Date Picker',
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Semantics(
              button: true,
              enabled: true,
              label: 'Date picker button',
              child: DatePickerButton(
                dateTime: widget.selectedDate,
                dateDisplayFormat: widget.dateDisplayFormat,
                placeHolderText: widget.placeholderText,
                showIcon: widget.showIcon,
                iconColor: widget.iconColor,
                placeHolderTextStyle: widget.placeholderTextStyle,
                borderColor: widget.borderColor,
                borderRadius: widget.borderRadius,
                onTap: widget.readOnly ? null : _showDatePicker,
              ),
            ),
          ],
        ),
      );

  Future<void> _showDatePicker() async {
    if (Platform.isIOS) {
      showModalBottomSheet<void>(
        context: context,
        isDismissible: false,
        builder: (context) => ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(36),
            topRight: Radius.circular(36),
          ),
          child: Container(
            padding: Spacing.large.y,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    border: Border(
                      top: BorderSide(
                        color: RegalColors.grey.shade10,
                      ),
                      bottom: BorderSide(
                        color: RegalColors.grey.shade10,
                      ),
                    ),
                  ),
                  child: Padding(
                    padding: Spacing.huge.x + Spacing.tiny.y,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        RegalButton.tertiary(
                          size: RegalButtonSize.mini,
                          semanticsLabel: 'Cancel',
                          trackLabel: 'Cancel Text',
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          label: 'Cancel',
                          style:
                              Theme.of(context).textButtonTheme.style!.copyWith(
                                    foregroundColor: MaterialStateProperty.all(
                                      context.brightness.map(
                                        (l) => RegalColors.licoriceBlack,
                                        (d) => RegalColors.snowWhite,
                                      ),
                                    ),
                                  ),
                        ),
                        RegalButton.tertiary(
                          size: RegalButtonSize.mini,
                          semanticsLabel: 'Set',
                          trackLabel: 'Set Text',
                          onPressed: () {
                            if (widget.onSelected != null) {
                              final dateTime = _tempSelected ?? _selected;

                              if (dateTime == null) {
                                return;
                              }
                              if (dateTime.isAfter(
                                    _getFirstDate()
                                        .subtract(const Duration(days: 1)),
                                  ) &&
                                  dateTime.isBefore(
                                    _getLastDate().add(const Duration(days: 1)),
                                  )) {
                                widget.onSelected?.call(dateTime);
                                _selected = dateTime;
                                _tempSelected = null;
                              }
                            }
                            Navigator.pop(context);
                          },
                          label: 'Set',
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 200,
                  child: CupertinoDatePicker(
                    initialDateTime: _selected,
                    minimumDate: _getFirstDate(),
                    maximumDate: _getLastDate(),
                    onDateTimeChanged: (DateTime dateTime) {
                      setState(() {
                        _tempSelected = dateTime;
                      });
                    },
                    mode: CupertinoDatePickerMode.date,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    } else {
      final DateTime? dateTime = await showDatePicker(
        context: context,
        initialDate: _selected!,
        firstDate: _getFirstDate(),
        lastDate: _getLastDate(),
        locale: const Locale('en', 'IN'),
        fieldHintText: 'dd/mm/yyyy',
        builder: (context, child) => Theme(
          data: context.theme,
          child: child!,
        ),
      );

      if (widget.onSelected != null) {
        if (dateTime != null) {
          widget.onSelected?.call(dateTime);
        }
      }
    }
  }

  DateTime _getFirstDate() => widget.minDate ?? DateTime(2012, 06);

  DateTime _getLastDate() {
    final now = DateTime.now();
    final date = widget.maxDate ?? now;
    return DateTime(date.year, date.month, date.day, 23, 59, 59);
    // return widget.maxDate ?? DateTime(now.year, now.month, now.day);
  }

  DateTime _getInitialDate() =>
      widget.selectedDate ?? widget.initialDate ?? _getLastDate();
}

class DatePickerButton extends StatelessWidget {
  const DatePickerButton({
    super.key,
    this.dateTime,
    required this.dateDisplayFormat,
    required this.placeHolderText,
    this.placeHolderTextStyle,
    this.showIcon = true,
    this.iconColor,
    this.borderColor,
    this.borderRadius = 4.0,
    required this.onTap,
  });
  final DateTime? dateTime;
  final String dateDisplayFormat;
  final String placeHolderText;
  final TextStyle? placeHolderTextStyle;
  final bool showIcon;
  final Color? borderColor;
  final Color? iconColor;
  final double borderRadius;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) => Semantics(
        button: true,
        enabled: true,
        label: dateTime == null
            ? placeHolderText
            : DateFormat(dateDisplayFormat).format(dateTime!),
        child: RegalButton.secondary(
          trackLabel: 'Date Picker Button',
          onPressed: onTap,
          style: OutlinedButton.styleFrom(
            foregroundColor: dateTime == null
                ? RegalColors.grey.shade40
                : context.brightness.map(
                    (l) => RegalColors.licoriceBlack,
                    (d) => RegalColors.snowWhite,
                  ),
            textStyle: context.titleSmall!.height150.copyWith(
              fontWeight: dateTime == null ? null : FontWeight.bold,
            ),
            side: BorderSide(color: borderColor ?? _color),
            minimumSize: Size.fromHeight(56.sp),
            padding: EdgeInsets.zero,
            shape: RoundedRectangleBorder(
              side: BorderSide(color: RegalColors.grey.shade10),
              borderRadius: BorderRadius.circular(borderRadius.sp),
            ),
          ),
          size: RegalButtonSize.small,
          prefixIcon: Icon(
            Icons.calendar_today_outlined,
            color: iconColor ??
                context.brightness.map(
                  (l) => RegalColors.licoriceBlack,
                  (d) => RegalColors.snowWhite,
                ),
            size: 24.sp,
          ),
          label: dateTime == null
              ? placeHolderText
              : DateFormat(dateDisplayFormat).format(dateTime!),
        ),
      );

  Color get _color => RegalColors.grey.shade10;
}
