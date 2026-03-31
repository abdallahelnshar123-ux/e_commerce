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

import '../../../../core/utils/app_routes.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_text_form_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  LoginViewModel viewModel = getIt<LoginViewModel>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool isObscure = true;

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
                  SizedBox(height: 60.h),
                  FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      'Welcome Back To Route',
                      style: AppStyles.sBold24White,
                    ),
                  ),
                  Text(
                    'Please sign in with your mail',
                    style: AppStyles.light16White,
                  ),
                  SizedBox(height: 40.h),
                  Text('Email', style: AppStyles.medium18White),
                  SizedBox(height: 10.h),
                  CustomTextFormField(
                    validator: (text) {
                      if (text
                          ?.trim()
                          .isEmpty ?? true) {
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

                    hintText: "Enter your email",
                    hintStyle: AppStyles.light18Black70,
                    filled: true,
                    fillColor: AppColors.whiteColor,
                  ),
                  SizedBox(height: 32.h),

                  Text('Password', style: AppStyles.medium18White),
                  SizedBox(height: 10.h),
                  CustomTextFormField(
                    validator: (text) {
                      if (text
                          ?.trim()
                          .isEmpty ?? true) {
                        return 'please_enter_password';
                      }
                      if (text!.length < 6) {
                        return 'password_must_be_at_least';
                      }
                      return null;
                    },
                    controller: passwordController,
                    obscureText: isObscure,
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
                      isSelected: isObscure,
                      onPressed: () {
                        isObscure = !isObscure;
                        setState(() {});
                      },
                      icon: Icon(
                        Icons.visibility_rounded,
                        color: AppColors.grayColor,
                      ),
                    ),
                  ),
                  SizedBox(height: 15.h),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        style: TextButton.styleFrom(
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          padding: EdgeInsets.only(bottom: 8),
                        ),
                        onPressed: () {
                          //todo Navigate to Forget Password Screen
                        },
                        child: Text(
                          "Forgot password",
                          style: AppStyles.regular18White,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 55.h),

                  CustomElevatedButton(
                    width: double.infinity,
                    verticalPadding: 23.h,
                    backGroundColor: AppColors.whiteColor,
                    onPressed: () {
                      if (formKey.currentState?.validate() == true) {
                        viewModel.login(email: emailController.text,
                            password: passwordController.text);
                      }
                    },
                    child: Text("login", style: AppStyles.sBold20MainColor),
                  ),
                  SizedBox(height: 32.h),

                  FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Don’t have an account? ",
                          style: AppStyles.medium18White,
                        ),
                        TextButton(
                          style: TextButton.styleFrom(
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            padding: EdgeInsets.zero,
                          ),
                          onPressed: () {
                            //todo Navigate to Register Screen
                            Navigator.pushReplacementNamed(
                              context,
                              AppRoutes.registerRouteName,
                            );


                          },
                          child: Text(
                            "Create Account",
                            style: AppStyles.medium18White,
                          ),
                        ),
                      ],
                    ),
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
