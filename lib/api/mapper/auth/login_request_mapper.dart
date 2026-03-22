import 'package:e_commerce/data/model/request/login/login_request_dto.dart';

import '../../../domain/entities/request/login/login_request.dart';

extension LoginRequestMapper on LoginRequest {
  LoginRequestDto toLoginRequestDto() {
    return LoginRequestDto(password: password, email: email);
  }
}
