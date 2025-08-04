import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_app/core/helper_funcitons/functions/get_it.dart';
import 'package:fruits_app/features/home/presentation/cubit/cubit/get_product_cubit.dart';
import 'package:fruits_app/features/home/presentation/views/home_view.dart';
import 'package:fruits_app/features/home/presentation/views/products_view.dart';
import 'package:fruits_app/features/home/presentation/widgets/custom_bottom_navigation_bar.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});
  static const routeName = 'HomeView';

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  int currentViewIndex = 0;

  late final List<Widget> views;

  @override
  void initState() {
    super.initState();
    views = [
      const HomeView(),
      BlocProvider(
        create: (context) => getIt<GetProductCubit>()..fetchProducts(),
        child: const ProductsView(),
      ),
      // BlocProvider(
      //   create: (context) => getIt<GetCartCubit>()..getCartItems(),
      //   child: const CartView(),
      // ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomBottomNavigationBar(
        selectedIndex: currentViewIndex,
        onItemTaped: (index) {
          setState(() => currentViewIndex = index);
        },
      ),
      body: IndexedStack(
        index: currentViewIndex,
        children: views,
      ),
    );
  }
}
