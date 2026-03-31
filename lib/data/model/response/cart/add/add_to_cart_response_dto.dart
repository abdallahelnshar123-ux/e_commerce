import 'package:json_annotation/json_annotation.dart';

import 'add_cart_dto.dart';

part 'add_to_cart_response_dto.g.dart';

@JsonSerializable()
class AddToCartResponseDto {
  @JsonKey(name: "status")
  final String? status;
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "numOfCartItems")
  final int? numOfCartItems;
  @JsonKey(name: "cartId")
  final String? cartId;
  @JsonKey(name: "data")
  final AddCartDto? data;

  AddToCartResponseDto ({
    this.status,
    this.message,
    this.numOfCartItems,
    this.cartId,
    this.data,
  });

  factory AddToCartResponseDto.fromJson(Map<String, dynamic> json) {
    return _$AddToCartResponseDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$AddToCartResponseDtoToJson(this);
  }
}




