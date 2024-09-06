import 'package:flutter/material.dart';
import 'package:fruits_app/core/widgets/custom_button.dart';
import 'package:fruits_app/core/widgets/custom_text_field.dart';
import 'package:fruits_app/features/auth/presentation/widgets/custom_account_state.dart';
import 'package:fruits_app/features/auth/presentation/widgets/termes_and_condition.dart';

class SignUpViewBody extends StatelessWidget {
  const SignUpViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              const SizedBox(height: 16),
              const CustomTextField(
                  hintText: 'الاسم كامل', textInputType: TextInputType.name),
              const SizedBox(height: 16),
              const CustomTextField(
                  hintText: 'البريد الإلكتروني',
                  textInputType: TextInputType.emailAddress),
              const SizedBox(height: 16),
              const CustomTextField(
                  suffexIcon: Icon(
                    Icons.remove_red_eye,
                    color: Color(0xffC9CECF),
                  ),
                  hintText: 'كلمة المرور',
                  textInputType: TextInputType.visiblePassword),
              const SizedBox(height: 16),
              const TermsAndConditionsWidget(),
              const SizedBox(height: 30),
              CustomButton(
                  text: 'إنشاء حساب جديد',
                  onPressed: () {
                    Navigator.pop(context);
                  }),
              const SizedBox(height: 26),
              CustomAccountState(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  text1: 'تمتلك حساب بالفعل؟',
                  text2: 'تسجيل دخول')
            ],
          ),
        ),
      ),
    );
  }
}
