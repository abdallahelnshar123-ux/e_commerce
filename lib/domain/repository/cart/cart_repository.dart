import 'package:e_commerce/domain/entities/response/cart/add/add_to_cart_response.dart';
import 'package:e_commerce/domain/entities/response/cart/get/get_cart_response.dart';

abstract class CartRepository {
  Future<AddToCartResponse> addProductToCart(String productId);
  Future<GetCartResponse> getCartItems();
}
