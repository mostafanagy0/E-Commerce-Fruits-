import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruits_app/core/errors/exce/Exceptions.dart';

class FirebaseAuthService {
  Future<User> CreateUserWithEmailAndPassWord(
      {required String email, required String passWord}) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: passWord,
      );
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        throw CustomException(message: 'The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        throw CustomException(
            message: 'The account already exists for that email.');
      } else {
        throw CustomException(
            message: 'An Error Occourred , Pleace Try Again Later');
      }
    } catch (e) {
      throw CustomException(
          message: 'An Error Occourred , Pleace Try Again Later');
    }
  }
}
