import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'app_styles.dart';

class DialogUtils {
  static void showLoading({required BuildContext context}) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => AlertDialog(
        contentPadding: EdgeInsets.all(20),
        content: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 20,
          children: [
            CircularProgressIndicator(color: AppColors.mainColor),
            Text('loading', style: AppStyles.medium16MainColor),
          ],
        ),
      ),
    );
  }

  static void hideLoading({required BuildContext context}) {
    Navigator.pop(context);
  }

  static void showMessage({
    required BuildContext context,
    String title = '',
    required String message,
    String? posActionText,
    VoidCallback? posAction,
    String? negActionText,
    VoidCallback? negAction,
  }) {
    List<Widget> actions = [];
    if (posActionText != null) {
      actions.add(
        TextButton(
          onPressed: () {
            Navigator.pop(context);
            posAction?.call();
          },
          child: Text(posActionText, style: AppStyles.medium16MainColor),
        ),
      );
    }
    if (negActionText != null) {
      actions.add(
        TextButton(
          onPressed: () {
            Navigator.pop(context);
            negAction?.call();
          },
          child: Text(negActionText, style: AppStyles.medium16MainColor),
        ),
      );
    }
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => AlertDialog(
        contentPadding: EdgeInsets.all(20),
        content: Text(message, style: AppStyles.medium16MainColor),
        title: Text(title, style: AppStyles.medium16MainColor),
        actions: actions,
      ),
    );
    FocusManager.instance.primaryFocus?.unfocus();
  }

  static Future<String?> showPasswordDialog({
    required BuildContext context,
    String title = '',
    required String message,
    String confirmText = 'Confirm',
    String cancelText = 'Cancel',
  }) {
    TextEditingController passwordController = TextEditingController();

    return showDialog<String>(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          contentPadding: const EdgeInsets.all(20),
          title: Text(title, style: AppStyles.medium16MainColor),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(message, style: AppStyles.medium16MainColor),
              const SizedBox(height: 15),
              TextField(
                controller: passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  hintText: "Enter your password",
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // يرجع null
              },
              child: Text(cancelText, style: AppStyles.medium16MainColor),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context, passwordController.text.trim());
              },
              child: Text(confirmText, style: AppStyles.medium16MainColor),
            ),
          ],
        );
      },
    );
  }
}
