import 'package:e_commerce/domain/entities/response/cart/get/product_data.dart';
import 'package:e_commerce/features/ui/cart_screen/cubit/cart_states.dart';
import 'package:e_commerce/features/ui/cart_screen/cubit/cart_view_model.dart';
import 'package:e_commerce/features/ui/cart_screen/widget/cart_item.dart';
import 'package:e_commerce/features/ui/widgets/main_error_widget.dart';
import 'package:e_commerce/features/ui/widgets/main_loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
  void initState() {
    super.initState();
    context.read<CartViewModel>().getCartItems();
  }

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
      body: BlocBuilder<CartViewModel, CartStates>(
        buildWhen: (previous, current) {
          return current is GetCartItemsSuccessState ||
              current is DeleteCartItemSuccessState ||
              current is UpdateCartItemSuccessState;
        },
        builder: (context, state) {
          if (state is GetCartItemsSuccessState) {
            return builtCartItemsList(state.productsList);
          }
          if (state is DeleteCartItemSuccessState) {
            return builtCartItemsList(state.productsList);
          }
          if (state is UpdateCartItemSuccessState) {
            return builtCartItemsList(state.productsList);
          } else if (state is GetCartItemsErrorState) {
            return MainErrorWidget(errorMessage: state.errorMessage);
          }
          return MainLoadingWidget();
        },
      ),
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

  Widget builtCartItemsList(List<ProductData> productsList) {
    return ListView.separated(
      padding: EdgeInsets.all(16.w),
      itemCount: productsList.length,
      itemBuilder: (context, index) {
        if (productsList[index].product != null) {
          return CartItem(productData: productsList[index]);
        }
        return SizedBox.shrink();
      },
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
                formatNumber(
                  context.watch<CartViewModel>().totalCartPrice,
                  true,
                  'EGP ',
                ),
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
