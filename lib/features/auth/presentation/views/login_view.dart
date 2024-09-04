import 'package:flutter/material.dart';
import 'package:fruits_app/core/widgets/custom_app_bar.dart';
import 'package:fruits_app/features/auth/presentation/widgets/login_view_body.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});
  static const routeName = 'Login';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: buildAppBar(context, title: 'تسجيل دخول'),
        body: const LoginViewBody());
  }
}
