import 'package:e_commerce/core/cache/shared_prefs_utils.dart';
import 'package:e_commerce/core/utils/app_routes.dart';
import 'package:e_commerce/features/ui/home_screen/tabs/user_tab/widget/user_tab_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/app_assets.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_styles.dart';
class UserTab extends StatefulWidget {
  const UserTab({super.key});

  @override
  State<UserTab> createState() => _UserTabState();
}

class _UserTabState extends State<UserTab> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController addressController = TextEditingController();
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
    addressController.dispose();
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
                  SizedBox(height: 40.h),
                  Text('Your full name', style: AppStyles.medium18TextColor),
                  SizedBox(height: 10.h),
                  UserTabTextField(
                    controller: nameController,
                    hintText: "enter your full name",
                  ),
                  SizedBox(height: 24.h),
                  Text(
                    'Your mobile number',
                    style: AppStyles.medium18TextColor,
                  ),
                  SizedBox(height: 10.h),
                  UserTabTextField(
                    controller: phoneController,
                    hintText: "Enter your mobile no.",
                  ),
                  SizedBox(height: 24.h),
                  Text('Your E-mail', style: AppStyles.medium18TextColor),
                  SizedBox(height: 10.h),
                  UserTabTextField(
                    controller: emailController,
                    hintText: "Enter your email address",
                  ),
                  SizedBox(height: 24.h),
                  Text('Your password', style: AppStyles.medium18TextColor),
                  SizedBox(height: 10.h),
                  UserTabTextField(
                    controller: passwordController,
                    hintText: "Enter your password",
                  ),
                  SizedBox(height: 24.h),
                  Text('Your Address', style: AppStyles.medium18TextColor),
                  SizedBox(height: 10.h),
                  UserTabTextField(
                    controller: addressController,
                    hintText: "Enter your address",
                  ),
                  SizedBox(height: 24.h),
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Welcome, Mohamed',
                      style: AppStyles.medium18TextColor,
                    ),
                    Text(
                      'mohamed.N@gmail.com',
                      style: AppStyles.medium14DescriptionColor,
                    ),
                  ],
                ),
                IconButton(
                  onPressed: () async {
                    await SharedPrefsUtils.removeData(
                      key: ShredPrefsKeys.tokenKey,
                    );
                    if (mounted) {
                      Navigator.pushNamedAndRemoveUntil(
                        context,
                        AppRoutes.loginRouteName,
                        (route) => false,
                      );
                    }
                  },
                  icon: Icon(Icons.logout_outlined),
                  color: Colors.red,
                  iconSize: 35.w,
                  style: IconButton.styleFrom(
                    padding: EdgeInsets.zero,
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
