import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_app/core/helper_funcitons/functions/build_snack_bar.dart';
import 'package:fruits_app/core/helper_funcitons/functions/navigation.dart';
import 'package:fruits_app/core/widgets/custom_progres_hud.dart';
import 'package:fruits_app/features/auth/presentation/cubits/sign_in_cubit/signin_cubit.dart';
import 'package:fruits_app/features/auth/presentation/widgets/signin_view_body.dart';
import 'package:fruits_app/features/home/presentation/views/home_view.dart';
import 'package:fruits_app/features/home/presentation/views/main_view.dart';

class SigninViewBodyBlocConsumer extends StatelessWidget {
  const SigninViewBodyBlocConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SigninCubit, SigninState>(
      listener: (context, state) {
        if (state is SigninSuccess) {
          customPushReplacementNavigaton(context, const MainView());
        }
        if (state is Signinfailure) {
          return buildSnackBar(context, state.message);
        }
      },
      builder: (context, state) {
        return CustomProgressHud(
          inAsyncCall: state is SigninLoding ? true : false,
          child: const SignInViewBody(),
        );
      },
    );
  }
}
