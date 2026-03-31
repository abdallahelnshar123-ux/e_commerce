// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_to_cart_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddToCartResponseDto _$AddToCartResponseDtoFromJson(
  Map<String, dynamic> json,
) => AddToCartResponseDto(
  status: json['status'] as String?,
  message: json['message'] as String?,
  numOfCartItems: (json['numOfCartItems'] as num?)?.toInt(),
  cartId: json['cartId'] as String?,
  data: json['data'] == null
      ? null
      : AddCartDto.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$AddToCartResponseDtoToJson(
  AddToCartResponseDto instance,
) => <String, dynamic>{
  'status': instance.status,
  'message': instance.message,
  'numOfCartItems': instance.numOfCartItems,
  'cartId': instance.cartId,
  'data': instance.data,
};
