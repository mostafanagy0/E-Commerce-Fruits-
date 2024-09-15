import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_app/core/helper_funcitons/functions/get_it.dart';
import 'package:fruits_app/core/widgets/custom_app_bar.dart';
import 'package:fruits_app/features/auth/domain/repos/auth_repo.dart';
import 'package:fruits_app/features/auth/presentation/cubits/sign_in_cubit/signin_cubit.dart';
import 'package:fruits_app/features/auth/presentation/widgets/signin_view_body_bloc_consumer.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});
  static const routeName = 'Login';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SigninCubit(getIt.get<AuthRepo>()),
      child: Scaffold(
          appBar: buildAppBar(context, title: 'تسجيل دخول'),
          body: const SigninViewBodyBlocConsumer()),
    );
  }
}
