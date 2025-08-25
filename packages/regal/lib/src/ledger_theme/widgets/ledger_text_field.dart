import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:regal/assets/assets.gen.dart';
import 'package:regal/src/atoa_dls.dart';

class LedgerTextField extends StatefulWidget {
  const LedgerTextField({
    super.key,
    this.margin,
    this.suffix,
    this.label,
    this.hintText,
    this.onClear,
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
    this.hintStyle,
    this.labelStyle,
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
    this.maxLines = 1,
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
    this.filled,
    this.fillColor,
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
  }) : assert(
          showLabel && label != null || !showLabel && label == null,
          'Please provide label or make showLabel false',
        );

  final String? label;
  final String? hintText;
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
  final TextStyle? hintStyle;
  final TextStyle? labelStyle;
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
  final int maxLines;
  final int? minLines;
  final bool expands;
  final int? maxLength;
  final GestureTapCallback? onTap;
  final TapRegionCallback? onTapOutside;
  final VoidCallback? onEditingComplete;
  final ValueChanged<String>? onFieldSubmitted;
  final ValueChanged<String>? onClear;
  final ValueChanged<String?>? onSaved;
  final String? Function(String? value)? validator;
  final List<TextInputFormatter>? inputFormatters;
  final bool? enabled;
  final double cursorWidth;
  final double? cursorHeight;
  final Radius? cursorRadius;
  final Color? cursorColor;
  final bool? filled;
  final Color? fillColor;
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
  State<LedgerTextField> createState() => _LedgerTextFieldState();
}

class _LedgerTextFieldState extends State<LedgerTextField> {
  late final TextEditingController _textEditingController;
  TextValidationState? _errorListenable;

  @override
  void initState() {
    _textEditingController = widget.controller ??
        TextEditingController(
          text: widget.initialValue ?? '',
        );
    _errorListenable = null;
    super.initState();
  }

  @override
  void didUpdateWidget(covariant LedgerTextField oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.initialValue != widget.initialValue) {
      _textEditingController.text = widget.initialValue ?? '';
    }
  }

  @override
  void dispose() {
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
          margin: widget.margin ?? Spacing.lds100.y,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (widget.showLabel && widget.label is String) ...[
                CustomText.semantics(
                  widget.label!,
                  style: widget.labelStyle ??
                      context.theme.inputDecorationTheme.labelStyle,
                ),
                Spacing.lds50.yBox,
              ],
              TextFormField(
                restorationId: widget.restorationId,
                contextMenuBuilder: widget.contextMenuBuilder ??
                    (context, editableTextState) =>
                        AdaptiveTextSelectionToolbar.buttonItems(
                          anchors: editableTextState.contextMenuAnchors,
                          buttonItems: editableTextState.contextMenuButtonItems,
                        ),
                controller: _textEditingController,
                focusNode: widget.focusNode,
                decoration:
                    (widget.decoration ?? const InputDecoration()).copyWith(
                  suffixIcon: widget.suffix ?? _buildSuffixIcon,
                  filled: widget.filled ??
                      widget.decoration?.filled ??
                      context.theme.inputDecorationTheme.filled,
                  fillColor: widget.fillColor ??
                      widget.decoration?.fillColor ??
                      context.theme.inputDecorationTheme.fillColor,
                  hintText: widget.hintText ?? widget.decoration?.hintText,
                  hintStyle: widget.hintStyle ??
                      widget.decoration?.hintStyle ??
                      context.theme.inputDecorationTheme.hintStyle,
                ),
                validator: (value) {
                  final result = widget.validator?.call(value);

                  if (result is String) {
                    _updateLabelColor(TextValidationState.invalid);
                  } else {
                    if (widget.initialValue != null) {
                      _updateLabelColor(
                        widget.initialValue?.isNotEmpty ?? false
                            ? TextValidationState.typing
                            : TextValidationState.none,
                      );
                    } else {
                      _updateLabelColor(
                        _textEditingController.text.isNotEmpty
                            ? TextValidationState.typing
                            : TextValidationState.none,
                      );
                    }
                  }

                  return result;
                },
                autovalidateMode: widget.autovalidateMode,
                onSaved: widget.onSaved,
                keyboardType: widget.keyboardType,
                textInputAction: widget.textInputAction,
                style: widget.style ?? context.body1.semiBold,
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
                maxLines: widget.maxLines,
                minLines: widget.minLines,
                expands: widget.expands,
                maxLength: widget.maxLength,
                onChanged: (String value) {
                  widget.onChanged?.call(value);

                  if (widget.autovalidateMode == AutovalidateMode.disabled) {
                    return;
                  }

                  if (value.isNotEmpty) {
                    _updateLabelColor(TextValidationState.typing);
                  } else if (value.isEmpty) {
                    _updateLabelColor(TextValidationState.none);
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
                cursorColor: context.baseBlack,
                scrollPadding: widget.scrollPadding,
                scrollPhysics: widget.scrollPhysics,
                keyboardAppearance: widget.keyboardAppearance,
                enableInteractiveSelection: widget.enableInteractiveSelection ??
                    (!widget.obscureText || !widget.readOnly),
                selectionControls: widget.selectionControls,
                buildCounter: widget.buildCounter,
                autofillHints: widget.autofillHints,
                scrollController: widget.scrollController,
                enableIMEPersonalizedLearning:
                    widget.enableIMEPersonalizedLearning,
                mouseCursor: widget.mouseCursor,
                spellCheckConfiguration: widget.spellCheckConfiguration,
                magnifierConfiguration: widget.magnifierConfiguration,
              ),
            ],
          ),
        ),
      );

  Widget? get _buildSuffixIcon => widget.readOnly || !widget.showClear
      ? null
      : Builder(
          builder: (context) {
            final value = _errorListenable;
            if (value == null || value.isNone) return const SizedBox.shrink();

            return LedgerIconButton(
              assetPath: value.assetPath,
              iconColor: value.suffixColor,
              trackLabel: 'Clear ${widget.label}',
              semanticsLabel: 'Clear ${widget.label}',
              onPressed: value == TextValidationState.typing
                  ? (context) {
                      _textEditingController.clear();
                      widget.onClear?.call('');
                      widget.onChanged?.call('');
                      _updateLabelColor(TextValidationState.none);
                    }
                  : null,
            );
          },
        );

  void _updateLabelColor(TextValidationState state) {
    _errorListenable = state;
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      if (mounted) setState(() {});
    });
  }
}

enum TextValidationState {
  none,
  typing,
  invalid;

  bool get isNone => this == none;

  Color get labelColor => this == invalid
      ? LedgerColors.lightColors.semantic.error.defaultColor
      : LedgerColors.lightColors.neutral.grey.shade500;

  Color get suffixColor => this == none
      ? Colors.transparent
      : this == invalid
          ? LedgerColors.lightColors.semantic.error.defaultColor
          : LedgerColors.lightColors.neutral.grey.shade500;

  String get assetPath =>
      this == invalid ? Assets.icons.error : Assets.icons.closeFill;
}
