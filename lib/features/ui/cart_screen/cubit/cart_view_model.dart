import 'package:e_commerce/core/exceptions/app_exceptions.dart';
import 'package:e_commerce/domain/use_cases/add_to_cart_use_case.dart';
import 'package:e_commerce/domain/use_cases/delete_cart_item_use_case.dart';
import 'package:e_commerce/domain/use_cases/get_cart_items_use_case.dart';
import 'package:e_commerce/domain/use_cases/update_cart_item_use_case.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import 'cart_states.dart';

@injectable
class CartViewModel extends Cubit<CartStates> {
  final AddToCartUseCase _addToCartUseCase;
  final GetCartItemsUseCase _getCartItemsUseCase;
  final DeleteCartItemUseCase _deleteCartItemUseCase;
  final UpdateCartItemUseCase _updateCartItemUseCase;

  CartViewModel(
    this._addToCartUseCase,
    this._getCartItemsUseCase,
    this._deleteCartItemUseCase,
    this._updateCartItemUseCase,
  ) : super(CartInitState());

  int numOfCartItems = 0;
  double totalCartPrice = 0;

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

  void getCartItems() async {
    try {
      emit(GetCartItemsLoadingState());
      var getCartItemsResponse = await _getCartItemsUseCase.invoke();
      numOfCartItems = getCartItemsResponse.numOfCartItems ?? 0;
      totalCartPrice =
          getCartItemsResponse.cartData?.totalCartPrice?.toDouble() ?? 0;
      if (getCartItemsResponse.cartData?.productData != null) {
        emit(
          GetCartItemsSuccessState(
            productsList: getCartItemsResponse.cartData!.productData!,
          ),
        );
      } else {
        emit(
          GetCartItemsErrorState(
            errorMessage: 'sorry we were unable to load cart',
          ),
        );
      }
    } on AppException catch (e) {
      emit(GetCartItemsErrorState(errorMessage: e.message));
    }
  }

  void deleteCartItem(String productId) async {
    try {

      var deleteCartItemResponse = await _deleteCartItemUseCase.invoke(
        productId,
      );
      numOfCartItems = deleteCartItemResponse.numOfCartItems ?? 0;
      totalCartPrice =
          deleteCartItemResponse.cartData?.totalCartPrice?.toDouble() ?? 0;
      if (deleteCartItemResponse.cartData?.productData != null) {
        emit(
          DeleteCartItemSuccessState(
            productsList: deleteCartItemResponse.cartData!.productData!,
          ),
        );
      } else {
        emit(
          DeleteCartItemErrorState(
            errorMessage: 'sorry we were unable to load cart',
          ),
        );
      }
    } on AppException catch (e) {
      emit(DeleteCartItemErrorState(errorMessage: e.message));
    }
  }

  void updateCartItem(String productId, int count) async {
    try {

      var updateCartItemResponse = await _updateCartItemUseCase.invoke(
        productId,
        count,
      );
      totalCartPrice =
          updateCartItemResponse.cartData?.totalCartPrice?.toDouble() ?? 0;
      if (updateCartItemResponse.cartData?.productData != null) {
        emit(
          UpdateCartItemSuccessState(
            productsList: updateCartItemResponse.cartData!.productData!,
          ),
        );
      } else {
        emit(
          UpdateCartItemErrorState(
            errorMessage: 'sorry we were unable to load cart',
          ),
        );
      }
    } on AppException catch (e) {
      emit(UpdateCartItemErrorState(errorMessage: e.message));
    }
  }
}
