import 'package:flutter/material.dart';
import 'package:fruits_app/core/widgets/custom_button.dart';
import 'package:fruits_app/features/onBording/presentation/widgets/custom_dots_indicator.dart';
import 'package:fruits_app/features/onBording/presentation/widgets/on_bording_page_view.dart';

class OnBordingViewBody extends StatefulWidget {
  const OnBordingViewBody({super.key});

  @override
  State<OnBordingViewBody> createState() => _OnBordingViewBodyState();
}

class _OnBordingViewBodyState extends State<OnBordingViewBody> {
  late PageController pageController;
  var currentPage = 0;
  @override
  void initState() {
    pageController = PageController();
    pageController.addListener(
      () {
        currentPage = pageController.page!.round();
        setState(() {});
      },
    );
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: OnBordingPageView(
            pageController: pageController,
          ),
        ),
        const CustomDotsIndicator(),
        const SizedBox(
          height: 29,
        ),
        Visibility(
          maintainAnimation: true,
          maintainSize: true,
          maintainState: true,
          visible: currentPage == 1 ? true : false,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: CustomButton(
              text: 'ابدأ الان',
              onPressed: () {},
            ),
          ),
        ),
        const SizedBox(
          height: 43,
        )
      ],
    );
  }
}
