import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruits_app/core/errors/exce/Exceptions.dart';

class FirebaseAuthService {
  Future<User> createUserWithEmailAndPassWord(
      {required String email, required String passWord}) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: passWord,
      );
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      log('Exeption in FirebaseAuthService.createUserWithEmailAndPassword${e.toString()}');
      if (e.code == 'weak-password') {
        throw CustomException(message: 'الرقم السري ضعيف جداً.');
      } else if (e.code == 'email-already-in-use') {
        throw CustomException(
            message: 'لقد قمت بالتسجيل مسبقاً. الرجاء تسجيل الدخول.');
      } else if (e.code == 'network-request-failed') {
        throw (CustomException(message: 'تأكد من اتصالك بالانترنت'));
      } else {
        throw CustomException(
            message: 'لقد حدث خطأ ما. الرجاء المحاولة مرة اخرى.');
      }
    } catch (e) {
      log('Exeption in FirebaseAuthService.createUserWithEmailAndPassword${e.toString()}');
      throw CustomException(
          message: 'لقد حدث خطأ ما. الرجاء المحاولة مرة اخرى.');
    }
  }

  Future<User> signInWithEmailAndPassword(
      {required String email, required String passWord}) async {
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: passWord);
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        throw (CustomException(
            message: 'البريد الالكتروني او الرقم السري غير صحيح '));
      } else if (e.code == 'wrong-password') {
        throw (CustomException(
            message: 'البريد الالكتروني او الرقم السري غير صحيح '));
      } else if (e.code == 'network-request-failed') {
        throw (CustomException(message: 'تأكد من اتصالك بالانترنت'));
      } else {
        throw CustomException(
            message: 'لقد حدث خطأ ما. الرجاء المحاولة مرة اخرى.');
      }
    } catch (e) {
      log('Exeption in FirebaseAuthService.signInWithEmailAndPassword${e.toString()}');
      throw CustomException(
          message: 'لقد حدث خطأ ما. الرجاء المحاولة مرة اخرى.');
    }
  }
}
