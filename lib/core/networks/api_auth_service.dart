import 'package:dio/dio.dart';
import 'package:fruits_app/core/networks/api_constants.dart';
import 'package:fruits_app/features/auth/data/models/login_request_model.dart';
import 'package:fruits_app/features/auth/data/models/login_response_model.dart';
import 'package:fruits_app/features/auth/data/models/signup_request_model.dart';
import 'package:fruits_app/features/auth/data/models/signup_response_model.dart';
import 'package:retrofit/retrofit.dart';

part 'api_auth_service.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class ApiAuthService {
  factory ApiAuthService(Dio dio, {String baseUrl}) = _ApiAuthService;

  @POST(ApiConstants.loginUrl)
  Future<LoginResponseModel> login(
    @Body() LoginRequestModel loginRequestModel,
  );
  @POST(ApiConstants.signupUrl)
  Future<SignUpResponseModel> signup(
    @Body() SignupRequestModel signUpRequestModel,
  );
}
