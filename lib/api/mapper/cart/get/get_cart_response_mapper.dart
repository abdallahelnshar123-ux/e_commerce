import 'package:e_commerce/data/model/response/cart/get/get_cart_response_dto.dart';
import 'package:e_commerce/domain/entities/response/cart/get/get_cart_response.dart';

extension GetCartResponseMapper on GetCartResponseDto{
  GetCartResponse toGetCartResponse(){
    return GetCartResponse(
      status: status,
      data: data ,
      cartId: cartId,
      numOfCartItems: numOfCartItems,
    );

  }

}