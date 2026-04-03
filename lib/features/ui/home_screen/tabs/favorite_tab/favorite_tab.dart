import 'package:e_commerce/features/ui/home_screen/tabs/favorite_tab/widget/favourite_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/utils/app_assets.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_styles.dart';
import '../../../widgets/cart_icon.dart';
import '../../../widgets/custom_text_form_field.dart';

class FavoriteTab extends StatelessWidget {
  const FavoriteTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: builtAppBar(),
        body: builtFavouriteItemsList(),
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
              spacing: 24.w,
              children: [
                Expanded(
                  child: CustomTextFormField(
                    hintText: 'what do you search for?',
                    hintStyle: AppStyles.light14DescriptionColor,
                    prefixIcon: SvgPicture.asset(
                      AppAssets.searchIcon,
                      fit: BoxFit.scaleDown,
                      colorFilter: ColorFilter.mode(
                        AppColors.mainColor,
                        BlendMode.srcIn,
                      ),
                    ),
                    borderRadius: 25.r,
                    contentPadding: 10.h,
                    borderSideColor: AppColors.mainColor,
                  ),
                ),
                CartIcon(),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget builtFavouriteItemsList() {
    return ListView.separated(
      padding: EdgeInsets.all(16.w),
      itemCount: 10,
      itemBuilder: (context, index) => FavouriteItem(),
      separatorBuilder: (BuildContext context, int index) =>
          SizedBox(height: 16.w),
    );
  }
}
