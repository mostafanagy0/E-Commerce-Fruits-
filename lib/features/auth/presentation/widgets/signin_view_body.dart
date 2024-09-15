import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_app/core/helper_funcitons/functions/navigation.dart';
import 'package:fruits_app/core/widgets/custom_button.dart';
import 'package:fruits_app/core/widgets/custom_text_field.dart';
import 'package:fruits_app/core/widgets/password_field.dart';
import 'package:fruits_app/features/auth/presentation/cubits/sign_in_cubit/signin_cubit.dart';
import 'package:fruits_app/features/auth/presentation/views/signup_view.dart';
import 'package:fruits_app/features/auth/presentation/widgets/custom_account_state.dart';
import 'package:fruits_app/features/auth/presentation/widgets/custom_forget_password_text.dart';
import 'package:fruits_app/features/auth/presentation/widgets/custom_sociall_botton_form.dart';
import 'package:fruits_app/features/auth/presentation/widgets/or_divider.dart';

class SignInViewBody extends StatefulWidget {
  const SignInViewBody({super.key});

  @override
  State<SignInViewBody> createState() => _SignInViewBodyState();
}

class _SignInViewBodyState extends State<SignInViewBody> {
  late String email, passWord;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            autovalidateMode: autovalidateMode,
            child: Column(
              children: [
                const SizedBox(height: 24),
                CustomTextFormField(
                  onSaved: (value) {
                    email = value!;
                  },
                  hintText: 'البريد الالكتروني',
                  textInputType: TextInputType.emailAddress,
                ),
                const SizedBox(height: 16),
                PasswordField(
                  onSaved: (value) {
                    passWord = value!;
                  },
                ),
                const SizedBox(height: 16),
                const CustomForgetPasswordText(),
                const SizedBox(height: 33),
                CustomButton(
                  text: 'تسجيل دخول',
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      formKey.currentState!.save();
                      context
                          .read<SigninCubit>()
                          .signInWithEmailAndPassword(email, passWord);
                    } else {
                      autovalidateMode = AutovalidateMode.always;
                      setState(() {});
                    }
                  },
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
      ),
    );
  }
}
