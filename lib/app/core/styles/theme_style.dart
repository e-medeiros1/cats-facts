import 'package:flutter/material.dart';

import 'colors_style.dart';

class ThemeStyle {
  ThemeStyle._();

  static final theme = ThemeData(
    scaffoldBackgroundColor: ColorsStyle.instance.secondary,
    fontFamily: 'Volkhov',
    colorScheme: ColorScheme.fromSeed(
      seedColor: ColorsStyle.instance.primary,
      primary: ColorsStyle.instance.primary,
      secondary: ColorsStyle.instance.secondary,
    ),
  );
}
