// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:cats_facts/app/core/helper/size_extensions.dart';
import 'package:cats_facts/app/core/styles/colors_style.dart';
import 'package:cats_facts/app/core/styles/texts_style.dart';

class CustomElevatedButton extends StatelessWidget {
  final VoidCallback onPressed;
  const CustomElevatedButton({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(context.colors.primary),
            elevation: const MaterialStatePropertyAll(1),
            padding: const MaterialStatePropertyAll(EdgeInsets.all(15)),
            shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10)))),
        onPressed: onPressed,
        child: Text(
          'Get a new fact!',
          style: context.textsStyle.textRegular.copyWith(
              fontSize: context.percentHeight(.03),
              color: context.colors.white),
        ));
  }
}
