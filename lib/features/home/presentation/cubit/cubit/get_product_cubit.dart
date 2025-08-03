import 'package:bloc/bloc.dart';
import 'package:fruits_app/core/models/product_model.dart';
import 'package:fruits_app/features/home/domain/repo/products_repo.dart';
import 'package:meta/meta.dart';

part 'get_product_state.dart';

class GetProductCubit extends Cubit<GetProductState> {
  GetProductCubit(this.productsRepo) : super(GetProductInitial());
  final ProductsRepo productsRepo;

  Future<void> fetchProducts() async {
    emit(GetProductLoding());
    final result = await productsRepo.getProducts();
    result.fold(
      (failure) => emit(GetProductFailure(errorMessage: failure.message)),
      (products) => emit(GetProductSucces(products: products)),
    );
  }
}
