// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_or_remove_product_to_wishlist_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddOrRemoveProductToWishlistResponseDto
_$AddOrRemoveProductToWishlistResponseDtoFromJson(Map<String, dynamic> json) =>
    AddOrRemoveProductToWishlistResponseDto(
      status: json['status'] as String?,
      message: json['message'] as String?,
      data: (json['data'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$AddOrRemoveProductToWishlistResponseDtoToJson(
  AddOrRemoveProductToWishlistResponseDto instance,
) => <String, dynamic>{
  'status': instance.status,
  'message': instance.message,
  'data': instance.data,
};
