import 'package:dartz/dartz.dart';
import 'package:fruits_app/core/entites/product_entity.dart';
import 'package:fruits_app/core/errors/failures.dart';
import 'package:fruits_app/core/models/product_model.dart';
import 'package:fruits_app/core/repos/product_repo.dart';
import 'package:fruits_app/core/services/database_service.dart';
import 'package:fruits_app/core/utils/backend_endpoints.dart';

class ProductRepoImp implements ProductRepo {
  final DataBaseService dataBaseService;

  ProductRepoImp(this.dataBaseService);
  @override
  Future<Either<Failures, List<ProductEntity>>> getBestSellingProducts() {

    throw UnimplementedError();
  }

  @override
  Future<Either<Failures, List<ProductEntity>>> getProducts() async {
    try {
      var data = await dataBaseService.getData(
          path: BackendEndpoints.getProducts) as List<Map<String, dynamic>>;
      List<ProductEntity> products =
          data.map((e) => ProductModel.fromMap(e).toEntity()).toList();

      return right(products);
    } catch (e) {
      return left(ServerFailure('Failed to get products'));
    }
  }
}
