import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/core/utils/app_assets.dart';
import 'package:e_commerce/core/utils/app_colors.dart';
import 'package:e_commerce/core/utils/app_styles.dart';
import 'package:e_commerce/domain/entities/response/cart/get/product_data.dart';
import 'package:e_commerce/domain/entities/response/product/product.dart';
import 'package:e_commerce/features/ui/widgets/increment_decrement_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

import '../../widgets/main_loading_widget.dart';

class CartItem extends StatelessWidget {
  final ProductData productData;

  const CartItem({super.key, required this.productData});

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
                    Expanded(
                      child: Text(
                        productData.product?.title ?? 'no title',
                        style: AppStyles.medium18TextColor,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
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
                  padding: EdgeInsets.only(right: 11.w, bottom: 8.h),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        formatNumber(productData.price ?? 0, true, 'EPG '),
                        style: AppStyles.medium14TextColor,
                      ),
                      IncrementDecrementWidget(count: productData.count?? 0,),
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
      clipBehavior: Clip.antiAlias,
      width: 115.h,
      height: 115.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        border: BoxBorder.all(color: AppColors.strokeColor, width: 1),
      ),
      foregroundDecoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        border: BoxBorder.all(color: AppColors.strokeColor, width: 1),
      ),
      child: CachedNetworkImage(
        imageUrl: productData.product?.imageCover ?? '',
        fit: BoxFit.cover,
        placeholder: (context, url) => MainLoadingWidget(),
        errorWidget: (context, url, error) => Icon(Icons.error),
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
