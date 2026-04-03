import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_styles.dart';

class IncrementDecrementWidget extends StatelessWidget {
  final int count;
  const IncrementDecrementWidget({super.key , required this.count});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 2.h),
      decoration: BoxDecoration(
        color: AppColors.mainColor,
        borderRadius: BorderRadius.circular(30.r),
      ),
      child: Row(
        spacing: 6.w,
        children: [
          IconButton(
            style: IconButton.styleFrom(
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              iconSize: 25.w,
            ),
            padding: EdgeInsets.zero,
            onPressed: () {},
            icon: Icon(
              Icons.remove_circle_outline_rounded,
              color: AppColors.whiteColor,
            ),
          ),
          Text(count.toString(), style: AppStyles.light16White),
          IconButton(
            style: IconButton.styleFrom(
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              iconSize: 25.w,
            ),
            padding: EdgeInsets.zero,
            onPressed: () {},
            icon: Icon(
              Icons.add_circle_outline_rounded,
              color: AppColors.whiteColor,
            ),
          ),
        ],
      ),
    );
  }
}
