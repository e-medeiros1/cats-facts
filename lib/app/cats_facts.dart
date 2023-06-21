import 'package:cats_facts/app/core/styles/theme_style.dart';
import 'package:flutter/material.dart';

import 'pages/home/home_page.dart';

class CatsFacts extends StatelessWidget {
  const CatsFacts({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeStyle.theme,
      home: const HomePage(),
    );
  }
}
