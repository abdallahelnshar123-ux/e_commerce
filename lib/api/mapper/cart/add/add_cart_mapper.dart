import 'package:e_commerce/data/model/response/cart/add/add_cart_dto.dart';
import 'package:e_commerce/domain/entities/response/cart/add/add_cart.dart';
import 'package:e_commerce/domain/entities/response/cart/add/add_product.dart';

extension AddCartMapper on AddCartDto {
  AddCart toAddCart() {
    return AddCart(
      id: id,
      updatedAt: updatedAt,
      createdAt: createdAt,
      cartOwner: cartOwner,
      products: products
          ?.map(
            (productDto) => AddProduct(
              product: productDto.product,
              count: productDto.count,
              price: productDto.price,
              id: productDto.id,
            ),
          )
          .toList(),
      totalCartPrice: totalCartPrice,
      V: V,
    );
  }
}
