abstract class WishlistRemoteDataSource {
  Future<List<String>?> addProductToWishlist(String productID);
  Future<List<String>?> removeProductFromWishlist(String productID);


}