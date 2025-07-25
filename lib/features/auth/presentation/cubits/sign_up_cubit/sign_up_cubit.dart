import 'package:bloc/bloc.dart';
import 'package:fruits_app/features/auth/data/models/signup_request_model.dart';
import 'package:fruits_app/features/auth/data/repos/auth_repo.dart';
import 'package:fruits_app/features/auth/domain/entites/uesr_entite.dart';
import 'package:meta/meta.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit(this.authRepo) : super(SignUpInitial());
  final AuthRepo authRepo;

  Future<void> createUserWithEmailAndPassWord(
      String email, String passWord, String name) async {
    emit(SignUpLoding());
    final result = await authRepo.signupWithEmailAndPassword(
      SignupRequestModel(
        email: email,
        password: passWord,
        fullName: name,
      ),
    );
    result.fold(
      (failure) => emit(
        SignUpFailure(message: failure.message),
      ),
      (uesrEntite) => emit(
        SignUpSuccess(uesrEntite: uesrEntite),
      ),
    );
  }
}
