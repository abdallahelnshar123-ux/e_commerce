import 'package:e_commerce/data/model/request/register/register_request_dto.dart';
import 'package:e_commerce/domain/entities/request/register/register_request.dart';

extension RegisterRequestMapper on RegisterRequest{

  RegisterRequestDto toRegisterRequestDto(){
    return RegisterRequestDto(
      name: name,
      email: email,
      password: password,
      phone: phone,
      rePassword: rePassword ,

    );

  }

}