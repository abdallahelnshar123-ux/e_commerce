import 'package:dio/dio.dart';
import 'package:e_commerce/core/exceptions/app_exceptions.dart';

class DioInterceptors extends Interceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    AppExceptions exception;
    final responseData = err.response?.data;
    String message = 'Some thing went wrong';
    if (responseData is Map) {
      message =
          responseData['error']?['msg'] ?? responseData['error'] ?? message;
    }

    switch (err.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
      case DioExceptionType.connectionError:
        exception = NetworkException(
          message: 'Please Check your internet connection',
        );
        break;
      case DioExceptionType.badResponse:
        exception = ServerException(
          message: message,
          statusCode: err.response?.statusCode,
        );
        break;
      case DioExceptionType.cancel:
        exception = UnexpectedException(message: 'Request was cancelled');
        break;
      default:
        exception = UnexpectedException(message: message);
    }

    handler.next(
      DioException(
        requestOptions: err.requestOptions,
        error: exception,
        response: err.response,
        type: err.type,
      ),
    );
  }
}
