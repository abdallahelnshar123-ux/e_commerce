import 'package:e_commerce/core/exceptions/app_exceptions.dart';

sealed class ApiResult<T> {
  bool get hasData => this is ApiSuccessResultState;

  bool get hasError => this is ApiErrorResultState;

  bool get isLoading => this is ApiLoadingResultState;

  AppException get getError => (this as ApiErrorResultState).error;

  T get getData => (this as ApiSuccessResultState).data;
}

class ApiInitResultState<T> extends ApiResult<T> {}

class ApiLoadingResultState<T> extends ApiResult<T> {}

class ApiSuccessResultState<T> extends ApiResult<T> {
  T? data;

  ApiSuccessResultState(this.data);
}

class ApiErrorResultState<T> extends ApiResult<T> {
  AppException error;

  ApiErrorResultState(this.error);
}
