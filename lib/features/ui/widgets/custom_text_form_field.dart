import 'package:e_commerce/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

import '../../../core/utils/app_colors.dart';

typedef OnChanged = void Function(String)?;
typedef OnValidator = String? Function(String?)?;
typedef OnFieldSubmitted = void Function(String)?;

class CustomTextFormField extends StatelessWidget {
  final Color? borderSideColor;
  final Color? fillColor;
  final bool? filled;
  final String? hintText;
  final TextStyle? hintStyle;
  final String? labelText;
  final TextStyle? labelStyle;
  final TextStyle? errorStyle;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final int? maxLines;
  final OnChanged onChanged;
  final OnFieldSubmitted onFieldSubmitted;
  final TextEditingController? controller;
  final OnValidator validator;
  final TextInputType? keyboardType;
  final String obscuringCharacter;
  final bool obscureText;
  final double  borderWidth;
  final double?  borderRadius;
  final double?  contentPadding;

  const CustomTextFormField({
    super.key,
    this.hintText,
    this.hintStyle,
    this.labelText,
    this.labelStyle,
    this.fillColor,
    this.filled,
    this.borderSideColor,
    this.prefixIcon,
    this.suffixIcon,
    this.maxLines,
    this.controller,
    this.onChanged,
    this.validator,
    this.obscureText = false,
    this.obscuringCharacter = '.',
    this.keyboardType,
    this.errorStyle,
    this.onFieldSubmitted,
    this.borderWidth = 1,
    this.borderRadius,
    this.contentPadding
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onFieldSubmitted: onFieldSubmitted,
      maxLines: maxLines ?? 1,
      controller: controller,
      onChanged: onChanged,
      validator: validator,
      obscureText: obscureText,
      obscuringCharacter: obscuringCharacter,
      keyboardType: keyboardType,
      style: AppStyles.medium16MainColor,
      cursorColor: AppColors.mainColor,
      cursorHeight: 30,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(
          vertical: contentPadding ?? 10
        ) ,
        filled: filled,
        fillColor: fillColor,
        errorMaxLines: 2,
        errorStyle: errorStyle,
        enabledBorder: builtDecorationBorder(
          borderColor: borderSideColor ?? AppColors.transparentColor,
        ),
        focusedBorder: builtDecorationBorder(
          borderColor: borderSideColor ?? AppColors.transparentColor,
        ),
        errorBorder: builtDecorationBorder(borderColor: AppColors.redColor),
        focusedErrorBorder: builtDecorationBorder(
          borderColor: AppColors.redColor,
        ),
        hintText: hintText,
        hintStyle: hintStyle,
        labelText: labelText,
        labelStyle: labelStyle,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
      ),
    );
  }

  OutlineInputBorder builtDecorationBorder({required Color borderColor}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(borderRadius ?? 0 ),
      borderSide: BorderSide(width: borderWidth, color: borderColor),
    );
  }
}
