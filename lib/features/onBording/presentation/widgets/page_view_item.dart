import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PageViewItem extends StatelessWidget {
  const PageViewItem(
      {super.key,
      required this.image,
      required this.backgroundImage,
      required this.subTitel,
      required this.titel});
  final String image, backgroundImage;
  final String subTitel;
  final Widget titel;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          SizedBox(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.5,
            child: Stack(
              children: [
                Positioned.fill(
                  child: SvgPicture.asset(
                    backgroundImage,
                    fit: BoxFit.fill,
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  left: 0,
                  child: SvgPicture.asset(image),
                ),
                const Padding(
                  padding: EdgeInsets.all(16),
                  child: Text('تخط'),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 64,
          ),
          titel,
          const SizedBox(
            height: 24,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              subTitel,
              textAlign: TextAlign.center,
            ),
          )
        ],
      ),
    );
  }
}