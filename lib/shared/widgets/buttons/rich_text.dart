import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:idealis_mobile/core/constants/app_colors.dart';

class RichTextButton extends StatelessWidget {
  final String normalText;
  final String actionText;
  final VoidCallback onTap;

  const RichTextButton({
    super.key,
    required this.normalText,
    required this.actionText,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: normalText,
        style: TextStyle(fontSize: 16, color: AppColors.black),
        children: [
          TextSpan(
            text: actionText,
            style: TextStyle(
              color: AppColors.primary,
              decoration: TextDecoration.underline,
              fontWeight: FontWeight.bold,
              decorationColor: AppColors.primary,
            ),
            recognizer: TapGestureRecognizer()..onTap = onTap,
          ),
        ],
      ),
    );
  }
}
