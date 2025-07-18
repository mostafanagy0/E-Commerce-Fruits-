import 'package:dartz/dartz.dart';
import 'package:fruits_app/core/errors/failures.dart';
import 'package:fruits_app/core/networks/api_auth_service.dart';
import 'package:fruits_app/features/auth/data/models/login_request_model.dart';
import 'package:fruits_app/features/auth/data/models/signup_request_model.dart';
import 'package:fruits_app/features/auth/data/repos/auth_repo.dart';
import 'package:fruits_app/features/auth/domain/entites/uesr_entite.dart';

class AuthRepoImpl implements AuthRepo {
  final ApiAuthService apiService;

  AuthRepoImpl(this.apiService);

  @override
  Future<Either<Failures, UserEntity>> loginWithEmailAndPassword(
      LoginRequestModel loginRequestModel) async {
    try {
      final response = await apiService.login(loginRequestModel);

      final userEntity = UserEntity(
        id: response.id,
        email: response.email,
        name: response.email.split('@').first,
        token: response.token,
      );

      return Right(userEntity);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failures, UserEntity>> signupWithEmailAndPassword(
      SignupRequestModel signupRequestModel) async {
    try {
      final response = await apiService.signup(signupRequestModel);

      final userEntity = UserEntity(
        id: '',
        email: signupRequestModel.email,
        name: signupRequestModel.fullName,
        token: null,
      );

      return Right(userEntity);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
