// import 'package:dio/dio.dart';
// import 'package:fruits_app/features/auth/data/models/login_request_model.dart';
// import 'package:fruits_app/features/auth/data/models/login_response_model.dart';
// import 'package:fruits_app/features/auth/data/models/signup_request_model.dart';
// import 'package:fruits_app/features/auth/data/models/signup_response_model.dart';
// import 'package:fruits_app/core/networks/api_constants.dart';

// class ApiAuthService {
//   final Dio _dio;

//   ApiAuthService(this._dio);

//   Future<LoginResponseModel> login(LoginRequestModel requestModel) async {
//     try {
//       final response = await _dio.post(
//         ApiConstants.loginUrl,
//         data: requestModel.toJson(),
//       );

//       return LoginResponseModel.fromJson(response.data);
//     } on DioException catch (e) {
//       throw Exception(_handleDioError(e));
//     }
//   }

//   Future<SignupResponseModel> signUp(SignupRequestModel requestModel) async {
//     try {
//       final response = await _dio.post(
//         ApiConstants.signupUrl,
//         data: requestModel.toJson(),
//       );

//       return SignupResponseModel.fromJson(response.data);
//     } on DioException catch (e) {
//       throw Exception(_handleDioError(e));
//     }
//   }

//   String _handleDioError(DioException e) {
//     if (e.response != null && e.response?.data != null) {
//       return e.response?.data['message'] ?? 'حدث خطأ أثناء الاتصال بالخادم.';
//     } else {
//       return 'حدث خطأ في الاتصال. تأكد من اتصالك بالإنترنت.';
//     }
//   }
// }
