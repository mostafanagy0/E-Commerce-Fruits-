import 'package:flutter/material.dart';
import 'package:fruits_app/core/utils/app_colors.dart';
import 'package:fruits_app/core/utils/app_text_style.dart';

class CustomForgetPasswordText extends StatelessWidget {
  const CustomForgetPasswordText({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          'نسيت كلمة المرور؟',
          style: TextStyles.semiBold13
              .copyWith(color: AppColors.lightPrimaryColor),
        ),
      ],
    );
  }
}
