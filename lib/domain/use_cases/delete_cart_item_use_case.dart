import 'package:e_commerce/domain/entities/response/cart/add/add_to_cart_response.dart';
import 'package:e_commerce/domain/entities/response/cart/get/get_cart_response.dart';
import 'package:e_commerce/domain/repository/cart/cart_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class DeleteCartItemUseCase {
  final CartRepository _cartRepository;

  DeleteCartItemUseCase(this._cartRepository);

  Future<GetCartResponse> invoke(String productId) {
    return _cartRepository.deleteCartItem(productId);
  }
}
