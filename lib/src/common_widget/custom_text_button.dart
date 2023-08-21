import 'package:berayean/src/theme_manager/style_manager.dart';
import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({super.key, required this.title, required this.onPressed});

  final String title;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed, 
      child: Text(
        title, 
        style: getBlack30TextStyle().copyWith(
          decoration: TextDecoration.underline
        ),
        ),
      );
  }
}