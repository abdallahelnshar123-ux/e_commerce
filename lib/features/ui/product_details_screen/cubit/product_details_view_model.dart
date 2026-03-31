import 'package:bloc/bloc.dart';
import 'package:e_commerce/core/exceptions/app_exceptions.dart';
import 'package:e_commerce/domain/use_cases/add_to_cart_use_case.dart';
import 'package:e_commerce/features/ui/product_details_screen/cubit/product_details_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductDetailsViewModel extends Cubit<ProductDetailsStates> {
  final AddToCartUseCase _addToCartUseCase;

  ProductDetailsViewModel(this._addToCartUseCase)
    : super(ProductDetailsInitState());

  int numOfCartItems = 0;

  static ProductDetailsViewModel get(BuildContext context) =>
      BlocProvider.of<ProductDetailsViewModel>(context);

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
