import 'package:e_commerce/core/utils/app_assets.dart';
import 'package:e_commerce/core/utils/app_colors.dart';
import 'package:e_commerce/core/utils/app_styles.dart';
import 'package:e_commerce/features/ui/widgets/increment_decrement_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

class CartItem extends StatelessWidget {
  const CartItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      width: double.infinity,
      height: 115.h,
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
                    IconButton(
                      iconSize: 24.w,
                      color: AppColors.textColor,
                      padding: EdgeInsets.symmetric(
                        horizontal: 11.w,
                        vertical: 8.h,
                      ),
                      style: IconButton.styleFrom(
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                      onPressed: () {},
                      icon: SvgPicture.asset(
                        AppAssets.deleteIcon,
                        colorFilter: ColorFilter.mode(
                          AppColors.textColor,
                          BlendMode.srcIn,
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(
                      right: 11.w,
                      bottom: 8.h
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        formatNumber(2435, true, 'EPG '),
                        style: AppStyles.medium14TextColor,
                      ),
                      IncrementDecrementWidget()
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
      width: 115.h,
      height: 115.h,
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
