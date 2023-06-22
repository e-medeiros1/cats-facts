import 'package:flutter/material.dart';

class TextsStyle {
  static TextsStyle? _instance;
  TextsStyle._();
  static TextsStyle get instance {
    _instance ??= TextsStyle._();
    return _instance!;
  }

  String get font => 'Volkhov';
  TextStyle get textLight => const TextStyle(fontWeight: FontWeight.w300);
  TextStyle get textRegular => const TextStyle(fontWeight: FontWeight.normal);
  TextStyle get textMedium => const TextStyle(fontWeight: FontWeight.w500);
  TextStyle get textSemiBold => const TextStyle(fontWeight: FontWeight.w600);
  TextStyle get textBold => const TextStyle(fontWeight: FontWeight.bold);
  TextStyle get textExtraBold => const TextStyle(fontWeight: FontWeight.w800);

  TextStyle get textButtonLabel => textBold.copyWith(fontSize: 17);
  TextStyle get textTitle => textBold.copyWith(fontSize: 28);
}

extension TextsStyleExtension on BuildContext {
  TextsStyle get textsStyle => TextsStyle.instance;
}
