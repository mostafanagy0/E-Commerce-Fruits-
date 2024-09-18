import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruits_app/core/errors/exce/Exceptions.dart';
import 'package:fruits_app/core/errors/failures.dart';
import 'package:fruits_app/core/services/database_service.dart';
import 'package:fruits_app/core/services/firebase_auth_service.dart';
import 'package:fruits_app/core/utils/backend_endpoints.dart';
import 'package:fruits_app/features/auth/data/models/user_model.dart';
import 'package:fruits_app/features/auth/domain/entites/uesr_entite.dart';
import 'package:fruits_app/features/auth/domain/repos/auth_repo.dart';

class AuthRepoImpl extends AuthRepo {
  final FirebaseAuthService firebaseAuthService;
  final DataBaseService dataBaseService;

  AuthRepoImpl(
      {required this.dataBaseService, required this.firebaseAuthService});
  @override
  Future<Either<Failures, UesrEntite>> createUserWithEmailAndPassWord(
      String email, String passWord, String name) async {
    User? user;
    try {
      user = await firebaseAuthService.createUserWithEmailAndPassWord(
          email: email, passWord: passWord);
      var uesrEntite = UesrEntite(name: name, email: email, uId: user.uid);
      await addUserData(user: uesrEntite);
      return right(uesrEntite);
    } on CustomException catch (e) {
      if (user != null) {
        await firebaseAuthService.deleteUser();
      }
      return left(
        ServerFailure(e.message),
      );
    } catch (e) {
      if (user != null) {
        await firebaseAuthService.deleteUser();
      }
      log('Exiption in createUserWithEmailAndPassWord ${e.toString()}');
      return left(ServerFailure('لقد حدث خطأ ما. الرجاء المحاولة مرة اخرى.'));
    }
  }

  @override
  Future<Either<Failures, UesrEntite>> signInWithEmailAndPassword(
      String email, String passWord) async {
    try {
      var user = await firebaseAuthService.signInWithEmailAndPassword(
          email: email, passWord: passWord);
      return right(UserModel.fromFirebaseUser(user));
    } on CustomException catch (e) {
      return left(
        ServerFailure(e.message),
      );
    } catch (e) {
      log('Exiption in signInWithEmailAndPassword ${e.toString()}');
      return left(ServerFailure('لقد حدث خطأ ما. الرجاء المحاولة مرة اخرى.'));
    }
  }

  @override
  Future<Either<Failures, UesrEntite>> signInWithGoogle() async {
    try {
      var user = await firebaseAuthService.signInWithGoogle();
      return right(UserModel.fromFirebaseUser(user));
    } catch (e) {
      log('Exiption in signInWithGoogle ${e.toString()}');
      return left(ServerFailure('لقد حدث خطأ ما. الرجاء المحاولة مرة اخرى.'));
    }
  }

  @override
  Future<Either<Failures, UesrEntite>> signInWithFacebook() async {
    try {
      var user = await firebaseAuthService.signInWithFacebook();
      return right(UserModel.fromFirebaseUser(user));
    } catch (e) {
      log('Exiption in signInWithFacebook ${e.toString()}');
      return left(ServerFailure('لقد حدث خطأ ما. الرجاء المحاولة مرة اخرى.'));
    }
  }

  @override
  Future addUserData({required UesrEntite user}) async {
    await dataBaseService.addData(
        path: BackendEndpoints.addUserData, data: user.toMap());
  }
}
