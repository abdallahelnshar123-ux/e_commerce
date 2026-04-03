import 'package:e_commerce/api/mapper/cart/get/cart_data_mapper.dart';
import 'package:e_commerce/data/model/response/cart/get/get_cart_response_dto.dart';
import 'package:e_commerce/domain/entities/response/cart/get/get_cart_response.dart';

extension GetCartResponseMapper on GetCartResponseDto{
  GetCartResponse toGetCartResponse(){
    return GetCartResponse(
      status: status,
      cartData: cartData?.toGetCart() ,
      cartId: cartId,
      numOfCartItems: numOfCartItems,
    );

  }

}