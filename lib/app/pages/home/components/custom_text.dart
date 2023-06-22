// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cats_facts/app/core/styles/colors_style.dart';
import 'package:cats_facts/app/core/styles/texts_style.dart';
import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  final double fontSize;
  const CustomText({
    Key? key,
    required this.text,
    required this.fontSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: context.textsStyle.textTitle.copyWith(
        fontSize: fontSize,
        color: context.colors.white,
      ),
    );
  }
}
