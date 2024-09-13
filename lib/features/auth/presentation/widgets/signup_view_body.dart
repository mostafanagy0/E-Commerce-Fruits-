import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_app/core/widgets/custom_button.dart';
import 'package:fruits_app/core/widgets/custom_text_field.dart';
import 'package:fruits_app/core/widgets/password_field.dart';
import 'package:fruits_app/features/auth/presentation/cubits/sign_up_cubit/sign_up_cubit.dart';
import 'package:fruits_app/features/auth/presentation/widgets/custom_account_state.dart';
import 'package:fruits_app/features/auth/presentation/widgets/termes_and_condition.dart';

class SignUpViewBody extends StatefulWidget {
  const SignUpViewBody({super.key});

  @override
  State<SignUpViewBody> createState() => _SignUpViewBodyState();
}

class _SignUpViewBodyState extends State<SignUpViewBody> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  late String name, passWord, email;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Form(
            key: formKey,
            autovalidateMode: autovalidateMode,
            child: Column(
              children: [
                const SizedBox(height: 16),
                CustomTextFormField(
                    onSaved: (value) {
                      name = value!;
                    },
                    hintText: 'الاسم كامل',
                    textInputType: TextInputType.name),
                const SizedBox(height: 16),
                CustomTextFormField(
                    onSaved: (value) {
                      email = value!;
                    },
                    hintText: 'البريد الإلكتروني',
                    textInputType: TextInputType.emailAddress),
                const SizedBox(height: 16),
                PasswordField(
                  onSaved: (value) {
                    passWord = value!;
                  },
                ),
                const SizedBox(height: 16),
                const TermsAndConditionsWidget(),
                const SizedBox(height: 30),
                CustomButton(
                    text: 'إنشاء حساب جديد',
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        formKey.currentState!.save();
                        context
                            .read<SignUpCubit>()
                            .createUserWithEmailAndPassWord(
                                email, passWord, name);
                      } else {
                        setState(() {
                          autovalidateMode = AutovalidateMode.always;
                        });
                      }
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
      ),
    );
  }
}
