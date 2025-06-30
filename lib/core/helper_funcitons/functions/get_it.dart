import 'package:dio/dio.dart';
import 'package:fruits_app/core/networks/api_service.dart';
import 'package:fruits_app/core/networks/dio_factory.dart';
import 'package:fruits_app/features/auth/data/repos/auth_repo.dart';
import 'package:fruits_app/features/auth/data/repos/auth_tepo_impl.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupGetIt() {
  //dio & api service
  Dio dio = DioFactory.getDio();
  getIt.registerLazySingleton<Dio>(() => dio);
  getIt.registerSingleton<ApiService>(ApiService(dio));

  getIt.registerSingleton<AuthRepo>(AuthRepoImpl(
    getIt<ApiService>(),
  ));
  // getIt.registerSingleton<ProductRepo>(ProductRepoImp(
  //   getIt<DataBaseService>(),
  // ));
}
