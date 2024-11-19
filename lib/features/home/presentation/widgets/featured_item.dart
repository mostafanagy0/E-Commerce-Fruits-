import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart' as svg;
import 'package:fruits_app/core/utils/app_images.dart';
import 'package:fruits_app/core/utils/app_text_style.dart';
import 'package:fruits_app/features/home/presentation/widgets/featured_item_button.dart';

class FeaturedItem extends StatelessWidget {
  const FeaturedItem({super.key});

  @override
  Widget build(BuildContext context) {
    var itemWidth = MediaQuery.sizeOf(context).width - 32;
    return SizedBox(
      width: itemWidth,
      child: AspectRatio(
        aspectRatio: 324 / 158,
        child: Stack(
          children: [
            Positioned(
                top: 0,
                left: 0,
                bottom: 0,
                right: itemWidth * 0.4,
                child: SvgPicture.asset(
                  Assets.imagesPageItem2Image,
                  fit: BoxFit.fill,
                )),
            Container(
              width: itemWidth * 0.5,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(4),
                    topRight: Radius.circular(4)),
                image: DecorationImage(
                    image: svg.Svg(Assets.imagesGreenPicture),
                    fit: BoxFit.fill),
              ),
              child: Padding(
                padding: const EdgeInsets.only(right: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 25),
                    Text(
                      'عروض العيد',
                      style: TextStyles.regular13.copyWith(
                          fontWeight: FontWeight.w400, color: Colors.white),
                    ),
                    const Spacer(),
                    const Text(' خصم 25%', style: TextStyles.regular19),
                    const SizedBox(height: 7),
                    const SizedBox(height: 11),
                    FeaturedItemButton(
                      onPressed: () {},
                    ),
                    const SizedBox(
                      height: 30,
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
