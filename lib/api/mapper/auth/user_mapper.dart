import 'package:e_commerce/data/model/response/auth/user_dto.dart';
import 'package:e_commerce/domain/entities/response/auth/user.dart';

extension UserMapper on UserDto {
  User toUser() {
    return User(email: email, name: name, );
  }
}
