part of 'get_product_cubit.dart';

@immutable
sealed class GetProductState {}

final class GetProductInitial extends GetProductState {}

final class GetProductLoding extends GetProductState {}

final class GetProductSucces extends GetProductState {
  final List<ProductModel> products;

  GetProductSucces({required this.products});
}

final class GetProductFailure extends GetProductState {
  final String errorMessage;

  GetProductFailure({required this.errorMessage});
}
