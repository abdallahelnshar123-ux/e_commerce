import 'package:e_commerce/domain/entities/response/cart/add/add_to_cart_response.dart';

sealed class CartStates {}

class AddToCartLoadingState extends CartStates {}

class CartInitState extends CartStates {}

class AddToCartSuccessState extends CartStates {
  final AddToCartResponse cartResponse;

  AddToCartSuccessState({required this.cartResponse});
}

class AddToCartErrorState extends CartStates {
  final String errorMessage;

  AddToCartErrorState({required this.errorMessage});
}
