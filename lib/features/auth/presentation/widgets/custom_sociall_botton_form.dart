import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_app/core/utils/app_images.dart';
import 'package:fruits_app/features/auth/presentation/cubits/sign_in_cubit/signin_cubit.dart';
import 'package:fruits_app/features/auth/presentation/widgets/social_login_button.dart';

class CustomSocialLoginForm extends StatelessWidget {
  const CustomSocialLoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SocialLoginButton(
          image: Assets.imagesGoogleIcon,
          title: 'تسجيل بواسطة جوجل',
          onPressed: () {
            context.read<SigninCubit>().signInWithGoogle();
          },
        ),
        const SizedBox(height: 16),
        SocialLoginButton(
          image: Assets.imagesAppleIcon,
          title: 'تسجيل بواسطة أبل',
          onPressed: () {},
        ),
        const SizedBox(height: 16),
        SocialLoginButton(
          image: Assets.imagesFacebokIcon,
          title: 'تسجيل بواسطة فيسبوك',
          onPressed: () {
            context.read<SigninCubit>().signInWithFacebook();
          },
        ),
      ],
    );
  }
}
