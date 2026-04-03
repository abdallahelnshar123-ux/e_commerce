import 'package:e_commerce/features/ui/cart_screen/widget/cart_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';

import '../../../core/utils/app_assets.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_styles.dart';
import '../widgets/cart_icon.dart';
import '../widgets/custom_elevated_button.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: builtCheckOutWidget(() {}),
      appBar: AppBar(
        actionsPadding: EdgeInsets.only(right: 14.w),
        actions: [builtActionButton(AppAssets.searchIcon), CartIcon()],

        centerTitle: true,
        title: Text('Cart', style: AppStyles.medium20TextColor),
      ),
      body: builtCartItemsList(),
    );
  }

  Widget builtActionButton(String icon) {
    return IconButton(
      padding: EdgeInsets.zero,
      style: IconButton.styleFrom(
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
      onPressed: () {},
      icon: SvgPicture.asset(
        icon,
        width: 24.w,
        colorFilter: ColorFilter.mode(AppColors.mainColor, BlendMode.srcIn),
      ),
    );
  }

  Widget builtCartItemsList() {
    return ListView.separated(
      padding: EdgeInsets.all(16.w),
      itemCount: 10,
      itemBuilder: (context, index) => CartItem(),
      separatorBuilder: (BuildContext context, int index) =>
          SizedBox(height: 16.w),
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

  Widget builtCheckOutWidget(VoidCallback onPressed) {
    return Padding(
      padding: EdgeInsets.fromLTRB(16.w, 10.h, 16.w, 50.h),
      child: Row(
        spacing: 25.w,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Total price', style: AppStyles.medium18DescriptionColor),
              Text(
                formatNumber(5234, true, 'EGP '),
                style: AppStyles.medium18TextColor,
              ),
            ],
          ),
          Expanded(
            child: CustomElevatedButton(
              borderRadius: 20.r,
              backGroundColor: AppColors.mainColor,
              onPressed: () {
                onPressed();
              },
              width: double.infinity,
              verticalPadding: 12.h,
              horizontalPadding: 32.w,
              child: Row(
                spacing: 30.w,
                children: [
                  Flexible(
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text('Check Out', style: AppStyles.medium18White),
                    ),
                  ),
                  SvgPicture.asset(
                    width: 24.w,
                    AppAssets.arrowRightIcon,
                    colorFilter: ColorFilter.mode(
                      AppColors.whiteColor,
                      BlendMode.srcIn,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
