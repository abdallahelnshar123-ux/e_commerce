import 'package:dio/dio.dart';
import 'package:e_commerce/api/api_services.dart';
import 'package:e_commerce/api/mapper/category_brand/category_brand_mapper.dart';
import 'package:e_commerce/core/cache/shared_prefs_utils.dart';
import 'package:e_commerce/core/exceptions/app_exceptions.dart';
import 'package:e_commerce/data/data_sources/remote/cart/add/add_to_cart_remote_data_source.dart';
import 'package:e_commerce/data/data_sources/remote/category/category_remote_data_source.dart';
import 'package:e_commerce/data/model/request/cart/add/add_to_cart_request_dto.dart';
import 'package:e_commerce/domain/entities/response/cart/add/add_to_cart_response.dart';
import 'package:e_commerce/domain/entities/response/common/category_brand.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: AddToCartRemoteDataSource)
class AddToCartRemoteDataSourceImpl implements AddToCartRemoteDataSource {
  final ApiServices _apiServices;

  AddToCartRemoteDataSourceImpl(this._apiServices);

  @override
  Future<AddToCartResponse> addProductToCart(String productId) {
    try {
      var token = SharedPrefsUtils.getData(key: ShredPrefsKeys.tokenKey);
      AddToCartRequestDto addToCartRequest = AddToCartRequestDto(
        productId: productId,
      );
      var addToCartResponse = _apiServices.addProductToCart(
        addToCartRequest,
        token.toString(),
      );
      return addToCartResponse.a ;
    } on DioException catch (e) {
      String message = (e.error as AppException).message;
      throw ServerException(message: message);
    }
  }
}
