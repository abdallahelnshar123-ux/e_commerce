import 'package:e_commerce/domain/entities/response/cart/add/add_to_cart_response.dart';
import 'package:e_commerce/domain/entities/response/cart/get/get_cart_response.dart';
import 'package:e_commerce/domain/repository/cart/cart_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetCartItemsUseCase {
  final CartRepository _cartRepository;

  GetCartItemsUseCase(this._cartRepository);

  Future<GetCartResponse> invoke() {
    return _cartRepository.getCartItems();
  }
}
