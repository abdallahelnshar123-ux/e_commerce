import 'package:injectable/injectable.dart';

import '../repository/wishlist/wishlist_repository.dart';

class RemoveProductFromWishlistUseCase {
  final WishlistRepository _wishlistRepository;

  RemoveProductFromWishlistUseCase(this._wishlistRepository);

  Future<List<String>?> invoke(String productId) {
    return _wishlistRepository.removeProductFromWishlist(productId);
  }
}
