import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:e_commerce/core/exceptions/app_exceptions.dart';
import 'package:e_commerce/domain/entities/request/login/login_request.dart';
import 'package:e_commerce/domain/use_cases/login_use_cases.dart';
import 'package:e_commerce/features/ui/auth/auth_states.dart';
import 'package:injectable/injectable.dart';

@injectable
class LoginViewModel extends Cubit<AuthStates> {
  final LoginUseCases _loginUseCases;

  LoginViewModel(this._loginUseCases) : super(AuthLoadingState());

  Future<void> login({required String email, required String password}) async {
    try {
      emit(AuthLoadingState());
      LoginRequest loginRequest = LoginRequest(
        email: email,
        password: password,
      );

      var authResponse = await _loginUseCases.invoke(loginRequest);
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
