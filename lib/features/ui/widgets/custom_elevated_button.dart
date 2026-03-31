import 'package:flutter/material.dart';

import '../../../core/utils/app_colors.dart';

class CustomElevatedButton extends StatelessWidget {
  final Color backGroundColor;
  final Color? borderSideColor;
  final Widget child;
  final double? verticalPadding;
  final double? horizontalPadding;
  final double? width;
  final double? borderRadius;
  final void Function() onPressed;

  const CustomElevatedButton({
    super.key,
    required this.child,
    required this.backGroundColor,
    this.borderSideColor,
    required this.onPressed,
    this.horizontalPadding,
    this.verticalPadding,
    this.width,
    this.borderRadius
  });

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: Size(width ?? 0, 0),
        side: BorderSide(color: borderSideColor ?? AppColors.transparentColor),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(borderRadius ?? 0)),
        backgroundColor: backGroundColor,
        padding: EdgeInsets.symmetric(
          vertical: verticalPadding ?? 0,
          horizontal: horizontalPadding ?? 0,
        ),
      ),
      onPressed: onPressed,
      child: child,
    );
  }
}
