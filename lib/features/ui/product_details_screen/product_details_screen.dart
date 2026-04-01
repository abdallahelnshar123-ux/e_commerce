import 'package:badges/badges.dart' as badges;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/core/utils/app_assets.dart';
import 'package:e_commerce/core/utils/app_colors.dart';
import 'package:e_commerce/core/utils/app_styles.dart';
import 'package:e_commerce/domain/entities/response/product/product.dart';
import 'package:e_commerce/features/ui/product_details_screen/cubit/cart_view_model.dart';
import 'package:e_commerce/features/ui/widgets/cart_icon.dart';
import 'package:e_commerce/features/ui/widgets/custom_elevated_button.dart';
import 'package:e_commerce/features/ui/widgets/increment_decrement_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:readmore/readmore.dart';

import '../widgets/main_loading_widget.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  bool isInitialized = false;
  late Product product;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!isInitialized) {
      product = ModalRoute.of(context)?.settings.arguments as Product;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actionsPadding: EdgeInsets.only(right: 14.w),
        actions: [
          builtActionButton(AppAssets.searchIcon),
          CartIcon(icon: builtActionButton(AppAssets.cartIcon)),
        ],

        centerTitle: true,
        title: Text('Product Details', style: AppStyles.medium20TextColor),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          spacing: 8.h,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            builtSlideShow(product.images ?? []),
            Padding(
              padding: EdgeInsets.only(top: 16.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      product.title!,
                      style: AppStyles.medium18TextColor,
                    ),
                  ),
                  Text(
                    formatNumber(product.price ?? 0, true, 'EGP '),
                    style: AppStyles.medium18TextColor,
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 8.h),
              child: Row(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 16.w,
                      vertical: 8.h,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30.r),
                      border: BoxBorder.all(
                        color: AppColors.strokeColor,
                        width: 1,
                      ),
                    ),
                    child: Text(
                      formatNumber(product.sold ?? 0, false, 'sold'),
                      style: AppStyles.medium14TextColor,
                    ),
                  ),
                  SizedBox(width: 10.w),
                  Row(
                    spacing: 4.w,
                    children: [
                      SvgPicture.asset(AppAssets.starIcon, width: 15.w),

                      Text(
                        '${product.ratingsAverage} ( ${formatNumber(product.ratingsQuantity ?? 0, false, null)})',
                        style: AppStyles.regular12TextColor,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                  Spacer(),
                  IncrementDecrementWidget(),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 8.h),
              child: Text('Description', style: AppStyles.medium18TextColor),
            ),
            ReadMoreText(
              product.description ?? '',
              trimMode: TrimMode.Line,
              trimLines: 2,
              style: AppStyles.regular14TextColor.copyWith(
                color: AppColors.descriptionColor,
              ),
              trimCollapsedText: 'Read More',
              moreStyle: AppStyles.regular14TextColor,
              lessStyle: AppStyles.regular14TextColor,
            ),

            Padding(
              padding: EdgeInsets.only(top: 50.h),
              child: Row(
                spacing: 40.w,
                children: [
                  totalPriceWidget(),
                  Expanded(
                    child: addToCartButton(() {
                      context.read<CartViewModel>().addProductToCart(
                        product.id!,
                      );
                    }),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget builtActionButton(String icon) {
    return IconButton(
      padding: EdgeInsets.zero,
      onPressed: () {},
      icon: SvgPicture.asset(
        icon,
        width: 24.w,
        colorFilter: ColorFilter.mode(AppColors.mainColor, BlendMode.srcIn),
      ),
    );
  }

  Widget builtSlideShow(List<String> imagesList) {
    return ClipRRect(
      clipBehavior: Clip.antiAlias,
      borderRadius: BorderRadius.circular(16.r),
      child: ImageSlideshow(
        indicatorBackgroundColor: AppColors.whiteColor,
        indicatorRadius: 5.r,
        width: double.infinity,
        height: 300.h,
        indicatorColor: AppColors.mainColor,
        initialPage: 0,
        children: imagesList
            .map(
              (imageUrl) => CachedNetworkImage(
                width: double.infinity,
                height: 128.h,
                fit: BoxFit.cover,
                imageUrl: imageUrl,
                placeholder: (context, url) => MainLoadingWidget(),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            )
            .toList(),
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

  Widget totalPriceWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Total price', style: AppStyles.medium18DescriptionColor),
        Text(
          formatNumber(5234, true, 'EGP '),
          style: AppStyles.medium18TextColor,
        ),
      ],
    );
  }

  Widget addToCartButton(VoidCallback onPressed) {
    return CustomElevatedButton(
      borderRadius: 20.r,
      backGroundColor: AppColors.mainColor,
      onPressed: () {
        onPressed();
      },
      width: double.infinity,
      verticalPadding: 12.h,
      horizontalPadding: 32.w,
      child: Row(
        spacing: 25.w,
        children: [
          SvgPicture.asset(AppAssets.addToCartIcon, width: 24.w),
          Flexible(
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Text('Add to cart', style: AppStyles.medium20White),
            ),
          ),
        ],
      ),
    );
  }
}
