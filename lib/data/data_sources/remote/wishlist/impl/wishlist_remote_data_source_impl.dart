import 'package:e_commerce/api/api_services.dart';
import 'package:e_commerce/core/cache/shared_prefs_utils.dart';
import 'package:e_commerce/data/data_sources/remote/wishlist/wishlist_remote_data_source.dart';
import 'package:e_commerce/data/model/request/wishlist/add/add_product_to_wishlist_request_dto.dart';

class WishlistRemoteDataSourceImpl extends WishlistRemoteDataSource {
  final ApiServices _apiServices;

  WishlistRemoteDataSourceImpl(this._apiServices);

  @override
  Future<List<String>?> addProductToWishlist(String productID) async {
    var token = SharedPrefsUtils.getData(key: ShredPrefsKeys.tokenKey);
    AddProductToWishlistRequestDto addProductToWishlistRequest =
        AddProductToWishlistRequestDto(productId: productID);
    var addProductToWishlistResponse = await _apiServices.addProductToWishlist(
      addProductToWishlistRequest,
      token.toString(),
    );
    return addProductToWishlistResponse.data;
  }

  @override
  Future<List<String>?> removeProductFromWishlist(String productID) async {
    var token = SharedPrefsUtils.getData(key: ShredPrefsKeys.tokenKey);

    var removeProductFromWishlistResponse = await _apiServices
        .deleteProductFromWishlist(token.toString(), productID);
    return removeProductFromWishlistResponse.data;
  }
}
