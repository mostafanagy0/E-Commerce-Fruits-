// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruits_app/constants.dart';
import 'package:fruits_app/core/helper_funcitons/functions/navigation.dart';
import 'package:fruits_app/core/services/shered_ferfernces_singleton.dart';
import 'package:fruits_app/core/utils/app_images.dart';
import 'package:fruits_app/features/auth/presentation/views/signin_view.dart';
import 'package:fruits_app/features/onBording/presentation/views/on_bording_view.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  @override
  void initState() {
    excuteNaviagtion();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SvgPicture.asset(Assets.imagesPlant),
          ],
        ),
        SvgPicture.asset(Assets.imagesLogo),
        SvgPicture.asset(
          Assets.imagesIconBottom,
          fit: BoxFit.fill,
        )
      ],
    );
  }

  void excuteNaviagtion() {
    bool isOnBordingVisited = Prefs.getBool(kIsOnBordingVisited);
    Future.delayed(
      const Duration(seconds: 3),
      () {
        if (isOnBordingVisited) {
          customPushReplacementNavigaton(context, const SignInView());
        } else {
          customPushReplacementNavigaton(context, OnBordingView.routeName);
        }
      },
    );
  }
}
