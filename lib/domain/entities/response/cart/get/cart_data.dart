import 'package:e_commerce/domain/entities/response/cart/get/product_data.dart';

class CartData {
  final String? id;
  final String? cartOwner;
  final List<ProductData>? productData;
  final String? createdAt;
  final String? updatedAt;
  final int? v;
  final int? totalCartPrice;

  CartData({
    this.id,
    this.cartOwner,
    this.productData,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.totalCartPrice,
  });
}
