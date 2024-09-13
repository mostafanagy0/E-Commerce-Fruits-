import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruits_app/features/auth/domain/entites/uesr_entite.dart';

class UserModel extends UesrEntite {
  UserModel({required super.name, required super.email, required super.uId});

  // we are created model from 'User' that return from firebase
  factory UserModel.fromFirebaseUser(User user) {
    return UserModel(
        name: user.displayName ?? '', email: user.email ?? '', uId: user.uid);
  }
}
