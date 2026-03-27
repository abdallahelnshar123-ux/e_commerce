import 'package:e_commerce/core/utils/app_colors.dart';
import 'package:e_commerce/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MainErrorWidget extends StatelessWidget {
  final String errorMessage;
  final VoidCallback? onPressed;

  const MainErrorWidget({
    super.key,
    required this.errorMessage,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: double.infinity,
      padding: EdgeInsets.only(top: 16.h),
      child: Column(
        spacing: 10.h,
        children: [
          Text(errorMessage, style: AppStyles.medium16MainColor),
          onPressed != null
              ? ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.mainColor,
                  ),
                  onPressed: onPressed,
                  child: Text('try again', style: AppStyles.medium18White),
                )
              : Container(),
        ],
      ),
    );
  }
}
