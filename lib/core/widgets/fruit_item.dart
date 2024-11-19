import 'package:flutter/material.dart';
import 'package:fruits_app/core/utils/app_colors.dart';
import 'package:fruits_app/core/utils/app_images.dart';
import 'package:fruits_app/core/utils/app_text_style.dart';

class FruitItem extends StatelessWidget {
  const FruitItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        color: const Color(0xFFF3F5F7),
      ),
      child: Stack(
        children: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.favorite_border)),
          Positioned.fill(
            child: Column(children: [
              const SizedBox(height: 20),
              Image.asset(Assets.imagesWatermelonTest),
              const SizedBox(height: 24),
              ListTile(
                title: const Text(
                  'بطيخ',
                  style: TextStyles.semiBold16,
                ),
                subtitle: Text.rich(TextSpan(children: [
                  TextSpan(
                      text: '20جنية',
                      style: TextStyles.bold13W700
                          .copyWith(color: AppColors.secondryColor)),
                  const TextSpan(
                    text: ' ',
                  ),
                  TextSpan(
                      text: '/',
                      style: TextStyles.semiBold13
                          .copyWith(color: AppColors.lightsecondryColor)),
                  const TextSpan(
                    text: ' ',
                  ),
                  TextSpan(
                      text: 'الكيلو',
                      style: TextStyles.semiBold13
                          .copyWith(color: AppColors.lightsecondryColor)),
                ])),
                trailing: const CircleAvatar(
                  backgroundColor: AppColors.primaryColor,
                  child: Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                ),
              )
            ]),
          )
        ],
      ),
    );
  }
}
