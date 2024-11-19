import 'dart:async';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:regal/regal.dart';

class LedgerCustomDatePicker extends StatefulWidget {
  const LedgerCustomDatePicker({
    super.key,
    this.selectedDate,
    this.initialDate,
    this.minDate,
    this.maxDate,
    this.placeHolder,
    this.placeholderText = '',
    this.onSelected,
    this.dateDisplayFormat = 'dd-MM-yyyy',
    this.readOnly = false,
    this.showIcon = true,
    required this.label,
  });
  final DateTime? selectedDate;
  final DateTime? minDate;
  final DateTime? maxDate;
  final DateTime? initialDate;
  final Widget? placeHolder;
  final String placeholderText;
  final bool showIcon;
  final ValueChanged<DateTime>? onSelected;
  final String dateDisplayFormat;
  final bool readOnly;
  final String label;

  @override
  State<LedgerCustomDatePicker> createState() => _LedgerCustomDatePickerState();
}

class _LedgerCustomDatePickerState extends State<LedgerCustomDatePicker> {
  late DateTime _selected;
  late DateTime? _tempSelected;

  @override
  void initState() {
    super.initState();
    _selected = _getInitialDate();
    _tempSelected = null;
  }

  @override
  void didUpdateWidget(covariant LedgerCustomDatePicker oldWidget) {
    _selected = _getInitialDate();
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) => LedgerDatePickerButton(
        labelText: widget.label,
        dateTime: widget.selectedDate,
        dateDisplayFormat: widget.dateDisplayFormat,
        hintText: widget.placeholderText,
        showIcon: widget.showIcon,
        onTap: widget.readOnly ? null : _showDatePicker,
      );

  Future<void> _showDatePicker() async {
    if (Platform.isIOS) {
      unawaited(
        showModalBottomSheet<void>(
          context: context,
          isDismissible: false,
          builder: (context) => ClipRRect(
            borderRadius: Spacing.huge.topCorners + Spacing.medium.topCorners,
            child: Container(
              padding: Spacing.large.y,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  DecoratedBox(
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
                            style: Theme.of(context)
                                .textButtonTheme
                                .style!
                                .copyWith(
                                  foregroundColor: WidgetStateProperty.all(
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

                                if (dateTime.isAfter(
                                      _getFirstDate()
                                          .subtract(const Duration(days: 1)),
                                    ) &&
                                    dateTime.isBefore(
                                      _getLastDate()
                                          .add(const Duration(days: 1)),
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
                    height: Spacing.xtraLarge.value * 10,
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
        ),
      );
    } else {
      final dateTime = await showDatePicker(
        context: context,
        initialDate: _selected,
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

class LedgerDatePickerButton extends StatefulWidget {
  const LedgerDatePickerButton({
    super.key,
    this.dateTime,
    required this.dateDisplayFormat,
    required this.hintText,
    required this.labelText,
    this.showIcon = true,
    required this.onTap,
  });
  final DateTime? dateTime;
  final String dateDisplayFormat;
  final String hintText;
  final String labelText;
  final bool showIcon;
  final VoidCallback? onTap;

  @override
  State<LedgerDatePickerButton> createState() => _LedgerDatePickerButtonState();
}

class _LedgerDatePickerButtonState extends State<LedgerDatePickerButton> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: formattedDate);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant LedgerDatePickerButton oldWidget) {
    if (oldWidget.dateTime != widget.dateTime) {
      if (formattedDate != null) {
        _controller.text = formattedDate!;
      }
    }
    super.didUpdateWidget(oldWidget);
  }

  String? get formattedDate => widget.dateTime != null
      ? DateFormat(widget.dateDisplayFormat).format(widget.dateTime!)
      : null;

  @override
  Widget build(BuildContext context) => LedgerTextField(
        controller: _controller,
        label: widget.labelText,
        readOnly: true,
        showClear: false,
        onTap: widget.onTap,
        margin: EdgeInsets.zero,
        decoration: InputDecoration(
          hintText: widget.hintText,
          focusedBorder: context.theme.inputDecorationTheme.enabledBorder,
          suffixIcon: widget.dateTime != null
              ? null
              : Transform.translate(
                  offset: Offset(0, -Spacing.tiny.value),
                  child: SizedBox(
                    child: Center(
                      widthFactor: 0,
                      child: Icon(
                        Icons.calendar_today_outlined,
                        color: context.regalColor.licoriceBlack,
                      ),
                    ),
                  ),
                ),
        ),
        textAlign: TextAlign.left,
      );
}
