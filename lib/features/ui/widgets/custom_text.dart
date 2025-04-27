import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  String? text;
  TextStyle? textStyle;

  CustomText({required this.text, required this.textStyle});

  @override
  Widget build(BuildContext context) {
    return AutoSizeText(
      text!,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: textStyle,
    );
  }
}
