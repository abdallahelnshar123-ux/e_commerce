import 'package:e_commerce/core/utils/app_assets.dart';
import 'package:e_commerce/core/utils/app_colors.dart';
import 'package:e_commerce/core/utils/app_styles.dart';
import 'package:e_commerce/features/ui/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

class WishlistItem extends StatelessWidget {
  const WishlistItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      width: double.infinity,
      height: 130.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        border: BoxBorder.all(color: AppColors.strokeColor, width: 1),
      ),
      foregroundDecoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        border: BoxBorder.all(
          color: AppColors.strokeColor,
          width: 1,
          strokeAlign: -2.5,
        ),
      ),
      child: Row(
        spacing: 8.w,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          builtProductCover(),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('title', style: AppStyles.medium18TextColor),
                    Padding(
                      padding: EdgeInsets.only(right: 11.w, top: 11.h),
                      child: Material(
                        elevation: 2,
                        shape: const CircleBorder(),
                        color: AppColors.whiteColor,
                        child: InkWell(
                          overlayColor: WidgetStatePropertyAll(
                            AppColors.mainColor.withAlpha(100),
                          ),
                          borderRadius: BorderRadius.circular(20),
                          onTap: () {},
                          child: SvgPicture.asset(
                            width: 30.w,
                            AppAssets.hearFilledIcon,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(right: 11.w, bottom: 8.h),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        formatNumber(2435, true, 'EPG '),
                        style: AppStyles.medium14TextColor,
                      ),
                      CustomElevatedButton(
                        backGroundColor: AppColors.mainColor,
                        onPressed: () {},
                        borderRadius: 15.r,
                        horizontalPadding: 10.w,
                        verticalPadding: 10.w,
                        child: Text(
                          'Add to Cart',
                          style: AppStyles.regular12WhiteColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget builtProductCover() {
    return Container(
      width: 130.h,
      height: 130.h,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AppAssets.announcementImage1),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(16.r),
        border: BoxBorder.all(color: AppColors.strokeColor, width: 1),
      ),
    );
  }

  String formatNumber(num number, bool isPrice, String? symbol) {
    final priceFormatter = NumberFormat.currency(
      locale: 'en',
      symbol: symbol ?? '',
      decimalDigits: 0,
    );

    final numFormatter = NumberFormat.currency(
      locale: 'ar',
      symbol: symbol ?? '',
      decimalDigits: 0,
    );

    return isPrice
        ? priceFormatter.format(number)
        : numFormatter.format(number);
  }
}
