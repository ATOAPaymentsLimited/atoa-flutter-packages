import 'package:flutter/painting.dart';
import 'package:regal/regal.dart';

class Green extends ColorSystem {
  const Green() : super(0xFF25C348);

  @override
  Color get shade05 => const Color(0xFFF4FCF6);

  @override
  Color get shade10 => const Color(0xFFE9F9ED);

  @override
  Color get shade20 => const Color(0xFFD3F3DA);

  @override
  Color get shade40 => const Color(0xFFA8E7B6);

  @override
  Color get shade60 => const Color(0xFF7CDB91);

  @override
  Color get shade80 => const Color(0xFF51CF6D);
}
