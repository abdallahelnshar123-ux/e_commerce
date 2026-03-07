import 'package:e_commerce/domain/entities/response/auth/user.dart';

class AuthResponse {
  final String? message;
  final User? user;

  AuthResponse({this.message, this.user});
}
