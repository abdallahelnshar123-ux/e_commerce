import 'package:flutter/material.dart';


class SlideShowItem extends StatelessWidget {
  const SlideShowItem({super.key , required this.imageIndex});
  final int imageIndex;

  @override
  Widget build(BuildContext context) {
    return Image.asset('assets/images/announcement_image$imageIndex.png' , fit: BoxFit.cover,);
  }
}
