import 'package:flutter/material.dart';
import 'package:fruits_app/core/helper_funcitons/functions/navigation.dart';
import 'package:fruits_app/core/widgets/custom_button.dart';
import 'package:fruits_app/core/widgets/custom_text_field.dart';
import 'package:fruits_app/features/auth/presentation/views/signup_view.dart';
import 'package:fruits_app/features/auth/presentation/widgets/custom_account_state.dart';
import 'package:fruits_app/features/auth/presentation/widgets/custom_forget_password_text.dart';
import 'package:fruits_app/features/auth/presentation/widgets/custom_sociall_botton_form.dart';
import 'package:fruits_app/features/auth/presentation/widgets/or_divider.dart';

class SignInViewBody extends StatelessWidget {
  const SignInViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 24),
              const CustomTextFormField(
                hintText: 'البريد الالكتروني',
                textInputType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 16),
              const CustomTextFormField(
                hintText: 'كلمه المرور',
                textInputType: TextInputType.visiblePassword,
                suffexIcon: Icon(
                  Icons.remove_red_eye,
                  color: Color(0xffC9CECF),
                ),
              ),
              const SizedBox(height: 16),
              const CustomForgetPasswordText(),
              const SizedBox(height: 33),
              CustomButton(
                text: 'تسجيل دخول',
                onPressed: () {},
              ),
              const SizedBox(height: 33),
              CustomAccountState(
                  onTap: () {
                    customPushNavigaton(context, const SignupView());
                  },
                  text1: 'لا تمتلك حساب ؟',
                  text2: 'قم بانشاء حساب'),
              const SizedBox(height: 16),
              const OrDivider(),
              const SizedBox(height: 16),
              const CustomSocialLoginForm()
            ],
          ),
        ),
      ),
    );
  }
}
