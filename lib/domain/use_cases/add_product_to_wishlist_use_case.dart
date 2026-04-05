import 'package:injectable/injectable.dart';

import '../repository/wishlist/wishlist_repository.dart';
class AddProductToWishlistUseCase {
  final WishlistRepository _wishlistRepository;

  AddProductToWishlistUseCase(this._wishlistRepository);

  Future<List<String>?> invoke(String productId) {
    return _wishlistRepository.addProductToWishlist(productId );
  }
}
