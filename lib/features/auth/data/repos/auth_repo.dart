// ignore_for_file: non_constant_identifier_names

import 'package:dartz/dartz.dart';
import 'package:fruits_app/core/errors/failures.dart';
import 'package:fruits_app/features/auth/data/models/login_request_model.dart';
import 'package:fruits_app/features/auth/data/models/signup_request_model.dart';
import 'package:fruits_app/features/auth/domain/entites/uesr_entite.dart';

abstract class AuthRepo {
  Future<Either<Failures, UserEntity>> signupWithEmailAndPassword(
      SignupRequestModel signupRequestModel);
  Future<Either<Failures, UserEntity>> loginWithEmailAndPassword(
      LoginRequestModel loginRequestModel);
}
