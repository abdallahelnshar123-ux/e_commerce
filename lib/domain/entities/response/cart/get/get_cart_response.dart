import 'package:e_commerce/domain/entities/response/cart/get/cart_data.dart';

class GetCartResponse {
  final String? status;
  final int? numOfCartItems;
  final String? cartId;
  final CartData? cartData;

  GetCartResponse({this.status, this.numOfCartItems, this.cartId, this.cartData});
}
