import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:e_commerce/core/exceptions/app_exceptions.dart';
import 'package:e_commerce/domain/entities/request/login/login_request.dart';
import 'package:e_commerce/domain/entities/request/register/register_request.dart';
import 'package:e_commerce/domain/use_cases/login_use_cases.dart';
import 'package:e_commerce/domain/use_cases/register_use_cases.dart';
import 'package:e_commerce/features/ui/auth/auth_states.dart';
import 'package:injectable/injectable.dart';

@injectable
class RegisterViewModel extends Cubit<AuthStates> {
  final RegisterUseCases _registerUseCases;

  RegisterViewModel(this._registerUseCases) : super(AuthLoadingState());

  Future<void> register({
    required String email,
    required String password,
    required String rePassword,
    required String phone,
    required String name,
  }) async {
    try {
      emit(AuthLoadingState());
     RegisterRequest registerRequest = RegisterRequest(
        email: email,
        password: password,
        rePassword: rePassword,
        phone: phone,
        name: name,
      );

      var authResponse = await _registerUseCases.invoke(registerRequest);
      emit(AuthSuccessState(authResponse: authResponse));
    } on DioException catch (e) {
      String message = (e.error is AppException)
          ? (e.error as AppException).message
          : 'Unexpected Error';
      emit(AuthErrorState(errorMessage: ServerException(message: message)));
    } on AppException catch (e) {
      emit(AuthErrorState(errorMessage: ServerException(message: e.message)));
    } catch (e) {
      emit(
        AuthErrorState(
          errorMessage: UnexpectedException(message: e.toString()),
        ),
      );
    }
  }
}

// todo: view => view model
// todo: view model => use case
// todo: use case => repository
// todo: repository => remote ds
// todo: remote ds => api services
