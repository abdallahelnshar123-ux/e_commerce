import 'package:e_commerce/core/utils/app_routes.dart';
import 'package:e_commerce/features/ui/home_screen/tabs/products_tab/cubit/product_tab_states.dart';
import 'package:e_commerce/features/ui/home_screen/tabs/products_tab/widget/product_item.dart';
import 'package:e_commerce/features/ui/widgets/cart_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/di/di.dart';
import '../../../../../core/utils/app_assets.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_styles.dart';
import '../../../../../domain/entities/response/product/product.dart';
import '../../../widgets/custom_text_form_field.dart';
import '../../../widgets/main_error_widget.dart';
import '../../../widgets/main_loading_widget.dart';
import 'cubit/product_tab_view_model.dart';

class ProductsTab extends StatefulWidget {
  const ProductsTab({super.key});

  @override
  State<ProductsTab> createState() => _ProductsTabState();
}

class _ProductsTabState extends State<ProductsTab> {
  ProductTabViewModel viewModel = getIt<ProductTabViewModel>();

  @override
  void initState() {
    super.initState();
    viewModel.getAllProducts();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: builtAppBar(),
        body: BlocBuilder<ProductTabViewModel, ProductTabStates>(
          bloc: viewModel,
          builder: (BuildContext context, state) {
            if (state is ProductSuccessState) {
              return builtProductsWidget(state.productsList!);
            } else if (state is ProductErrorState) {
              return MainErrorWidget(
                errorMessage: state.errorMessage,
                onPressed: () {
                  viewModel.getAllProducts();
                },
              );
            }
            return MainLoadingWidget();
          },
        ),
      ),
    );
  }

  PreferredSizeWidget builtAppBar() {
    return PreferredSize(
      preferredSize: Size.fromHeight(110.h),
      child: Padding(
        padding: EdgeInsets.only(top: 7.h, left: 16.w, right: 16.w),
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
                CartIcon(),
              ],
            ),
          ],
        ),
      ),
    );
  }

  GridView builtProductsWidget(List<Product> productsList) {
    return GridView.builder(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),

      itemCount: productsList.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 191.w / 270.h,
        mainAxisSpacing: 16.w,
        crossAxisSpacing: 16.w,
      ),
      itemBuilder: (context, index) => InkWell(
        onTap: () => Navigator.pushNamed(
          context,
          AppRoutes.productDetailsRouteName,
          arguments: productsList[index],
        ),
        child: ProductItem(product: productsList[index]),
      ),
    );
  }
}
