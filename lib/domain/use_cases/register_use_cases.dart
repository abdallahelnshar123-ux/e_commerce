import 'package:e_commerce/domain/entities/request/register/register_request.dart';
import 'package:e_commerce/domain/entities/response/auth/auth_response.dart';
import 'package:e_commerce/domain/repository/auth/auth_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class RegisterUseCases {
  final AuthRepository _authRepository;

  RegisterUseCases(this._authRepository);

  Future<AuthResponse> invoke(RegisterRequest registerRequest) {
    return _authRepository.register(registerRequest);
  }
}
