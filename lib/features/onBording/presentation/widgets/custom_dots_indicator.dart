import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:fruits_app/core/utils/app_colors.dart';

class CustomDotsIndicator extends StatelessWidget {
  const CustomDotsIndicator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DotsIndicator(
      dotsCount: 2,
      decorator: DotsDecorator(
          activeColor: AppColors.primaryColor,
          color: AppColors.primaryColor.withOpacity(.5)),
    );
  }
}
