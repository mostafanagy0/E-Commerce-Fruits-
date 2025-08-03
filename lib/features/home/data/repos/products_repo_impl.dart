// lib/features/home/data/repositories/products_repo_impl.dart

import 'package:dartz/dartz.dart';
import 'package:fruits_app/core/errors/failures.dart';
import 'package:fruits_app/core/models/product_model.dart';
import 'package:fruits_app/features/home/data/data_source/products_remote_data_source.dart';
import 'package:fruits_app/features/home/domain/repo/products_repo.dart';

class ProductsRepoImpl extends ProductsRepo {
  final ProductsRemoteDataSource remoteDataSource;

  ProductsRepoImpl({required this.remoteDataSource});

  @override
  Future<Either<Failures, List<ProductModel>>> getProducts() async {
    try {
      final result = await remoteDataSource.getProducts();
      return Right(result);
    } catch (e) {
      return Left(ServerFailure('Server failure $e'));
    }
  }
}
