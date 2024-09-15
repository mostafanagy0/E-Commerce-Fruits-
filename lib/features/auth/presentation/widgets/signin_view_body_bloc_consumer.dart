import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_app/core/widgets/custom_progres_hud.dart';
import 'package:fruits_app/features/auth/presentation/cubits/sign_in_cubit/signin_cubit.dart';
import 'package:fruits_app/features/auth/presentation/widgets/signin_view_body.dart';

class SigninViewBodyBlocConsumer extends StatelessWidget {
  const SigninViewBodyBlocConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SigninCubit, SigninState>(
      listener: (context, state) {},
      builder: (context, state) {
        return CustomProgressHud(
          inAsyncCall: state is SigninLoding ? true : false,
          child: const SignInViewBody(),
        );
      },
    );
  }
}
