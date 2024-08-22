import 'package:flutter/material.dart';
import 'package:fruits_app/features/onBording/presentation/widgets/on_bording_page_view.dart';

class OnBordingViewBody extends StatelessWidget {
  const OnBordingViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Expanded(child: OnBordingPageView()),
      ],
    );
  }
}
