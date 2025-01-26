import 'package:flutter/material.dart';
import 'package:fruits_app/core/widgets/custom_app_par.dart';
import 'package:fruits_app/features/best_selling_fruits/presentation/widgets/best_selling_view_body.dart';

class BestSellingView extends StatelessWidget {
  const BestSellingView({super.key});
  static const routeName = 'best_eelling_view';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, title: 'الأكثر مبيعًا'),
      body: const BestSellingViewBody(),
    );
  }
}
