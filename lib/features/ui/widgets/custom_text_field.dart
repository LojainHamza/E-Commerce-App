import 'package:e_commerce_app/core/utils/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  Color? filledColor;
  Color borderColor;
  Color? cursorColor;
  String? hintText;
  String? labelText;
  TextStyle? hintStyle;
  TextStyle? labelStyle;
  TextStyle? style;
  Widget? prefixIcon;
  Widget? suffixIcon;
  bool isObscureText;
  bool isPassword;
  int? maxLines;
  String? Function(String?)? validator;
  TextEditingController? controller;
  TextInputType? keyboardType;
  Function(String?)? onSaved;
  Function(String?)? onChanged;
  bool readOnly;

  CustomTextField(
      {
      this.filledColor = AppColors.whiteColor,
      this.cursorColor,
      this.onSaved,
      this.onChanged,
      this.controller,
      this.validator,
      this.borderColor = AppColors.whiteColor,
      required this.hintText,
      this.labelText,
      this.hintStyle,
      this.labelStyle,
      this.style,
      this.prefixIcon,
      this.suffixIcon,
      this.isObscureText = false,
      this.isPassword = false,
      this.maxLines,
      this.keyboardType = TextInputType.text,
      this.readOnly = false
      });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top:12.h,bottom: 20.h),
      child: TextFormField(
        onSaved: widget.onSaved,
        onChanged: widget.onChanged,
        controller: widget.controller,
        validator: widget.validator,
        keyboardType: widget.keyboardType,
        maxLines: widget.maxLines ?? 1,
        obscureText: widget.isObscureText,
        obscuringCharacter: '*',
        cursorColor: widget.cursorColor,
        style: widget.style,
        decoration: InputDecoration(
          hintText: widget.hintText,
          labelText: widget.labelText,
          hintStyle: widget.hintStyle,
          labelStyle: widget.labelStyle,
          fillColor: widget.filledColor,
          prefixIcon: widget.prefixIcon,
          suffixIcon: widget.isPassword?
              IconButton(onPressed: (){
                widget.isObscureText = !widget.isObscureText;
                setState(() {

                });
              }, icon: Icon(widget.isObscureText?
              Icons.visibility_off:Icons.visibility))
          : widget.suffixIcon,
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(
                  color: widget.borderColor, width: 2)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(
                  color: widget.borderColor, width: 2)),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide:
                  const BorderSide(color: AppColors.redColor, width: 2)),
          focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide:
                  const BorderSide(color: AppColors.redColor, width: 2)),
        ),
      ),
    );
  }
}
