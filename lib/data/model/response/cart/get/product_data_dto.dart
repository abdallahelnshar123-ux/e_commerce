import 'package:e_commerce/data/model/response/product/product_dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'product_data_dto.g.dart';

@JsonSerializable()
class ProductDataDto {
  @JsonKey(name: "count")
  final int? count;
  @JsonKey(name: "_id")
  final String? id;
  @JsonKey(name: "product")
  final ProductDto? product;
  @JsonKey(name: "price")
  final int? price;

  ProductDataDto ({
    this.count,
    this.id,
    this.product,
    this.price,
  });

  factory ProductDataDto.fromJson(Map<String, dynamic> json) {
    return _$ProductDataDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$ProductDataDtoToJson(this);
  }
}