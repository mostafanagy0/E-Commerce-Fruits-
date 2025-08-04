import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruits_app/core/utils/app_text_style.dart';

class ProductsHeaderWidget extends StatelessWidget {
  const ProductsHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text(
          'منتجاتنا',
          style: TextStyles.bold19,
        ),
        const Spacer(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Container(
            height: 31,
            width: 44,
            decoration: BoxDecoration(
                border: Border.all(color: const Color(0xffcacece66)),
                borderRadius: BorderRadius.circular(4)),
            child: SvgPicture.asset('assets/images/arrow-swap-horizontal.svg'),
          ),
        )
      ],
    );
  }
}
