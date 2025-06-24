import 'package:dartz/dartz.dart';
import 'package:fruits_app/core/entites/product_input_entity.dart';
import 'package:fruits_app/core/errors/failures.dart';
import 'package:fruits_app/core/models/product_model.dart';
import 'package:fruits_app/core/repos/product_repo.dart';
import 'package:fruits_app/core/services/database_service.dart';
import 'package:fruits_app/core/utils/backend_endpoints.dart';

class ProductRepoImp implements ProductRepo {
  final DataBaseService dataBaseService;

  ProductRepoImp(this.dataBaseService);
  @override
  Future<Either<Failures, List<ProductInputEntity>>> getBestSellingProducts() {
    // TODO: implement getBestSellingProducts
    throw UnimplementedError();
  }

  @override
  Future<Either<Failures, List<ProductInputEntity>>> getProducts() async {
    try {
      var data = await dataBaseService.getData(
          path: BackendEndpoints.getProducts) as List<Map<String, dynamic>>;
      List<ProductInputEntity> products =
          data.map((e) => ProductInputModel.fromJson(e).toEntity()).toList();

      return right(products);
    } catch (e) {
      return left(ServerFailure('Failed to get products'));
    }
  }
}
