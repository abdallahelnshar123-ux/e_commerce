import 'package:dio/dio.dart';
import 'package:e_commerce/api/end_points.dart';
import 'package:e_commerce/api/model/request/login/login_request_dto.dart';
import 'package:e_commerce/api/model/response/auth/auth_response_dto.dart';
import 'package:retrofit/retrofit.dart';

import 'model/request/register/register_request_dto.dart';

part 'api_services.g.dart';

@RestApi()
abstract class ApiServices {
  factory ApiServices(Dio dio, {String? baseUrl}) = _ApiServices;

  @POST(EndPoints.loginApi)
  Future<AuthResponseDto> login(@Body() LoginRequestDto loginRequest);

  @POST(EndPoints.registerApi)
  Future<AuthResponseDto> register(@Body() RegisterRequestDto registerRequest);
}
