import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:regal/regal.dart';

class RegalTextField extends StatefulWidget {
  const RegalTextField({
    super.key,
    this.margin,
    this.suffix,
    required this.label,
    this.showLabel = true,
    this.showClear = true,
    this.controller,
    this.onChanged,
    this.initialValue,
    this.focusNode,
    this.decoration,
    this.keyboardType,
    this.textCapitalization = TextCapitalization.none,
    this.textInputAction,
    this.style,
    this.strutStyle,
    this.textDirection,
    this.textAlign = TextAlign.start,
    this.textAlignVertical,
    this.autofocus = false,
    this.readOnly = false,
    this.obscuringCharacter = '•',
    this.obscureText = false,
    this.autocorrect = false,
    this.smartDashesType,
    this.smartQuotesType,
    this.enableSuggestions = false,
    this.maxLengthEnforcement,
    this.maxLines,
    this.minLines,
    this.expands = false,
    this.maxLength,
    this.onTap,
    this.onTapOutside,
    this.onEditingComplete,
    this.onFieldSubmitted,
    this.onSaved,
    this.validator,
    this.inputFormatters,
    this.enabled,
    this.cursorWidth = 2.0,
    this.cursorHeight,
    this.cursorRadius,
    this.cursorColor,
    this.keyboardAppearance,
    this.scrollPadding = const EdgeInsets.all(20),
    this.enableInteractiveSelection,
    this.selectionControls,
    this.buildCounter,
    this.scrollPhysics,
    this.autofillHints,
    this.autovalidateMode,
    this.scrollController,
    this.restorationId,
    this.enableIMEPersonalizedLearning = false,
    this.mouseCursor,
    this.contextMenuBuilder,
    this.spellCheckConfiguration,
    this.magnifierConfiguration,
    this.showCursor,
  });

  final String label;
  final bool showLabel;
  final bool showClear;
  final Widget? suffix;
  final EdgeInsets? margin;
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  final String? initialValue;
  final FocusNode? focusNode;
  final InputDecoration? decoration;
  final TextInputType? keyboardType;
  final TextCapitalization textCapitalization;
  final TextInputAction? textInputAction;
  final TextStyle? style;
  final StrutStyle? strutStyle;
  final TextDirection? textDirection;
  final TextAlign textAlign;
  final TextAlignVertical? textAlignVertical;
  final bool autofocus;
  final bool readOnly;
  final bool? showCursor;
  final String obscuringCharacter;
  final bool obscureText;
  final bool autocorrect;
  final SmartDashesType? smartDashesType;
  final SmartQuotesType? smartQuotesType;
  final bool enableSuggestions;
  final MaxLengthEnforcement? maxLengthEnforcement;
  final int? maxLines;
  final int? minLines;
  final bool expands;
  final int? maxLength;
  final GestureTapCallback? onTap;
  final TapRegionCallback? onTapOutside;
  final VoidCallback? onEditingComplete;
  final ValueChanged<String>? onFieldSubmitted;
  final ValueChanged<String?>? onSaved;
  final String? Function(String? value)? validator;
  final List<TextInputFormatter>? inputFormatters;
  final bool? enabled;
  final double cursorWidth;
  final double? cursorHeight;
  final Radius? cursorRadius;
  final Color? cursorColor;
  final Brightness? keyboardAppearance;
  final EdgeInsets scrollPadding;
  final bool? enableInteractiveSelection;
  final TextSelectionControls? selectionControls;
  final InputCounterWidgetBuilder? buildCounter;
  final ScrollPhysics? scrollPhysics;
  final Iterable<String>? autofillHints;
  final AutovalidateMode? autovalidateMode;
  final ScrollController? scrollController;
  final String? restorationId;
  final bool enableIMEPersonalizedLearning;
  final MouseCursor? mouseCursor;
  final EditableTextContextMenuBuilder? contextMenuBuilder;
  final SpellCheckConfiguration? spellCheckConfiguration;
  final TextMagnifierConfiguration? magnifierConfiguration;

  @override
  State<RegalTextField> createState() => _RegalTextFieldState();
}

class _RegalTextFieldState extends State<RegalTextField> {
  late final TextEditingController _textEditingController;
  late final ValueNotifier<TextValidationState?> _errorListenable;

  @override
  void initState() {
    _textEditingController = widget.controller ?? TextEditingController();
    _errorListenable = ValueNotifier<TextValidationState?>(null);

    _errorListenable.addListener(_updateLabelColor);
    super.initState();
  }

