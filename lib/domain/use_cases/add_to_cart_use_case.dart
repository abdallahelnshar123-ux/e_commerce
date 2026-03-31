import 'package:e_commerce/domain/entities/response/cart/add/add_to_cart_response.dart';
import 'package:e_commerce/domain/repository/cart/add/add_to_cart_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class AddToCartUseCase {
  final AddToCartRepository _addToCartRepository;

  AddToCartUseCase(this._addToCartRepository);

  Future<AddToCartResponse> invoke(String productId) {
    return _addToCartRepository.addProductToCart(productId);
  }
}
