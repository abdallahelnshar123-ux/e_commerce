import 'package:e_commerce/core/utils/app_assets.dart';
import 'package:e_commerce/core/utils/app_colors.dart';
import 'package:e_commerce/core/utils/app_styles.dart';
import 'package:e_commerce/features/ui/home_screen/tabs/home_tab/widget/category_item.dart';
import 'package:e_commerce/features/ui/home_screen/tabs/home_tab/widget/section_title_widget.dart';
import 'package:e_commerce/features/ui/home_screen/tabs/home_tab/widget/slide_show_item.dart';
import 'package:e_commerce/features/ui/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.only(top: 7.h, left: 16.w, right: 16.w),
        child: Scaffold(
          appBar: builtAppBar(),
          body: SingleChildScrollView(
            child: Column(
              spacing: 16.h,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsetsGeometry.only(top: 16.h),
                  child: builtSlideShow(),
                ),
                SectionTitleWidget(
                  titleText: 'Categories',
                  viewAllWidget: TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                      overlayColor: AppColors.transparentColor,
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      padding: EdgeInsets.zero,
                    ),
                    child: Text(
                      'view all',
                      style: AppStyles.regular12TextColor,
                    ),
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  height: 350.h,
                  child: builtCategoriesItems(),
                ),
                SectionTitleWidget(titleText: 'Home Appliance'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

PreferredSizeWidget builtAppBar() {
  return PreferredSize(
    preferredSize: Size.fromHeight(110.h),
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
            SvgPicture.asset(
              width: 24.w,
              AppAssets.cartIcon,
              colorFilter: ColorFilter.mode(
                AppColors.mainColor,
                BlendMode.srcIn,
              ),
            ),
          ],
        ),
      ],
    ),
  );
}

ClipRRect builtSlideShow() {
  return ClipRRect(
    clipBehavior: Clip.antiAlias,
    borderRadius: BorderRadius.circular(16.r),
    child: ImageSlideshow(
      indicatorBackgroundColor: AppColors.whiteColor,
      indicatorRadius: 5.r,
      autoPlayInterval: 5000,
      width: double.infinity,
      height: 200.h,
      isLoop: true,
      indicatorColor: AppColors.mainColor,
      disableUserScrolling: true,
      initialPage: 0,
      children: [
        SlideShowItem(imageIndex: 1),
        SlideShowItem(imageIndex: 2),
        SlideShowItem(imageIndex: 3),
      ],
    ),
  );
}

GridView builtCategoriesItems() {
  return GridView.builder(
    scrollDirection: Axis.horizontal,
    itemCount: 10,
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
      childAspectRatio: 150.h / 100.w,
      mainAxisSpacing: 16.w,
      crossAxisSpacing: 16.w,
    ),
    itemBuilder: (context, index) =>
        CategoryItem(imageUrl: 'ds', text: 'sdhsdshkj'),
  );
}