  @override
  void dispose() {
    _errorListenable
      ..removeListener(_updateLabelColor)
      ..dispose();
    if (widget.controller == null) _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Semantics(
        textField: true,
        container: true,
        explicitChildNodes: true,
        label: '${widget.label} TextFormField',
        child: Container(
          margin: Spacing.large.y,
          child: TextFormField(
            restorationId: widget.restorationId,
            controller:
                widget.initialValue == null ? _textEditingController : null,
            focusNode: widget.focusNode,
            decoration: (widget.decoration ?? const InputDecoration()).copyWith(
              label:
                  widget.showLabel ? CustomText.semantics(widget.label) : null,
              floatingLabelStyle:
                  context.theme.inputDecorationTheme.labelStyle?.copyWith(
                color: _errorListenable.value?.color,
              ),
              suffixIcon: widget.suffix ?? _buildSuffixIcon,
            ),
            validator: (value) {
              final result = widget.validator?.call(value);

              if (result is String) {
                _errorListenable.value = TextValidationState.invalid;
              }

              return result;
            },
            autovalidateMode: widget.autovalidateMode,
            initialValue: widget.initialValue,
            onSaved: widget.onSaved,
            keyboardType: widget.keyboardType,
            textInputAction: widget.textInputAction,
            style: widget.style ??
                context.textTheme.titleSmall?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
            strutStyle: widget.strutStyle,
            textAlign: widget.textAlign,
            textAlignVertical: widget.textAlignVertical,
            textDirection: widget.textDirection,
            textCapitalization: widget.textCapitalization,
            autofocus: widget.autofocus,
            readOnly: widget.readOnly,
            showCursor: widget.showCursor,
            obscuringCharacter: widget.obscuringCharacter,
            obscureText: widget.obscureText,
            autocorrect: widget.autocorrect,
            smartDashesType: widget.smartDashesType ??
                (widget.obscureText
                    ? SmartDashesType.disabled
                    : SmartDashesType.enabled),
            smartQuotesType: widget.smartQuotesType ??
                (widget.obscureText
                    ? SmartQuotesType.disabled
                    : SmartQuotesType.enabled),
            enableSuggestions: widget.enableSuggestions,
            maxLengthEnforcement: widget.maxLengthEnforcement,
            maxLines: widget.obscureText ? 1 : widget.maxLines,
            minLines: widget.minLines,
            expands: widget.expands,
            maxLength: widget.maxLength,
            onChanged: (String value) {
              widget.onChanged?.call(value);

              if (widget.autovalidateMode == AutovalidateMode.disabled) return;

              if (value.isNotEmpty) {
                _errorListenable.value = TextValidationState.typing;
              }

              if (value.isEmpty) {
                _errorListenable.value = TextValidationState.none;
              }
            },
            onTap: widget.onTap,
            onTapOutside: widget.onTapOutside,
            onEditingComplete: widget.onEditingComplete,
            onFieldSubmitted: widget.onFieldSubmitted,
            inputFormatters: widget.inputFormatters,
            enabled: widget.enabled,
            cursorWidth: widget.cursorWidth,
            cursorHeight: widget.cursorHeight,
            cursorRadius: widget.cursorRadius,
            cursorColor: widget.cursorColor,
            scrollPadding: widget.scrollPadding,
            scrollPhysics: widget.scrollPhysics,
            keyboardAppearance: widget.keyboardAppearance,
            enableInteractiveSelection: widget.enableInteractiveSelection ??
                (!widget.obscureText || !widget.readOnly),
            selectionControls: widget.selectionControls,
            buildCounter: widget.buildCounter,
            autofillHints: widget.autofillHints,
            scrollController: widget.scrollController,
            enableIMEPersonalizedLearning: widget.enableIMEPersonalizedLearning,
            mouseCursor: widget.mouseCursor,
            contextMenuBuilder: widget.contextMenuBuilder,
            spellCheckConfiguration: widget.spellCheckConfiguration,
            magnifierConfiguration: widget.magnifierConfiguration,
          ),
        ),
      );

  Widget? get _buildSuffixIcon => !widget.showClear
      ? null
      : ValueListenableBuilder<TextValidationState?>(
          valueListenable: _errorListenable,
          builder: (context, value, child) {
            if (value == null || value.isNone) return const SizedBox.shrink();

            return RegalIconButton.iconData(
              iconData: value.iconData,
              iconColor: value.color,
              trackLabel: 'Clear ${widget.label}',
              semanticsLabel: 'Clear ${widget.label}',
              onPressed: (context) {
                _textEditingController.clear();
                _errorListenable.value = TextValidationState.none;
              },
            );
          },
        );

  void _updateLabelColor() {
    if (mounted) setState(() {});
  }
}

enum TextValidationState {
  none,
  typing,
  invalid;

  bool get isNone => this == none;

  Color get color => this == none
      ? Colors.transparent
      : this == invalid
          ? RegalColors.brightOrange
          : RegalColors.grey.shade40;

  IconData get iconData =>
      this == invalid ? Icons.error_outline : Icons.cancel_outlined;
}