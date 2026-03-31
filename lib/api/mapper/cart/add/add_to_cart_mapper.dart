import 'package:e_commerce/api/mapper/cart/add/add_cart_mapper.dart';
import 'package:e_commerce/data/model/response/cart/add/add_to_cart_response_dto.dart';
import 'package:e_commerce/domain/entities/response/cart/add/add_to_cart_response.dart';

extension AddToCartMapper on AddToCartResponseDto{

  AddToCartResponse toAddToCartResponse(){
    return AddToCartResponse(
      message: message,
      data: data?.toAddCart(),
      cartId:  cartId,
      numOfCartItems: numOfCartItems,
      status: status,
    );

  }

}