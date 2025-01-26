import 'package:flutter/material.dart';
import 'package:fruits_app/core/utils/app_text_style.dart';
import 'package:fruits_app/features/best_selling_fruits/presentation/views/best_selling_view.dart';

class BestSellerItemHeader extends StatelessWidget {
  const BestSellerItemHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, BestSellingView.routeName);
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'الأكثر مبيعًا',
            style: TextStyles.bold16,
          ),
          Text(
            'المزيد',
            style:
                TextStyles.regular13.copyWith(color: const Color(0xFF949D9E)),
          )
        ],
      ),
    );
  }
}
