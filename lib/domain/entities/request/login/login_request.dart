import 'package:e_commerce/data/model/request/login/login_request_dto.dart';

class LoginRequest {
  final String? email;
  final String? password;

  LoginRequest({this.email, this.password});
}
