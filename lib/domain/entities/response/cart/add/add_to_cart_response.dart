import 'add_cart.dart';

class AddToCartResponse {
  final String? message;
  final String? status;
  final int? numOfCartItems;
  final String? cartId;

  final AddCart? data;

  AddToCartResponse({
    this.status,
    this.message,
    this.numOfCartItems,
    this.cartId,
    this.data,
  });
}
