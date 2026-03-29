import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/core/utils/app_colors.dart';
import 'package:e_commerce/core/utils/app_styles.dart';
import 'package:e_commerce/domain/entities/response/product/product.dart';
import 'package:e_commerce/features/ui/widgets/favourite_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../widgets/main_loading_widget.dart';

/*
imageUrl: productsList[index].imageCover!,
        productDescription:productsList[index].description?? 'No description' ,
        productName: productsList[index].title ?? 'No Title',
        productPrice: productsList[index].price ?? 0,
        productReview: productsList[index].ratingsAverage ?? 0.0 ,

 */
class ProductItem extends StatelessWidget {
  final Product product;

  // final String imageUrl;
  // final String productName;
  // final String productDescription;
  // final int productPrice;
  // final String productReview;

  const ProductItem({
    super.key,
    required this.product,
    // required this.imageUrl,
    // required this.productDescription,
    // required this.productName,
    // required this.productPrice,
    // required this.productReview,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 237.h,
      width: 191.w,
      clipBehavior: Clip.antiAlias,
      foregroundDecoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.r),
        border: BoxBorder.all(color: AppColors.strokeColor, width: 2),
      ),
      decoration: BoxDecoration(),
      child: Stack(
        alignment: AlignmentDirectional.centerEnd,

        children: [
          Column(
            children: [
              CachedNetworkImage(
                width: double.infinity,
                height: 128.h,
                fit: BoxFit.cover,
                imageUrl: product.imageCover ?? '',
                placeholder: (context, url) => MainLoadingWidget(),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
              Padding(
                padding: EdgeInsetsGeometry.all(8.w),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      '${product.title}\n${product.description}',
                      style: AppStyles.regular14TextColor,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      '${product.}   ${product.price}',
                      style: AppStyles.regular14TextColor,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
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
                  onPressed: () {},
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
}
