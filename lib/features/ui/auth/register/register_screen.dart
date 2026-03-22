import 'package:e_commerce/core/di/di.dart';
import 'package:e_commerce/core/utils/app_assets.dart';
import 'package:e_commerce/core/utils/app_colors.dart';
import 'package:e_commerce/core/utils/app_styles.dart';
import 'package:e_commerce/core/utils/dialog_utils.dart';
import 'package:e_commerce/features/ui/auth/auth_states.dart';
import 'package:e_commerce/features/ui/auth/login/cubit/login_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_text_form_field.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  LoginViewModel viewModel = getIt<LoginViewModel>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool obscurePassword = true;
  bool obscureRePassword = true;

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginViewModel, AuthStates>(
      bloc: viewModel,
      listener: (context, state) {
        if (state is AuthLoadingState) {
          DialogUtils.showLoading(context: context);
        } else if (state is AuthSuccessState) {
          DialogUtils.hideLoading(context: context);
          DialogUtils.showMessage(
            context: context,
            message: 'Login Successfully',
            title: 'Success',
            posActionText: 'ok',
          );
        } else if (state is AuthErrorState) {
          DialogUtils.hideLoading(context: context);
          DialogUtils.showMessage(
            context: context,
            message: state.errorMessage.message,
            title: 'Error',
            posActionText: 'ok',
          );
        }
      },
      child: Scaffold(
        backgroundColor: AppColors.mainColor,
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,

                children: [
                  SizedBox(height: 90.h),
                  Image.asset(AppAssets.routeLogo),
                  SizedBox(height: 20.h),
                  Text('Full Name', style: AppStyles.medium18White),
                  SizedBox(height: 10.h),
                  CustomTextFormField(
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

                    hintText: "enter your full name",
                    hintStyle: AppStyles.light18Black70,
                    filled: true,
                    fillColor: AppColors.whiteColor,
                  ),
                  SizedBox(height: 40.h),
                  Text('Phone', style: AppStyles.medium18White),
                  SizedBox(height: 10.h),
                  CustomTextFormField(
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

                    hintText: "Enter your mobile no.",
                    hintStyle: AppStyles.light18Black70,
                    filled: true,
                    fillColor: AppColors.whiteColor,
                  ),
                  SizedBox(height: 40.h),
                  Text('Email', style: AppStyles.medium18White),
                  SizedBox(height: 10.h),
                  CustomTextFormField(
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
                    backGroundColor: AppColors.whiteColor,
                    onPressed: () {
                      if (formKey.currentState?.validate() == true) {
                        viewModel.login(
                          email: emailController.text,
                          password: passwordController.text,
                        );
                      }
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
}
