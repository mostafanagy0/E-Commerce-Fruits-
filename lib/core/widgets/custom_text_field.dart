import 'package:flutter/material.dart';
import 'package:fruits_app/core/utils/app_text_style.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key,
      required this.hintText,
      required this.textInputType,
      this.suffexIcon});
  final String hintText;
  final TextInputType textInputType;
  final Widget? suffexIcon;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: textInputType,
      decoration: InputDecoration(
          hintStyle: TextStyles.bold13.copyWith(
            color: const Color(0xFF949D9E),
          ),
          suffixIcon: suffexIcon,
          hintText: hintText,
          filled: true,
          fillColor: const Color(0xFFF9FAFA),
          border: buildBorder(),
          focusedBorder: buildBorder(),
          enabledBorder: buildBorder()),
    );
  }
}

OutlineInputBorder buildBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(4),
    borderSide: const BorderSide(
      width: 1,
      color: Color(0xFFE6E9E9),
    ),
  );
}
