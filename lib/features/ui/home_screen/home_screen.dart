import 'package:e_commerce/core/di/di.dart';
import 'package:e_commerce/features/ui/home_screen/cubit/home_screen_view_model.dart';
import 'package:e_commerce/features/ui/home_screen/tabs/favorite_tab/favorite_tab.dart';
import 'package:e_commerce/features/ui/home_screen/tabs/home_tab/home_tab.dart';
import 'package:e_commerce/features/ui/home_screen/tabs/products_tab/products_tab.dart';
import 'package:e_commerce/features/ui/home_screen/tabs/user_tab/UserTab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/utils/app_assets.dart';
import '../../../core/utils/app_colors.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final HomeScreenViewModel viewModel = getIt<HomeScreenViewModel>();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: viewModel,
      builder: (BuildContext context, state) {
      return Scaffold(
        extendBody: true,
        body: viewModel.tabsList[viewModel.selectedTabIndex],
        bottomNavigationBar: ClipRRect(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(16.r),
            topLeft: Radius.circular(16.r),
          ),
          clipBehavior: Clip.antiAlias,
          child: BottomNavigationBar(

            type: BottomNavigationBarType.fixed,
            unselectedLabelStyle: TextStyle(fontSize: 0),
            selectedLabelStyle: TextStyle(fontSize: 0),
            backgroundColor: AppColors.mainColor,
            onTap: (index) {
              viewModel.changeIndex(index);
            },
            items: [
              builtBottomNavigationBarItem(
                iconName: AppAssets.homeIcon,
                index: 0,
              ),
              builtBottomNavigationBarItem(
                iconName: AppAssets.categoryIcon,
                index: 1,
              ),
              builtBottomNavigationBarItem(
                iconName: AppAssets.heartIcon,
                index: 2,
              ),
              builtBottomNavigationBarItem(
                iconName: AppAssets.userIcon,
                index: 3,
              ),
            ],
          ),
        ),
      );
      },

    );
  }

  BottomNavigationBarItem builtBottomNavigationBarItem({
    required String iconName,
    required int index,
  }) {
    return BottomNavigationBarItem(
      label: '',
      icon: CircleAvatar(
        radius: 20.r,
        backgroundColor: index == viewModel.selectedTabIndex
            ? AppColors.whiteColor
            : AppColors.transparentColor,
        child: SvgPicture.asset(
          iconName,
          colorFilter: ColorFilter.mode(
            index == viewModel.selectedTabIndex
                ? AppColors.mainColor
                : AppColors.whiteColor,
            BlendMode.srcIn,
          ),
          width: 24.w,
        ),
      ),
    );
  }
}
