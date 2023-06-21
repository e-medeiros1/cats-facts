import 'package:flutter/material.dart';

class ColorsStyle {
  static ColorsStyle? _instance;
  final _primaryColor = const Color(0xFF3C3D6E);
  final _secondaryColor = const Color(0xFF202331);
  final _whiteColor = const Color(0xFFD9DEEC);

  ColorsStyle._();

  static ColorsStyle get instance {
    _instance ??= ColorsStyle._();
    return _instance!;
  }

  Color get primary => _primaryColor;
  Color get secondary => _secondaryColor;
  Color get white => _whiteColor;
}

extension ColorsStyleExtensions on BuildContext {
  ColorsStyle get colors => ColorsStyle.instance;
}
