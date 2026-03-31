
import 'package:e_commerce/domain/entities/response/cart/add/add_to_cart_response.dart';

abstract class AddToCartRemoteDataSource {
  Future<AddToCartResponse> addProductToCart(String productId);

}