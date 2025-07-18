import 'package:fruits_app/core/models/product_model.dart' show ProductModel;
import 'package:fruits_app/core/networks/api_get_products_service.dart';
import 'package:fruits_app/features/home/data/data_source/products_remote_data_source.dart';

class ProductsRemoteDataSourceimpl extends ProductsRemoteDataSource {
  final ApiGetProductsService apiGetProductsService;

  ProductsRemoteDataSourceimpl({required this.apiGetProductsService});
  @override
  Future<List<ProductModel>> getProducts() async {
    final response = await apiGetProductsService.getProducts();
    return response;
  }
}
