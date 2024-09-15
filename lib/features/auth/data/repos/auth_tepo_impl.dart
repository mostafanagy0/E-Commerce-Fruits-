import 'dart:nativewrappers/_internal/vm/lib/developer.dart';

import 'package:dartz/dartz.dart';
import 'package:fruits_app/core/errors/exce/Exceptions.dart';
import 'package:fruits_app/core/errors/failures.dart';
import 'package:fruits_app/core/services/firebase_auth_service.dart';
import 'package:fruits_app/features/auth/data/models/user_model.dart';
import 'package:fruits_app/features/auth/domain/entites/uesr_entite.dart';
import 'package:fruits_app/features/auth/domain/repos/auth_repo.dart';

class AuthTepoImpl extends AuthRepo {
  final FirebaseAuthService firebaseAuthService;

  AuthTepoImpl({required this.firebaseAuthService});
  @override
  Future<Either<Failures, UesrEntite>> createUserWithEmailAndPassWord(
      String email, String passWord, String name) async {
    try {
      var user = await firebaseAuthService.createUserWithEmailAndPassWord(
          email: email, passWord: passWord);
      return right(UserModel.fromFirebaseUser(user));
    } on CustomException catch (e) {
      return left(
        ServerFailure(e.message),
      );
    } catch (e) {
      log('Exiption in createUserWithEmailAndPassWord ${e.toString()}');
      return left(ServerFailure('لقد حدث خطأ ما. الرجاء المحاولة مرة اخرى.'));
    }
  }

  @override
  Future<Either<Failures, UesrEntite>> signInWithEmailAndPassword(
      String email, String passWord, String name) async {
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
      return left(ServerFailure('An Error Occourred , Pleace Try Again Later'));
    }
  }
}
