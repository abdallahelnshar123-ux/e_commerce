import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/core/utils/app_assets.dart';
import 'package:e_commerce/core/utils/app_colors.dart';
import 'package:e_commerce/core/utils/app_styles.dart';
import 'package:e_commerce/domain/entities/response/product/product.dart';
import 'package:e_commerce/features/ui/widgets/favourite_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

import '../../../../cart_screen/cubit/cart_view_model.dart';
import '../../../../widgets/main_loading_widget.dart';

class ProductItem extends StatelessWidget {
  final Product product;

  const ProductItem({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 270.h,
      width: 191.w,
      clipBehavior: Clip.antiAlias,
      foregroundDecoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.r),
        border: BoxBorder.all(color: AppColors.strokeColor, width: 2),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.r),
        border: BoxBorder.all(color: AppColors.strokeColor, width: 2),
      ),
      child: Stack(
        alignment: AlignmentDirectional.centerEnd,
        children: [
          Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              CachedNetworkImage(
                width: double.infinity,
                height: 128.h,
                fit: BoxFit.cover,
                imageUrl: product.imageCover ?? '',
                placeholder: (context, url) => MainLoadingWidget(),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsetsGeometry.all(8.w),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${product.title}',
                            style: AppStyles.regular14TextColor,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          ),
                          Text(
                            '${product.description}',
                            style: AppStyles.regular14TextColor,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          ),
                        ],
                      ),
                      Text(
                        formatPrice(product.price as num),
                        style: AppStyles.regular14TextColor,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Row(
                        spacing: 4.w,
                        children: [
                          Text(
                            'Review (${product.ratingsAverage})',
                            style: AppStyles.regular12TextColor,
                            overflow: TextOverflow.ellipsis,
                          ),
                          SvgPicture.asset(AppAssets.starIcon, width: 15.w),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsetsGeometry.only(top: 8.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FavouriteIcon(isSelected: false),
                IconButton(
                  iconSize: 30.w,
                  padding: EdgeInsets.zero,
                  onPressed: () {
                    context.read<CartViewModel>().addProductToCart(product.id!);
                  },
                  icon: Icon(
                    Icons.add_circle_rounded,
                    color: AppColors.mainColor,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  String formatPrice(num price) {
    final formatter = NumberFormat.currency(
      locale: 'en',
      symbol: 'EGP ',
      decimalDigits: 0,
    );
    return formatter.format(price);
  }
}
