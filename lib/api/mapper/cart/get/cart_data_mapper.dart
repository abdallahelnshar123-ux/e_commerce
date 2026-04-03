import 'package:e_commerce/api/mapper/product/product_mapper.dart';
import 'package:e_commerce/data/model/response/cart/get/cart_data_dto.dart';
import 'package:e_commerce/domain/entities/response/cart/get/cart_data.dart';
import 'package:e_commerce/domain/entities/response/cart/get/product_data.dart';

extension CartDataMapper on CartDataDto {
  CartData toGetCart() {
    return CartData(
      id: id,
      totalCartPrice: totalCartPrice,
      productData: productData
          ?.map(
            (getProductsDto) => ProductData(
              id: getProductsDto.id,
              product: getProductsDto.product?.toProduct(),
              count: getProductsDto.count,
              price: getProductsDto.price,
            ),
          )
          .toList(),
      cartOwner: cartOwner,
      createdAt: createdAt,
      updatedAt: updatedAt,
      v: v,
    );
  }
}
