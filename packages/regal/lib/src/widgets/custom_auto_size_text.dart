import 'package:auto_size_text/auto_size_text.dart';

class CustomAutoSizeText extends AutoSizeText {
  const CustomAutoSizeText.semantics(
    super.data, {
    super.key,
    super.textKey,
    super.style,
    super.strutStyle,
    super.minFontSize = 12,
    super.maxFontSize = double.infinity,
    super.stepGranularity = 1,
    super.presetFontSizes,
    super.group,
    super.textAlign,
    super.textDirection,
    super.locale,
    super.softWrap,
    super.wrapWords = true,
    super.overflow,
    super.overflowReplacement,
    super.textScaleFactor,
    super.maxLines,
  }) : super(semanticsLabel: data);
}
