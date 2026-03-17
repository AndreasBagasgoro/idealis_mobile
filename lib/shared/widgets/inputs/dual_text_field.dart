import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import 'custom_text_field.dart';

class DualTextField extends StatelessWidget {
  final TextEditingController firstController;
  final TextEditingController secondController;
  final String firstLabel;
  final String secondLabel;
  final String firstHintText;
  final String secondHintText;
  final TextInputType firstKeyboardType;
  final TextInputType secondKeyboardType;

  const DualTextField({
    super.key,
    required this.firstController,
    required this.secondController,
    required this.firstLabel,
    required this.secondLabel,
    required this.firstHintText,
    required this.secondHintText,
    this.firstKeyboardType = TextInputType.text,
    this.secondKeyboardType = TextInputType.text,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: CustomTextField(
            controller: firstController,
            label: firstLabel,
            hintText: firstHintText,
            keyboardType: firstKeyboardType,
          )
        ),
        SizedBox(width: 10),
        Expanded(
          child: CustomTextField(
            controller: secondController,
            label: secondLabel,
            hintText: secondHintText,
            keyboardType: secondKeyboardType,
          ) 
        ),
      ],
    );
  }
}
