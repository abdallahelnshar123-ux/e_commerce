import 'package:e_commerce/domain/entities/response/cart/add/add_to_cart_response.dart';
import 'package:e_commerce/domain/entities/response/cart/get/get_cart_response.dart';
import 'package:e_commerce/domain/entities/response/cart/get/product_data.dart';
import 'package:e_commerce/domain/entities/response/product/product.dart';

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
