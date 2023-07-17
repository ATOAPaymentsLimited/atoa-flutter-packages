import 'package:flutter/painting.dart';
import 'package:regal/regal.dart';

class Gold extends ColorSystem {
  const Gold() : super(0xFFFFDDA9);
  @override
  Color get shade05 => throw UnimplementedError();

  @override
  Color get shade10 => throw UnimplementedError();

  @override
  Color get shade20 => const Color(0xFFFFF8EE);

  @override
  Color get shade40 => const Color(0xFFFFF1DD);

  @override
  Color get shade60 => const Color(0xFFFFEBCB);

  @override
  Color get shade80 => const Color(0xFFFFE4BA);
}
