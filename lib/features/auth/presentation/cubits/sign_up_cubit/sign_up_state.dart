part of 'sign_up_cubit.dart';

@immutable
sealed class SignUpState {}

final class SignUpInitial extends SignUpState {}

final class SignUpSuccess extends SignUpState {
  final UserEntity uesrEntite;

  SignUpSuccess({required this.uesrEntite});
}

final class SignUpLoding extends SignUpState {}

final class SignUpFailure extends SignUpState {
  final String message;

  SignUpFailure({required this.message});
}
