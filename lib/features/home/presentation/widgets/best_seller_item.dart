import 'package:flutter/material.dart';
import 'package:fruits_app/core/utils/app_text_style.dart';

class BestSellerItem extends StatelessWidget {
  const BestSellerItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          'الأكثر مبيعًا',
          style: TextStyles.bold16,
        ),
        Text(
          'المزيد',
          style: TextStyles.regular13.copyWith(color: const Color(0xFF949D9E)),
        )
      ],
    );
  }
}
