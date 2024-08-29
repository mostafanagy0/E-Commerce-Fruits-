// ignore_for_file: must_be_immutable

import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:fruits_app/core/utils/app_colors.dart';

class CustomDotsIndicator extends StatelessWidget {
  const CustomDotsIndicator({
    super.key,
  });
  final int currentPage = 0;
  @override
  Widget build(BuildContext context) {
    return DotsIndicator(
      dotsCount: 2,
      decorator: DotsDecorator(
          activeColor: AppColors.primaryColor,
          color: currentPage == 1
              ? AppColors.primaryColor.withOpacity(.5)
              : AppColors.primaryColor),
    );
  }
}
