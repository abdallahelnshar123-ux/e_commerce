import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/utils/app_colors.dart';
import '../../../../../../core/utils/app_styles.dart';
import '../../../../widgets/custom_text_form_field.dart';

class UserTabTextField extends StatelessWidget {
  final TextEditingController controller;

  final String hintText;

  const UserTabTextField({
    super.key,
    required this.controller,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      suffixIcon: IconButton(
        color: AppColors.textColor,
        onPressed: () {},
        icon: Icon(Icons.edit_outlined),
        iconSize: 30.w,
        style: IconButton.styleFrom(
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          padding: EdgeInsets.symmetric(horizontal: 20.w),
        ),
      ),
      contentPadding: 15.h,
      borderRadius: 16.r,
      validator: (text) {
        if (text?.trim().isEmpty ?? true) {
          return 'please_enter_email';
        }
        return null;
      },
      controller: controller,
      hintText: hintText,
      hintStyle: AppStyles.light18Black70,
      filled: true,
      fillColor: AppColors.whiteColor,
      borderSideColor: AppColors.strokeColor,
    );
  }
}
