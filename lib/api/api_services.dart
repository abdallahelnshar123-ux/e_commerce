import 'package:dio/dio.dart';
import 'package:e_commerce/api/end_points.dart';
import 'package:e_commerce/data/model/response/category_brand/category_or_brand_response_dto.dart';
import 'package:e_commerce/data/model/response/product/product_response_dto.dart';
import 'package:retrofit/retrofit.dart';

import '../data/model/request/login/login_request_dto.dart';
import '../data/model/request/register/register_request_dto.dart';
import '../data/model/response/auth/auth_response_dto.dart';

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
}
