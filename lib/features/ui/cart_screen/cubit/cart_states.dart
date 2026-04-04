import 'package:e_commerce/domain/entities/response/cart/add/add_to_cart_response.dart';
import 'package:e_commerce/domain/entities/response/cart/get/product_data.dart';

sealed class CartStates {}

class CartInitState extends CartStates {}

class AddToCartLoadingState extends CartStates {}

class AddToCartSuccessState extends CartStates {
  final AddToCartResponse cartResponse;

  AddToCartSuccessState({required this.cartResponse});
}

class AddToCartErrorState extends CartStates {
  final String errorMessage;

  AddToCartErrorState({required this.errorMessage});
}

class GetCartItemsLoadingState extends CartStates {}

class GetCartItemsSuccessState extends CartStates {
  final List<ProductData> productsList;

  GetCartItemsSuccessState({required this.productsList});
}

class GetCartItemsErrorState extends CartStates {
  final String errorMessage;

  GetCartItemsErrorState({required this.errorMessage});
}

class DeleteCartItemLoadingState extends CartStates {}

class DeleteCartItemSuccessState extends CartStates {
  final List<ProductData> productsList;

  DeleteCartItemSuccessState({required this.productsList});
}

class DeleteCartItemErrorState extends CartStates {
  final String errorMessage;

  DeleteCartItemErrorState({required this.errorMessage});
}

class UpdateCartItemLoadingState extends CartStates {}

class UpdateCartItemSuccessState extends CartStates {
  final List<ProductData> productsList;

  UpdateCartItemSuccessState({required this.productsList});
}

class UpdateCartItemErrorState extends CartStates {
  final String errorMessage;

  UpdateCartItemErrorState({required this.errorMessage});
}
