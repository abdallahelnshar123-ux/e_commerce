import 'package:e_commerce/core/utils/app_assets.dart';
import 'package:e_commerce/core/utils/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartItem extends StatelessWidget {
  const CartItem({super.key});

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
        border: BoxBorder.all(color: AppColors.strokeColor, width: 1 , strokeAlign: -2.5),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          builtProductCover(),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [


              ],
            )
        ],
      ),
    );
  }
  Widget builtProductCover(){
    return Container(
      width: 115.h ,
      height: 115.h ,
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage( AppAssets.announcementImage1 , ) , fit: BoxFit.cover),
        borderRadius: BorderRadius.circular(16.r),
        border: BoxBorder.all(color: AppColors.strokeColor, width: 1),
      ),
    );

  }

}
