import 'package:e_commerce/core/utils/app_assets.dart';
import 'package:e_commerce/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FavouriteIcon extends StatelessWidget {
  final bool isSelected;

  const FavouriteIcon({super.key, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 15.r,
      backgroundColor: AppColors.whiteColor,
      child: IconButton(
        padding: EdgeInsets.zero,
        onPressed: () {},
        isSelected: isSelected,
        icon: SvgPicture.asset(
          width: 24.w,
          AppAssets.heartIcon,
          colorFilter: ColorFilter.mode(AppColors.mainColor, BlendMode.srcIn),
        ),
        selectedIcon: SvgPicture.asset(
          width: 24.w,
          AppAssets.hearFilledIcon,
          // colorFilter: ColorFilter.mode(AppColors.whiteColor, BlendMode.src),
        ),
      ),
    );
  }
}
