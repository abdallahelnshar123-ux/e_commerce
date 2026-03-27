import 'package:e_commerce/core/utils/app_styles.dart';
import 'package:e_commerce/features/ui/widgets/main_loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cached_network_image/cached_network_image.dart';

class CategoryItem extends StatelessWidget {
  final String imageUrl;
  final String text;

  const CategoryItem({super.key, required this.imageUrl, required this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 8.h,
      mainAxisSize: MainAxisSize.min,
      children: [
        CircleAvatar(
          radius: 50.r,
          child:
              // Image.network(imageUrl , fit: BoxFit.cover,)
        ClipOval(

                child: CachedNetworkImage(
                  width: double.infinity,
                  height: double.infinity,
                  fit: BoxFit.cover,
                  imageUrl: imageUrl,
                  placeholder: (context, url) => MainLoadingWidget(),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),
              ),
        ),
        Text(
          text,
          style: AppStyles.regular14TextColor,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
