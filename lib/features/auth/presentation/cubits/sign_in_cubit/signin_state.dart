part of 'signin_cubit.dart';

@immutable
sealed class SigninState {}

final class SigninInitial extends SigninState {}

final class SigninLoding extends SigninState {}

final class SigninSuccess extends SigninState {
  final UserEntity uesrEntity;

  SigninSuccess({required this.uesrEntity});
}

final class Signinfailure extends SigninState {
  final String message;

  Signinfailure({required this.message});
}
