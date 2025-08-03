import 'package:fruits_app/core/models/product_model.dart';
import 'package:fruits_app/core/networks/api_get_products_service.dart';
import 'package:fruits_app/features/home/data/data_source/products_remote_data_source.dart';

class ProductsRemoteDataSourceImpl extends ProductsRemoteDataSource {
  final ApiGetProductsService apiGetProductsService;

  ProductsRemoteDataSourceImpl({required this.apiGetProductsService});

  @override
  Future<List<ProductModel>> getProducts() async {
    try {
      final response = await apiGetProductsService.getProducts();
      return response;
    } catch (e) {
      throw Exception('Failed to fetch products: $e');
    }
  }
}
