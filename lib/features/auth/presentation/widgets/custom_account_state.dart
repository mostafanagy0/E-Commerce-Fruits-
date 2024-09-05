import 'package:flutter/material.dart';
import 'package:fruits_app/core/utils/app_colors.dart';
import 'package:fruits_app/core/utils/app_text_style.dart';

class CustomAccountState extends StatelessWidget {
  const CustomAccountState(
      {super.key, required this.text1, required this.text2});
  final String text1;
  final String text2;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          text1,
          style: TextStyles.semiBold16.copyWith(color: const Color(0xff949D9E)),
        ),
        Text(
          text2,
          style: TextStyles.semiBold16.copyWith(color: AppColors.primaryColor),
        )
      ],
    );
  }
}
