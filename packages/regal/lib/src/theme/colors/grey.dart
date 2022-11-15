import 'package:flutter/painting.dart';
import 'package:regal/regal.dart';

class Grey extends ColorSystem {
  const Grey() : super(0xFF000000);

  @override
  Color get shade5 => const Color(0xFFF2F2F2);

  @override
  Color get shade10 => const Color(0xFFE5E5E5);

  @override
  Color get shade20 => const Color(0xFFCCCCCC);

  @override
  Color get shade40 => const Color(0xFF999999);

  @override
  Color get shade60 => const Color(0xFF666666);

  @override
  Color get shade80 => const Color(0xFF333333);
}
