import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruits_app/core/utils/app_colors.dart';
import 'package:fruits_app/core/utils/app_images.dart';

class CustomCheckBox extends StatelessWidget {
  const CustomCheckBox(
      {super.key, required this.isChecked, required this.onChecked});
  final bool isChecked;
  final ValueChanged<bool> onChecked;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 14),
      child: GestureDetector(
        onTap: () {
          onChecked(!isChecked);
        },
        child: AnimatedContainer(
          width: 24,
          height: 24,
          duration: const Duration(milliseconds: 100),
          decoration: ShapeDecoration(
            color: isChecked ? AppColors.primaryColor : Colors.white,
            shape: RoundedRectangleBorder(
              side: BorderSide(
                width: 1.50,
                color: isChecked ? Colors.transparent : const Color(0xFFDCDEDE),
              ),
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          child: isChecked
              ? Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: SvgPicture.asset(Assets.imagesCheckIcon),
                )
              : const SizedBox(),
        ),
      ),
    );
  }
}
