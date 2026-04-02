import 'package:badges/badges.dart' as badges;
import 'package:e_commerce/core/utils/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/utils/app_assets.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_styles.dart';
import '../cart_screen/cubit/cart_view_model.dart';

class CartIcon extends StatelessWidget {
  final Widget? icon;

  const CartIcon({super.key, this.icon});

  @override
  Widget build(BuildContext context) {
    return badges.Badge(
      position: badges.BadgePosition.topStart(top: -6, start: 0),
      ignorePointer: false,
      badgeContent: Text(
        context.watch<CartViewModel>().numOfCartItems.toString(),
        style: AppStyles.regular12WhiteColor,
      ),
      badgeAnimation: badges.BadgeAnimation.scale(
        animationDuration: Duration(seconds: 1),
        curve: Curves.fastOutSlowIn,
      ),
      badgeStyle: badges.BadgeStyle(
        shape: badges.BadgeShape.circle,
        badgeColor: Colors.green,
        padding: EdgeInsets.all(5),
        borderRadius: BorderRadius.circular(4),
        elevation: 0,
      ),
      child: IconButton(
        style: IconButton.styleFrom(
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        ),
        padding: EdgeInsets.zero,

        onPressed: () {
          Navigator.pushNamed(context, AppRoutes.cartScreenRouteName);
        },
        icon:
            icon ??
            SvgPicture.asset(
              width: 24.w,
              AppAssets.cartIcon,
              colorFilter: ColorFilter.mode(
                AppColors.mainColor,
                BlendMode.srcIn,
              ),
            ),
      ),
    );
  }
}
