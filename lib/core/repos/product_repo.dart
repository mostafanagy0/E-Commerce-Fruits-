import 'package:dartz/dartz.dart';
import 'package:fruits_app/core/entites/product_input_entity.dart';
import 'package:fruits_app/core/errors/failures.dart';

abstract class ProductRepo {
  Future<Either<Failures, List<ProductInputEntity>>> getProducts();
  Future<Either<Failures, List<ProductInputEntity>>> getBestSellingProducts();
}
