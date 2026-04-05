import 'package:json_annotation/json_annotation.dart';

part 'add_or_remove_product_to_wishlist_response_dto.g.dart';

@JsonSerializable()
class AddOrRemoveProductToWishlistResponseDto {
  @JsonKey(name: "status")
  final String? status;
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "data")
  final List<String>? data;

  AddOrRemoveProductToWishlistResponseDto ({
    this.status,
    this.message,
    this.data,
  });

  factory AddOrRemoveProductToWishlistResponseDto.fromJson(Map<String, dynamic> json) {
    return _$AddOrRemoveProductToWishlistResponseDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$AddOrRemoveProductToWishlistResponseDtoToJson(this);
  }
}


