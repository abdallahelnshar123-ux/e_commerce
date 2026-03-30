import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/core/utils/app_assets.dart';
import 'package:e_commerce/core/utils/app_colors.dart';
import 'package:e_commerce/core/utils/app_styles.dart';
import 'package:e_commerce/domain/entities/response/product/product.dart';
import 'package:e_commerce/features/ui/widgets/increment_decrement_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

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
    // TODO: implement didChangeDependencies
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
          builtActionButton(AppAssets.cartIcon),
        ],

        centerTitle: true,
        title: Text('Product Details', style: AppStyles.medium20TextColor),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          spacing: 16.h,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            builtSlideShow(product.images ?? []),
            Row(
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
            Row(
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
                SizedBox(width: 10.w,),
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

            // Container(
            //   padding: EdgeInsets.all(context.width * 0.04),
            //   width: double.infinity,
            //   decoration: BoxDecoration(
            //     color: context.isLight
            //         ? AppColors.whiteColor
            //         : AppColors.inputsColor,
            //     border: Border.all(
            //       color: context.isLight
            //           ? AppColors.strokeColor
            //           : AppColors.strokeDarkColor,
            //     ),
            //     borderRadius: BorderRadius.circular(16),
            //   ),
            //   child: Row(
            //     spacing: context.width * 0.04,
            //     children: [
            //       Container(
            //         padding: EdgeInsets.all(context.width * 0.028),
            //         decoration: BoxDecoration(
            //           color: context.isLight
            //               ? AppColors.backgroundColor
            //               : AppColors.inputsColor,
            //           border: Border.all(
            //             color: context.isLight
            //                 ? AppColors.strokeColor
            //                 : AppColors.strokeDarkColor,
            //           ),
            //           borderRadius: BorderRadius.circular(8),
            //         ),
            //         child: Icon(
            //           Iconsax.calendar_add_outline,
            //           color: context.isLight
            //               ? AppColors.mainColor
            //               : AppColors.mainDarkModeColor,
            //           size: 32,
            //         ),
            //       ),
            //       Column(
            //         crossAxisAlignment: CrossAxisAlignment.start,
            //         children: [
            //           Text(
            //             DateFormat(
            //               'd MMMM',
            //               context.locale.toString(),
            //             ).format(event.eventDate),
            //             style: Theme
            //                 .of(context)
            //                 .textTheme
            //                 .labelLarge!
            //                 .copyWith(
            //               color: context.isLight
            //                   ? AppColors.mainTextColor
            //                   : AppColors.mainDarkModeColor,
            //             ),
            //           ),
            //           Text(
            //             event.eventTime.format(context),
            //             style: Theme
            //                 .of(context)
            //                 .textTheme
            //                 .labelLarge!
            //                 .copyWith(
            //               color: context.isLight
            //                   ? AppColors.disableColor
            //                   : AppColors.secTextDarkModeColor,
            //             ),
            //           ),
            //         ],
            //       ),
            //     ],
            //   ),
            // ),
            Text('description', style: Theme.of(context).textTheme.labelLarge),
            Container(
              padding: EdgeInsets.all(0.04),
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColors.textColor,
                border: Border.all(color: AppColors.whiteColor),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Text(
                product.description ?? 'no description',
                style: Theme.of(context).textTheme.labelSmall,
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
}
