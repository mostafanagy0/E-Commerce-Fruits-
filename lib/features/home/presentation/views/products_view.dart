import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruits_app/core/utils/app_images.dart';
import 'package:fruits_app/core/utils/app_text_style.dart';
import 'package:fruits_app/core/widgets/best_seller_grid_view.dart';
import 'package:fruits_app/core/widgets/custom_app_par.dart';
import 'package:fruits_app/core/widgets/custom_search_text_filed.dart';

class ProductsView extends StatelessWidget {
  const ProductsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(title: 'المنتجات', context, showBackButton: false),
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(child: CustomSearchTextFiled()),
            SliverToBoxAdapter(child: SizedBox(height: 16)),
            SliverToBoxAdapter(child: ProductsHeaderWidget()),
            SliverToBoxAdapter(child: SizedBox(height: 16)),
            BestSellerGridView(),
          ],
        ),
      ),
    );
  }
}

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
            child: SvgPicture.asset(Assets.imagesArrowSwapHorizontal),
          ),
        )
      ],
    );
  }
}
