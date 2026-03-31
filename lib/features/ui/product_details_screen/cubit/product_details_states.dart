import 'package:e_commerce/domain/entities/response/cart/add/add_to_cart_response.dart';

sealed class ProductDetailsStates {}

class AddToCartLoadingState extends ProductDetailsStates {}

class ProductDetailsInitState extends ProductDetailsStates {}

class AddToCartSuccessState extends ProductDetailsStates {
  final AddToCartResponse cartResponse;

  AddToCartSuccessState({required this.cartResponse});
}

class AddToCartErrorState extends ProductDetailsStates {
  final String errorMessage;

  AddToCartErrorState({required this.errorMessage});
}
