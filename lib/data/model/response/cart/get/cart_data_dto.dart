import 'package:e_commerce/data/model/response/cart/get/product_data_dto.dart';
import 'package:json_annotation/json_annotation.dart';
part 'cart_data_dto.g.dart';

@JsonSerializable()
class CartDataDto {
  @JsonKey(name: "_id")
  final String? id;
  @JsonKey(name: "cartOwner")
  final String? cartOwner;
  @JsonKey(name: "products")
  final List<ProductDataDto>? productData;
  @JsonKey(name: "createdAt")
  final String? createdAt;
  @JsonKey(name: "updatedAt")
  final String? updatedAt;
  @JsonKey(name: "__v")
  final int? v;
  @JsonKey(name: "totalCartPrice")
  final int? totalCartPrice;

  CartDataDto ({
    this.id,
    this.cartOwner,
    this.productData,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.totalCartPrice,
  });

  factory CartDataDto.fromJson(Map<String, dynamic> json) {
    return _$CartDataDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$CartDataDtoToJson(this);
  }
}