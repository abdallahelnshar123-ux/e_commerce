import 'package:e_commerce/api/api_services.dart';
import 'package:e_commerce/api/dio/dio_interceptors.dart';
import 'package:injectable/injectable.dart';
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../end_points.dart';

@module
abstract class GetItModule {
  @singleton
  BaseOptions get baseOptions => BaseOptions(baseUrl: EndPoints.baseUrl);

  @singleton
  PrettyDioLogger get prettyDioLogger => PrettyDioLogger(
    requestBody: true,
    requestHeader: true,
    responseBody: true,
    responseHeader: true,
    request: true,
    error: true,
  );

  @singleton
  Dio provideDio(BaseOptions baseOptions, PrettyDioLogger prettyDioLogger) {
    Dio dio = Dio(baseOptions);
    dio.interceptors.add(DioInterceptors());
    dio.interceptors.add(prettyDioLogger);
    return dio;
  }

  @singleton
  ApiServices get apiServices =>
      ApiServices(provideDio(baseOptions, prettyDioLogger));
}
