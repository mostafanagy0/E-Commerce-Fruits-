import 'package:flutter/material.dart';
import 'package:fruits_app/core/widgets/custom_search_text_filed.dart';
import 'package:fruits_app/features/home/presentation/widgets/custom_hohme_app_bar.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: CustomScrollView(
        slivers: [
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
        ],
      ),
    );
  }
}
