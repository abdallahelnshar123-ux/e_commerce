import 'package:e_commerce/domain/entities/response/cart/add/add_to_cart_response.dart';
import 'package:e_commerce/domain/repository/cart/add/add_to_cart_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: AddToCartRepository)
class AddToCartRepositoryImpl implements AddToCartRepository {
  AddToCartRepositoryImpl();

  @override
  Future<AddToCartResponse> addProductToCart(String productId) {
    // TODO: implement addProductToCart
    throw UnimplementedError();
  }
}
