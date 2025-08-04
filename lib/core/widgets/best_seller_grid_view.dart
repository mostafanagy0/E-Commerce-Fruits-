import 'package:flutter/material.dart';
import 'package:fruits_app/core/models/product_model.dart';
import 'package:fruits_app/core/widgets/fruit_item.dart';

class BestSellerGridView extends StatelessWidget {
  const BestSellerGridView({super.key, required this.productModels});
  final List<ProductModel> productModels;
  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
      itemCount: productModels.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 163 / 214,
          mainAxisSpacing: 8,
          crossAxisSpacing: 16),
      itemBuilder: (context, index) {
        return FruitItem(
          productModel: productModels[index],
        );
      },
    );
  }
}
