import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/utils/app_assets.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_styles.dart';
import '../../../widgets/cart_icon.dart';
import '../../../widgets/custom_elevated_button.dart';
import '../../../widgets/custom_text_form_field.dart';

class UserTab extends StatefulWidget {
  const UserTab({super.key});

  @override
  State<UserTab> createState() => _UserTabState();
}

class _UserTabState extends State<UserTab> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController nameController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool obscurePassword = true;
  bool obscureRePassword = true;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    nameController.dispose();
    phoneController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: builtAppBar(),
        backgroundColor: AppColors.whiteColor,
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
      
                children: [
                  SizedBox(height: 20.h),
                  Text('Full Name', style: AppStyles.medium18White),
                  SizedBox(height: 10.h),
                  CustomTextFormField(
                    contentPadding: 15.h,
                    borderRadius: 16.r,
                    validator: (text) {
                      if (text?.trim().isEmpty ?? true) {
                        return 'please_enter_email';
                      }
                      return null;
                    },
                    controller: nameController,
      
                    hintText: "enter your full name",
                    hintStyle: AppStyles.light18Black70,
                    filled: true,
                    fillColor: AppColors.whiteColor,
                  ),
                  SizedBox(height: 40.h),
                  Text('Phone', style: AppStyles.medium18White),
                  SizedBox(height: 10.h),
                  CustomTextFormField(
                    contentPadding: 15.h,
                    borderRadius: 16.r,
                    validator: (text) {
                      if (text?.trim().isEmpty ?? true) {
                        return 'please_enter_email';
                      }
                      return null;
                    },
                    controller: phoneController,
      
                    hintText: "Enter your mobile no.",
                    hintStyle: AppStyles.light18Black70,
                    filled: true,
                    fillColor: AppColors.whiteColor,
                  ),
                  SizedBox(height: 40.h),
                  Text('Email', style: AppStyles.medium18White),
                  SizedBox(height: 10.h),
                  CustomTextFormField(
                    contentPadding: 15.h,
                    borderRadius: 16.r,
                    validator: (text) {
                      if (text?.trim().isEmpty ?? true) {
                        return 'please_enter_email';
                      }
                      final bool emailValid = RegExp(
                        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
                      ).hasMatch(text!);
                      if (!emailValid) {
                        return 'please_enter_valid_email';
                      }
                      return null;
                    },
                    controller: emailController,
      
                    hintText: "Enter your email address",
                    hintStyle: AppStyles.light18Black70,
                    filled: true,
                    fillColor: AppColors.whiteColor,
                  ),
                  SizedBox(height: 32.h),
                  Text('Password', style: AppStyles.medium18White),
                  SizedBox(height: 10.h),
                  CustomTextFormField(
                    contentPadding: 15.h,
                    borderRadius: 16.r,
                    validator: (text) {
                      if (text?.trim().isEmpty ?? true) {
                        return 'please_enter_password';
                      }
                      if (text!.length < 6) {
                        return 'password_must_be_at_least';
                      }
                      return null;
                    },
                    controller: passwordController,
                    obscureText: obscurePassword,
                    obscuringCharacter: '*',
                    hintText: "Enter your password",
                    hintStyle: AppStyles.light18Black70,
                    filled: true,
                    fillColor: AppColors.whiteColor,
                    suffixIcon: IconButton(
                      selectedIcon: Icon(
                        Icons.visibility_off_rounded,
                        color: AppColors.grayColor,
                      ),
                      isSelected: obscurePassword,
                      onPressed: () {
                        obscurePassword = !obscurePassword;
                        setState(() {});
                      },
                      icon: Icon(
                        Icons.visibility_rounded,
                        color: AppColors.grayColor,
                      ),
                    ),
                  ),
                  SizedBox(height: 32.h),
                  Text('Confirm Password', style: AppStyles.medium18White),
                  SizedBox(height: 10.h),
                  CustomTextFormField(
                    contentPadding: 15.h,
                    borderRadius: 16.r,
                    validator: (text) {
                      if (text?.trim().isEmpty ?? true) {
                        return 'please_confirm_password';
                      }
                      if (text != passwordController.text) {
                        return 'password_does_not_match';
                      }
                      return null;
                    },
                    controller: confirmPasswordController,
                    obscureText: obscureRePassword,
                    obscuringCharacter: '*',
                    hintText: "Confirm your password",
                    hintStyle: AppStyles.light18Black70,
                    filled: true,
                    fillColor: AppColors.whiteColor,
                    suffixIcon: IconButton(
                      selectedIcon: Icon(
                        Icons.visibility_off_rounded,
                        color: AppColors.grayColor,
                      ),
                      isSelected: obscureRePassword,
                      onPressed: () {
                        obscureRePassword = !obscureRePassword;
                        setState(() {});
                      },
                      icon: Icon(
                        Icons.visibility_rounded,
                        color: AppColors.grayColor,
                      ),
                    ),
                  ),
                  SizedBox(height: 55.h),
      
                  CustomElevatedButton(
                    borderRadius: 16.r,
                    width: double.infinity,
                    verticalPadding: 15.h,
                    backGroundColor: AppColors.whiteColor,
                    onPressed: () {
                      if (formKey.currentState?.validate() == true) {}
                    },
                    child: Text("Sign up", style: AppStyles.sBold20MainColor),
                  ),
                  SizedBox(height: 32.h),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
  PreferredSizeWidget builtAppBar() {
    return PreferredSize(
      preferredSize: Size.fromHeight(110.h),
      child: Padding(
        padding: EdgeInsets.only(top: 7.h, left: 16.w, right: 16.w),
        child: Column(
          spacing: 18.h,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(AppAssets.blueRouteLogo, width: 66.w, height: 22.h),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Welcome, Mohamed' , style:  AppStyles.medium18TextColor,),
                Text('mohamed.N@gmail.com' , style:  AppStyles.medium14DescriptionColor,)
              ],
            )
          ],
        ),
      ),
    );
  }
}
