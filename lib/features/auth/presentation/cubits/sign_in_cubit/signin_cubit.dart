import 'package:bloc/bloc.dart';
import 'package:fruits_app/features/auth/data/models/login_request_model.dart';
import 'package:fruits_app/features/auth/data/repos/auth_repo.dart';
import 'package:fruits_app/features/auth/domain/entites/uesr_entite.dart';
import 'package:meta/meta.dart';

part 'signin_state.dart';

class SigninCubit extends Cubit<SigninState> {
  SigninCubit(this.authRepo) : super(SigninInitial());
  final AuthRepo authRepo;
  Future<void> signInWithEmailAndPassword(String email, String passWord) async {
    emit(SigninLoding());
    final result = await authRepo.loginWithEmailAndPassword(
      LoginRequestModel(
        email: email,
        password: passWord,
      ),
    );
    result.fold(
        (failure) => emit(
              Signinfailure(message: failure.message),
            ),
        (userEntity) => emit(
              SigninSuccess(uesrEntity: userEntity),
            ));
  }

  // Future<void> signInWithGoogle() async {
  //   emit(SigninLoding());
  //   final result = await authRepo.signInWithGoogle();
  //   result.fold(
  //       (failure) => emit(
  //             Signinfailure(message: failure.message),
  //           ),
  //       (uesrEntite) => emit(SigninSuccess(uesrEntity: uesrEntite)));
  // }

  // Future<void> signInWithFacebook() async {
  //   emit(SigninLoding());
  //   final result = await authRepo.signInWithFacebook();
  //   result.fold(
  //       (failure) => emit(
  //             Signinfailure(message: failure.message),
  //           ),
  //       (UesrEntite) => emit(SigninSuccess(uesrEntity: UesrEntite)));
  // }
}
