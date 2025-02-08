import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  Color backgroundColor;
  String text;
  TextStyle textStyle;
  void Function()? onPressed;

  CustomElevatedButton({required this.text, required this.textStyle, required this.backgroundColor, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 0,
            backgroundColor: backgroundColor,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(15.r)
                ),
            ),
            padding: EdgeInsets.symmetric(
                horizontal: 1.w
            ),
        ),
        onPressed: onPressed,
        child: SizedBox(
          height: 64.h,
          width: 398.w,
          child: Center(
            child: AutoSizeText(text, style: textStyle),
          ),
        )
    );
  }
}
