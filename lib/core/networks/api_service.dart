import 'package:dio/dio.dart';
import 'package:fruits_app/core/networks/api_constants.dart';
import 'package:fruits_app/features/auth/data/models/login_request_model.dart';
import 'package:fruits_app/features/auth/data/models/login_response_model.dart';
import 'package:fruits_app/features/auth/data/models/signup_request_model.dart';
import 'package:fruits_app/features/auth/data/models/signup_response_model.dart';
import 'package:retrofit/retrofit.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @POST(ApiConstants.loginUrl)
  Future<LoginResponseModel> login(
    @Body() LoginRequestModel loginRequestModel,
  );
  @POST(ApiConstants.signupUrl)
  Future<SignUpResponseModel> signup(
    @Body() SignupRequestModel signUpRequestModel,
  );
}
