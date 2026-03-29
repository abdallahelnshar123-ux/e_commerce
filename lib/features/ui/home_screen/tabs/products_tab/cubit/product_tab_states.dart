import '../../../../../../domain/entities/response/product/product.dart';

sealed class ProductTabStates {}

class ProductLoadingState extends ProductTabStates {}

class ProductInitState extends ProductTabStates {}

class ProductSuccessState extends ProductTabStates {
  final List<Product>? productsList;

  ProductSuccessState({required this.productsList});
}

class ProductErrorState extends ProductTabStates {
  final String errorMessage;

  ProductErrorState({required this.errorMessage});
}
