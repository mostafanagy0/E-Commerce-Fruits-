import 'package:flutter/material.dart';
import 'package:fruits_app/core/utils/app_images.dart';
import 'package:fruits_app/features/onBording/presentation/widgets/page_view_item.dart';

class OnBordingPageView extends StatelessWidget {
  const OnBordingPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return PageView(
      children: const [
        PageViewItem(
            image: Assets.imagesPageItemImage,
            backgroundImage: Assets.imagesPageItemBackgroundImage,
            subTitel:
                'اكتشف تجربة تسوق فريدة مع FruitHUB. استكشف مجموعتنا الواسعة من الفواكه الطازجة الممتازة واحصل على أفضل العروض والجودة العالية.',
            titel: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('مرحبًا بك في'),
                Text('HUB'),
                Text('Fruit'),
              ],
            )),
        PageViewItem(
            image: Assets.imagesPageItem2Image,
            backgroundImage: Assets.imagesPageItem2BackgroundImage,
            subTitel:
                'نقدم لك أفضل الفواكه المختارة بعناية. اطلع على التفاصيل والصور والتقييمات لتتأكد من اختيار الفاكهة المثالية',
            titel: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('ابحث وتسوق'),
              ],
            )),
      ],
    );
  }
}
