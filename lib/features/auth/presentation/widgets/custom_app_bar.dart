import 'package:flutter/material.dart';
import 'package:fruits_app/core/utils/app_text_style.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Text(
          'تسجيل دخول',
          style: TextStyles.bold13,
        )
      ],
    );
  }
}
