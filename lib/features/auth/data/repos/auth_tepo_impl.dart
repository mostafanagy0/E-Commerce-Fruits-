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

      var uesrEntite = await getUserData(uId: user.uid);
      return right(
        uesrEntite,
      );
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
    User? user;
    try {
      user = await firebaseAuthService.signInWithGoogle();
      var uesrEntite = UserModel.fromFirebaseUser(user);
      var isUsserExits = await dataBaseService.checkIfDataExists(
          documentId: user.uid, path: BackendEndpoints.isUsserExits);
      if (isUsserExits) {
        await getUserData(uId: user.uid);
      } else {
        await addUserData(user: uesrEntite);
      }
      return right(uesrEntite);
    } catch (e) {
      if (user != null) {
        await firebaseAuthService.deleteUser();
      }
      log('Exiption in signInWithGoogle ${e.toString()}');
      return left(ServerFailure('لقد حدث خطأ ما. الرجاء المحاولة مرة اخرى.'));
    }
  }

  @override
  Future<Either<Failures, UesrEntite>> signInWithFacebook() async {
    User? user;
    try {
      user = await firebaseAuthService.signInWithFacebook();
      var uesrEntite = UserModel.fromFirebaseUser(user);
      await addUserData(user: uesrEntite);
      return right(uesrEntite);
    } catch (e) {
      if (user != null) {
        await firebaseAuthService.deleteUser();
      }
      log('Exiption in signInWithFacebook ${e.toString()}');
      return left(ServerFailure('لقد حدث خطأ ما. الرجاء المحاولة مرة اخرى.'));
    }
  }

  @override
  Future addUserData({required UesrEntite user}) async {
    await dataBaseService.addData(
        path: BackendEndpoints.addUserData,
        data: user.toMap(),
        documentId: user.uId);
  }

  @override
  Future<UesrEntite> getUserData({required String uId}) async {
    var userData = await dataBaseService.getData(
        path: BackendEndpoints.getUserData, documentId: uId);
    return UserModel.fromjson(userData);
  }
}
