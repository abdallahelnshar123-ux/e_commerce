abstract class WishlistRepository {
  Future<List<String>?> addProductToWishlist(String productID);
  Future<List<String>?> removeProductFromWishlist(String productID);
}
