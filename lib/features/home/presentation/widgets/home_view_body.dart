import 'package:flutter/material.dart';
import 'package:fruits_app/core/widgets/best_seller_grid_view.dart';
import 'package:fruits_app/core/widgets/custom_search_text_filed.dart'
    show CustomSearchTextFiled;
import 'package:fruits_app/features/home/presentation/widgets/best_seller_item_header.dart';
import 'package:fruits_app/features/home/presentation/widgets/custom_hohme_app_bar.dart';
import 'package:fruits_app/features/home/presentation/widgets/featured_list.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({
    super.key,
  });

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  @override
  void initState() {
    // context
    //     .read<ProductsCubit>()
    //     .getBestSellingProducts(); // Fetch products when the view is initialized
    // super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: CustomScrollView(slivers: [
        SliverToBoxAdapter(
          child: SizedBox(height: 16),
        ),
        SliverToBoxAdapter(
          child: CustomHomeAppBar(),
        ),
        SliverToBoxAdapter(child: SizedBox(height: 16)),
        SliverToBoxAdapter(
          child: CustomSearchTextFiled(),
        ),
        SliverToBoxAdapter(child: SizedBox(height: 12)),
        SliverToBoxAdapter(
          child: FeaturedList(),
        ),
        SliverToBoxAdapter(child: SizedBox(height: 12)),
        SliverToBoxAdapter(
          child: BestSellerItemHeader(),
        ),
        SliverToBoxAdapter(child: SizedBox(height: 12)),
        BestSellerGridView()
      ]),
    );
  }
}
