import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioFactory {
  DioFactory._();

  static Dio? dio;

  static Dio getDio() {
    Duration timeOut = const Duration(seconds: 50);

    if (dio == null) {
      dio = Dio(
        BaseOptions(
          connectTimeout: timeOut,
          receiveTimeout: timeOut,
          headers: {
            'Accept': 'application/json',
          },
        ),
      );
      addDioInterceptor();
      //  addDioHeaders();
      return dio!;
    } else {
      return dio!;
    }
  }

  // static Future<void> addDioHeaders() async {
  //   final token =
  //       await SharedPrefHelper.getSecuredString(SharedPrefKeys.authToken);
  //   dio?.options.headers = {
  //     'Accept': 'application/json',
  //     'Authorization': token.isNotEmpty ? 'Bearer $token' : null,
  //   };
  // }

  static void setTokenIntoHeaderAfterLogin(String token) {
    dio?.options.headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    };
  }

  static void addDioInterceptor() {
    dio?.interceptors.add(
      PrettyDioLogger(
        requestBody: true,
        requestHeader: true,
        responseHeader: true,
        responseBody: true,
      ),
    );
    dio?.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          if ((options.method == 'POST' &&
                  options.path.contains('process-image')) ||
              (options.method == 'PATCH' &&
                  options.path.contains('updateUserData'))) {
            options.contentType = Headers.multipartFormDataContentType;
            options.headers['Content-Disposition'] =
                'form-data; name="profileImage"; filename="image.jpg"';
          }
          print("Request headers: ${options.headers}");
          return handler.next(options);
        },
      ),
    );
  }
}
