import 'package:e_commerce/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SectionTitleWidget extends StatelessWidget {
  final String titleText;
  final Widget? viewAllWidget;

  const SectionTitleWidget({
    super.key,
    required this.titleText,
    this.viewAllWidget,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(titleText, style: AppStyles.medium18TextColor),
          viewAllWidget ?? Container(),
        ],
      ),
    );
  }
}
