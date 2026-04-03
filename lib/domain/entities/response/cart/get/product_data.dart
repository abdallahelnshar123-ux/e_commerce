import 'package:e_commerce/domain/entities/response/product/product.dart';

class ProductData {
  final int? count;
  final String? id;
  final Product? product;
  final int? price;

  ProductData({this.count, this.id, this.product, this.price});
}
