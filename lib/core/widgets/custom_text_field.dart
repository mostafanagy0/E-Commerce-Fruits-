import 'package:flutter/material.dart';
import 'package:fruits_app/core/utils/app_text_style.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField(
      {super.key,
      required this.hintText,
      required this.textInputType,
      this.suffexIcon,
      this.onSaved});
  final String hintText;
  final TextInputType textInputType;
  final Widget? suffexIcon;
  final void Function(String?)? onSaved;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onSaved: onSaved,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'هذا الحقل مطلوب';
        }
        return null;
      },
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
