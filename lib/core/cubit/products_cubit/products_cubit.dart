import 'package:bloc/bloc.dart';
import 'package:fruits_app/core/cubit/products_cubit/products_state.dart';
import 'package:fruits_app/core/repos/product_repo.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit(this.productRepo) : super(ProductsInitial());
  final ProductRepo productRepo;
// This method is used to get all products from the database
  Future<void> getProducts() async {
    emit(ProductsLoding());
    var result = await productRepo.getProducts();
    result.fold(
      (failure) => emit(ProductsFailure(errMessage: failure.message)),
      (products) => emit(ProductsSuccess(products: products)),
    );
  }

  /// This method is used to get the best selling products from the database

  Future<void> getBestSellingProducts() async {
    emit(ProductsLoding());
    var result = await productRepo.getBestSellingProducts();
    result.fold(
      (failure) => emit(ProductsFailure(errMessage: failure.message)),
      (products) => emit(ProductsSuccess(products: products)),
    );
  }
}
