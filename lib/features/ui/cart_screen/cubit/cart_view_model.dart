import 'package:e_commerce/core/exceptions/app_exceptions.dart';
import 'package:e_commerce/domain/use_cases/add_to_cart_use_case.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import 'cart_states.dart';

@injectable
class CartViewModel extends Cubit<CartStates> {
  final AddToCartUseCase _addToCartUseCase;

  CartViewModel(this._addToCartUseCase) : super(CartInitState());

  int numOfCartItems = 0;

  static CartViewModel get(BuildContext context) =>
      BlocProvider.of<CartViewModel>(context);

  void addProductToCart(String productId) async {
    try {
      var addCartResponse = await _addToCartUseCase.invoke(productId);
      numOfCartItems = addCartResponse.numOfCartItems ?? 0;
      emit(AddToCartSuccessState(cartResponse: addCartResponse));
    } on AppException catch (e) {
      emit(AddToCartErrorState(errorMessage: e.message));
    }
  }
}
