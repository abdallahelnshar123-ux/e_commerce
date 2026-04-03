import 'package:dio/dio.dart';
import 'package:e_commerce/api/api_services.dart';
import 'package:e_commerce/api/mapper/cart/add/add_to_cart_mapper.dart';
import 'package:e_commerce/core/cache/shared_prefs_utils.dart';
import 'package:e_commerce/core/exceptions/app_exceptions.dart';
import 'package:e_commerce/data/data_sources/remote/cart/cart_remote_data_source.dart';
import 'package:e_commerce/data/model/request/cart/add/add_to_cart_request_dto.dart';
import 'package:e_commerce/domain/entities/response/cart/add/add_to_cart_response.dart';
import 'package:e_commerce/domain/entities/response/cart/get/get_cart_response.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: CartRemoteDataSource)
class CartRemoteDataSourceImpl implements CartRemoteDataSource {
  final ApiServices _apiServices;

  CartRemoteDataSourceImpl(this._apiServices);

  @override
  Future<AddToCartResponse> addProductToCart(String productId) async {
    try {
      var token = SharedPrefsUtils.getData(key: ShredPrefsKeys.tokenKey);
      AddToCartRequestDto addToCartRequest = AddToCartRequestDto(
        productId: productId,
      );
      var addToCartResponse = await _apiServices.addProductToCart(
        addToCartRequest,
        token.toString(),
      );
      return addToCartResponse.toAddToCartResponse();
    } on DioException catch (e) {
      String message = (e.error as AppException).message;
      throw ServerException(message: message);
    }
  }

  @override
  Future<GetCartResponse> getCartItems()async {
    try {
      var token = SharedPrefsUtils.getData(key: ShredPrefsKeys.tokenKey);

      var getCartResponse = await _apiServices.getCartItems(
        token.toString(),
      );
      return getCartResponse.;
    } on DioException catch (e) {
      String message = (e.error as AppException).message;
      throw ServerException(message: message);
    }
  }
}
