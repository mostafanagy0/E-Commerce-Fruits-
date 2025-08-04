import 'package:dio/dio.dart';
import 'package:fruits_app/core/models/product_model.dart';
import 'package:fruits_app/core/networks/api_constants.dart';
import 'package:retrofit/retrofit.dart';

part 'api_get_products_service.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class ApiGetProductsService {
  factory ApiGetProductsService(Dio dio, {String baseUrl}) =
      _ApiGetProductsService;

  @GET(ApiConstants.productsUrl)
  Future<List<ProductModel>> getProducts();
}
