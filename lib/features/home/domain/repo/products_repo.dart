import 'package:dartz/dartz.dart';
import 'package:fruits_app/core/errors/failures.dart';
import 'package:fruits_app/core/models/product_model.dart';

abstract class ProductsRepo {
  Future<Either<Failures, List<ProductModel>>> getProducts();
}
