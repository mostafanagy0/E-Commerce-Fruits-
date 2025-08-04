import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_app/core/widgets/best_seller_grid_view.dart';
import 'package:fruits_app/core/widgets/custom_app_par.dart';
import 'package:fruits_app/core/widgets/custom_search_text_filed.dart';
import 'package:fruits_app/features/home/presentation/cubit/cubit/get_product_cubit.dart';
import 'package:fruits_app/features/home/presentation/widgets/products_header_widget.dart';

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
            BestSellerGridViewBlocbuilder(),
          ],
        ),
      ),
    );
  }
}

class BestSellerGridViewBlocbuilder extends StatelessWidget {
  const BestSellerGridViewBlocbuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetProductCubit, GetProductState>(
      builder: (context, state) {
        if (state is GetProductLoding) {
          return const SliverToBoxAdapter(
            child: CircularProgressIndicator(),
          );
        } else if (state is GetProductFailure) {
          return SliverToBoxAdapter(
            child: Text(state.errorMessage),
          );
        } else if (state is GetProductSucces) {
          return BestSellerGridView(
            productModels: state.products,
          );
        }

        return const SliverToBoxAdapter(
          child: SizedBox.shrink(),
        );
      },
    );
  }
}
