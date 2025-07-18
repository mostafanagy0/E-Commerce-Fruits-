import 'package:dio/dio.dart';
import 'package:fruits_app/core/networks/api_auth_service.dart';
import 'package:fruits_app/core/networks/dio_factory.dart';
import 'package:fruits_app/features/auth/data/repos/auth_repo.dart';
import 'package:fruits_app/features/auth/data/repos/auth_tepo_impl.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupGetIt() {
  //dio & api service
  Dio dio = DioFactory.getDio();
  getIt.registerLazySingleton<Dio>(() => dio);
  getIt.registerSingleton<ApiAuthService>(ApiAuthService(dio));

  getIt.registerSingleton<AuthRepo>(AuthRepoImpl(
    getIt<ApiAuthService>(),
  ));
  // getIt.registerSingleton<ProductRepo>(ProductRepoImp(
  //   getIt<DataBaseService>(),
  // ));
}
