// ignore_for_file: non_constant_identifier_names

import 'package:dartz/dartz.dart';
import 'package:fruits_app/core/errors/failures.dart';
import 'package:fruits_app/features/auth/domain/entites/uesr_entite.dart';

abstract class AuthRepo {
  Future<Either<Failures, UesrEntity>> createUserWithEmailAndPassWord(
      String email, String passWord, String name);
  Future<Either<Failures, UesrEntity>> signInWithEmailAndPassword(
    String email,
    String passWord,
  );
  Future<Either<Failures, UesrEntity>> signInWithGoogle();
  Future<Either<Failures, UesrEntity>> signInWithFacebook();
  Future addUserData({required UesrEntity userEntity});
  Future saveUserData({required UesrEntity userEntity});
  Future<UesrEntity> getUserData({required String uId});
}
