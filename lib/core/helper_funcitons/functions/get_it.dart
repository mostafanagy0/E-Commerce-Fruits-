import 'package:dio/dio.dart';
import 'package:fruits_app/core/networks/api_auth_service.dart';
import 'package:fruits_app/core/networks/api_get_products_service.dart';
// Core
import 'package:fruits_app/core/networks/dio_factory.dart';
// Auth Feature
import 'package:fruits_app/features/auth/data/repos/auth_repo.dart';
import 'package:fruits_app/features/auth/data/repos/auth_tepo_impl.dart';
import 'package:fruits_app/features/auth/presentation/cubits/sign_in_cubit/signin_cubit.dart';
// Products Feature
import 'package:fruits_app/features/home/data/data_source/products_remote_data_source.dart';
import 'package:fruits_app/features/home/data/data_source/products_remote_data_source_impl.dart';
import 'package:fruits_app/features/home/data/repos/products_repo_impl.dart';
import 'package:fruits_app/features/home/domain/repo/products_repo.dart';
import 'package:fruits_app/features/home/presentation/cubit/cubit/get_product_cubit.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupGetIt() {
  // 🔧 Dio
  getIt.registerLazySingleton<Dio>(() => DioFactory.getDio());

  // 🌐 Services
  getIt.registerLazySingleton(() => ApiAuthService(getIt()));
  getIt.registerLazySingleton(() => ApiGetProductsService(getIt()));

  // 🔐 Auth Feature
  getIt.registerLazySingleton<AuthRepo>(() => AuthRepoImpl(getIt()));
  getIt.registerFactory(() => SigninCubit(getIt()));

  // 🛒 Products Feature
  getIt.registerLazySingleton<ProductsRemoteDataSource>(
      () => ProductsRemoteDataSourceImpl(apiGetProductsService: getIt()));
  getIt.registerLazySingleton<ProductsRepo>(
      () => ProductsRepoImpl(remoteDataSource: getIt()));
  getIt.registerFactory(() => GetProductCubit(getIt()));
}
