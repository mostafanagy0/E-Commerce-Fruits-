import 'package:flutter/material.dart';
import 'package:fruits_app/core/utils/app_colors.dart';
import 'package:fruits_app/core/utils/app_images.dart';
import 'package:fruits_app/core/utils/app_text_style.dart';
import 'package:fruits_app/features/onBording/presentation/widgets/page_view_item.dart';

class OnBordingPageView extends StatelessWidget {
  const OnBordingPageView({super.key, required this.pageController});
  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: pageController,
      children: [
        PageViewItem(
            isVisible: (pageController.hasClients
                    ? pageController.page!.round()
                    : 0) ==
                0,
            image: Assets.imagesPageItemImage,
            backgroundImage: Assets.imagesPageItemBackgroundImage,
            subTitel:
                'اكتشف تجربة تسوق فريدة مع FruitHUB. استكشف مجموعتنا الواسعة من الفواكه الطازجة الممتازة واحصل على أفضل العروض والجودة العالية.',
            titel: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'مرحبًا بك في',
                  style: TextStyles.bold23,
                ),
                Text(
                  ' Hub',
                  style: TextStyles.bold23
                      .copyWith(color: AppColors.secondryColor),
                ),
                Text(
                  'Fruit',
                  style:
                      TextStyles.bold23.copyWith(color: AppColors.primaryColor),
                ),
              ],
            )),
        PageViewItem(
            isVisible: (pageController.hasClients
                    ? pageController.page!.round()
                    : 0) !=
                0,
            image: Assets.imagesPageItem2Image,
            backgroundImage: Assets.imagesPageItem2BackgroundImage,
            subTitel:
                'نقدم لك أفضل الفواكه المختارة بعناية. اطلع على التفاصيل والصور والتقييمات لتتأكد من اختيار الفاكهة المثالية',
            titel: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('ابحث وتسوق'),
              ],
            )),
      ],
    );
  }
}
