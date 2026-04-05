import 'package:dio/dio.dart';
import 'package:e_commerce/api/end_points.dart';
import 'package:e_commerce/data/model/request/cart/add/add_to_cart_request_dto.dart';
import 'package:e_commerce/data/model/request/cart/update/update_product_count_dto.dart';
import 'package:e_commerce/data/model/response/cart/add/add_to_cart_response_dto.dart';
import 'package:e_commerce/data/model/response/cart/get/get_cart_response_dto.dart';
import 'package:e_commerce/data/model/response/category_brand/category_or_brand_response_dto.dart';
import 'package:e_commerce/data/model/response/product/product_response_dto.dart';
import 'package:retrofit/retrofit.dart';

import '../data/model/request/login/login_request_dto.dart';
import '../data/model/request/register/register_request_dto.dart';
import '../data/model/request/wishlist/add/add_product_to_wishlist_request_dto.dart';
import '../data/model/response/auth/auth_response_dto.dart';
import '../data/model/response/wishlist/add_remove/add_or_remove_product_to_wishlist_response_dto.dart';

part 'api_services.g.dart';

@RestApi()
abstract class ApiServices {
  factory ApiServices(Dio dio, {String? baseUrl}) = _ApiServices;

  @POST(EndPoints.loginApi)
  Future<AuthResponseDto> login(@Body() LoginRequestDto loginRequest);

  @POST(EndPoints.registerApi)
  Future<AuthResponseDto> register(@Body() RegisterRequestDto registerRequest);

  @GET(EndPoints.getAllCategoriesApi)
  Future<CategoryOrBrandResponseDto> getAllCategories();

  @GET(EndPoints.getAllBrandsApi)
  Future<CategoryOrBrandResponseDto> getAllBrands();

  @GET(EndPoints.getAllProductsApi)
  Future<ProductResponseDto> getAllProducts();

  @POST(EndPoints.cartApi)
  Future<AddToCartResponseDto> addProductToCart(
    @Body() AddToCartRequestDto addToCartRequest,
    @Header('token') String token,
  );

  @GET(EndPoints.cartApi)
  Future<GetCartResponseDto> getCartItems(@Header('token') String token);

  @DELETE(EndPoints.deleteOrUpdateProductInCartApi)
  Future<GetCartResponseDto> deleteCartItem(
    @Header('token') String token,
    @Path('productId') String productId,
  );

  @PUT(EndPoints.deleteOrUpdateProductInCartApi)
  Future<GetCartResponseDto> updateCartItem(
    @Header('token') String token,
    @Path('productId') String productId,
    @Body() UpdateProductCountDto updateProductCount,
  );

  @POST(EndPoints.wishlistApi)
  Future<AddOrRemoveProductToWishlistResponseDto> addProductToWishlist(
      @Body() AddProductToWishlistRequestDto addProductToWishListRequest,
      @Header('token') String token,
      );

  @DELETE(EndPoints.deleteProductFromWishlistApi)
  Future<AddOrRemoveProductToWishlistResponseDto> deleteProductFromWishlist(
      @Header('token') String token,
      @Path('productId') String productId,
      );
}
