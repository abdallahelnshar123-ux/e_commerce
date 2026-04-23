import 'package:flutter/material.dart';

import '../../../core/utils/app_routes.dart';
import '../../../core/utils/app_styles.dart';

typedef OnTextClick = void Function()?;

class AlreadyOrDoNotHaveAccountWidget extends StatelessWidget {
  final String plainText;
  final String clickableText;
  final OnTextClick onTextClick;

  const AlreadyOrDoNotHaveAccountWidget({
    super.key,
    required this.plainText,
    required this.clickableText,
    required this.onTextClick,
  });

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.scaleDown,

      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(plainText, style: AppStyles.light16White),
          TextButton(
            style: TextButton.styleFrom(
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              padding: EdgeInsets.zero,
            ),
            onPressed: onTextClick ,

            child: Text(clickableText, style: AppStyles.medium18White),
          ),
        ],
      ),
    );
  }
}
