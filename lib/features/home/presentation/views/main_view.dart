import 'package:flutter/material.dart';
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomBottomNavigationBar(
        selectedIndex: currentViewIndex,
        onItemTaped: (index) {
          currentViewIndex = index;
          setState(() {});
        },
      ),
      body: MainViewBody(
        currentViewIndex: currentViewIndex,
      ),
    );
  }
}

class MainViewBody extends StatelessWidget {
  const MainViewBody({
    super.key,
    required this.currentViewIndex,
  });
  final int currentViewIndex;
  @override
  Widget build(BuildContext context) {
    return IndexedStack(
      index: currentViewIndex,
      children: const [
        HomeView(),
        ProductsView(),
        //CartView(),
      ],
    );
  }
}
