// ignore_for_file: non_constant_identifier_names

import 'package:dartz/dartz.dart';
import 'package:fruits_app/core/errors/failures.dart';
import 'package:fruits_app/features/auth/domain/entites/uesr_entite.dart';

abstract class AuthRepo {
  Future<Either<Failures, UesrEntite>> createUserWithEmailAndPassWord(
      String email, String passWord, String name);
  Future<Either<Failures, UesrEntite>> signInWithEmailAndPassword(
    String email,
    String passWord,
  );
  Future<Either<Failures, UesrEntite>> signInWithGoogle();
  Future<Either<Failures, UesrEntite>> signInWithFacebook();
}
