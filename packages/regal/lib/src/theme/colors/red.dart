import 'package:flutter/painting.dart';
import 'package:regal/regal.dart';

class Red extends ColorSystem {
  const Red() : super(0xFFEC5B5B);

  @override
  Color get shade5 => throw UnimplementedError();

  @override
  Color get shade10 => const Color(0xFFFDEFEF);

  @override
  Color get shade20 => const Color(0xFFFBDEDE);

  @override
  Color get shade40 => const Color(0xFFF7BDBD);

  @override
  Color get shade60 => const Color(0xFFF49D9D);

  @override
  Color get shade80 => const Color(0xFFF07C7C);
}
