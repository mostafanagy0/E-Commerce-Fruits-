import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_app/core/helper_funcitons/functions/build_snack_bar.dart';
import 'package:fruits_app/features/auth/presentation/cubits/sign_up_cubit/sign_up_cubit.dart';
import 'package:fruits_app/features/auth/presentation/widgets/signup_view_body.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class SignUpViewBodyBlocConsumer extends StatelessWidget {
  const SignUpViewBodyBlocConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignUpCubit, SignUpState>(
      listener: (context, state) {
        if (state is SignUpSuccess) {}
        if (state is SignUpFailure) {
          buildSnackBar(context, state.message);
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
            inAsyncCall: state is SignUpLoding ? true : false,
            child: const SignUpViewBody());
      },
    );
  }
}
