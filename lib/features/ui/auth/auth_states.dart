import 'package:e_commerce/core/exceptions/app_exceptions.dart';
import 'package:e_commerce/domain/entities/response/auth/auth_response.dart';

sealed class AuthStates {}

class AuthLoadingState extends AuthStates {}

class AuthSuccessState extends AuthStates {
  AuthResponse authResponse ;
  AuthSuccessState({required this.authResponse});

}

class AuthErrorState extends AuthStates {
  AppException errorMessage;

  AuthErrorState({required this.errorMessage});
}
