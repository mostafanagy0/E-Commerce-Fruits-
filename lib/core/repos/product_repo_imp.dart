import 'package:dartz/dartz.dart';
import 'package:fruits_app/core/entites/product_input_entity.dart';
import 'package:fruits_app/core/errors/failures.dart';
import 'package:fruits_app/core/repos/product_repo.dart';

class ProductRepoImp implements ProductRepo{
  @override
  Future<Either<Failures, List<ProductInputEntity>>> getBestSellingProducts() {
    // TODO: implement getBestSellingProducts
    throw UnimplementedError();
  }

  @override
  Future<Either<Failures, List<ProductInputEntity>>> getProducts() {
    // TODO: implement getProducts
    throw UnimplementedError();
  }
}