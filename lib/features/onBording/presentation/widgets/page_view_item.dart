import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruits_app/constants.dart';
import 'package:fruits_app/core/services/shered_ferfernces_singleton.dart';
import 'package:fruits_app/core/utils/app_text_style.dart';
import 'package:fruits_app/features/auth/presentation/views/login_view.dart';

class PageViewItem extends StatelessWidget {
  const PageViewItem(
      {super.key,
      required this.image,
      required this.backgroundImage,
      required this.subTitel,
      required this.titel,
      required this.isVisible});
  final String image, backgroundImage;
  final String subTitel;
  final Widget titel;
  final bool isVisible;
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
                Visibility(
                  visible: isVisible,
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: GestureDetector(
                      onTap: () {
                        Prefs.setBool(kIsOnBordingVisited, true);
                        Navigator.of(context)
                            .pushReplacementNamed(LoginView.routeName);
                      },
                      child: Text(
                        'تخط',
                        style: TextStyles.regular13
                            .copyWith(color: const Color(0xFF949D9E)),
                      ),
                    ),
                  ),
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
            padding: const EdgeInsets.symmetric(horizontal: 37),
            child: Text(
              subTitel,
              textAlign: TextAlign.center,
              style: TextStyles.semiBold13,
            ),
          )
        ],
      ),
    );
  }
}
