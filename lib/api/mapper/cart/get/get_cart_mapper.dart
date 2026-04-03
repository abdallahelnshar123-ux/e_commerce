import 'package:e_commerce/data/model/response/cart/get/get_cart_dto.dart';
import 'package:e_commerce/domain/entities/response/cart/get/get_cart.dart';

extension GetCartMapper on GetCartDto{
  GetCart toGetCart(){
    return GetCart(
      id: id,
      totalCartPrice: totalCartPrice,
      products: products?.map((getCartDto) => GetCart(
        v: getCartDto.v,
        id:  getCartDto.id ,
        cartOwner:  getCartDto.cartOwner,
        createdAt:  getCartDto.createdAt,
        products:  getCartDto.v,
        v: getCartDto.v,
      ) ).toList() ,
      cartOwner: cartOwner,
      createdAt: createdAt  ,
      updatedAt: updatedAt ,
       v: v

    );

  }


}