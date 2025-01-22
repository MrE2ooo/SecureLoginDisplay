import 'package:flutter/material.dart';
import 'package:restlogin/colors.dart';

class InputBox extends StatelessWidget {
  const InputBox({super.key, required this.hint, required this.textController, required this.isSecured});
  final String hint;
  final TextEditingController textController;
  final bool isSecured;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
            color: AppColors.primaryColor), // Using primary color for border
      ),
      child: TextField(
        controller: textController,
        obscureText: isSecured,
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: const TextStyle(
              color: AppColors.primaryColor), // Using primary color for hint
          border: InputBorder.none,
        ),
      ),
    );
  }
}
