import 'package:flutter/material.dart';
import 'package:fruits_app/core/widgets/custom_button.dart';
import 'package:fruits_app/features/onBording/presentation/widgets/custom_dots_indicator.dart';
import 'package:fruits_app/features/onBording/presentation/widgets/on_bording_page_view.dart';

class OnBordingViewBody extends StatelessWidget {
  const OnBordingViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Expanded(
          child: OnBordingPageView(),
        ),
        const CustomDotsIndicator(),
        const SizedBox(
          height: 29,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: CustomButton(
            text: 'ابدأ الان',
            onPressed: () {},
          ),
        ),
        const SizedBox(
          height: 43,
        )
      ],
    );
  }
}
