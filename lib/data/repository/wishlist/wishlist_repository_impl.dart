import 'package:e_commerce/data/data_sources/remote/wishlist/wishlist_remote_data_source.dart';
import 'package:e_commerce/domain/repository/wishlist/wishlist_repository.dart';

class WishlistRepositoryImpl extends WishlistRepository {
  final WishlistRemoteDataSource _wishlistRemoteDataSource;
  WishlistRepositoryImpl(this._wishlistRemoteDataSource);
  @override
  Future<List<String>?> addProductToWishlist(String productID) {
    return _wishlistRemoteDataSource.addProductToWishlist(productID);
  }

  @override
  Future<List<String>?> removeProductFromWishlist(String productID) {
   return _wishlistRemoteDataSource.removeProductFromWishlist(productID);
  }



}
