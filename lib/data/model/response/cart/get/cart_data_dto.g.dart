// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_data_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CartDataDto _$CartDataDtoFromJson(Map<String, dynamic> json) => CartDataDto(
  id: json['_id'] as String?,
  cartOwner: json['cartOwner'] as String?,
  productData: (json['products'] as List<dynamic>?)
      ?.map((e) => ProductDataDto.fromJson(e as Map<String, dynamic>))
      .toList(),
  createdAt: json['createdAt'] as String?,
  updatedAt: json['updatedAt'] as String?,
  v: (json['__v'] as num?)?.toInt(),
  totalCartPrice: (json['totalCartPrice'] as num?)?.toInt(),
);

Map<String, dynamic> _$CartDataDtoToJson(CartDataDto instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'cartOwner': instance.cartOwner,
      'products': instance.productData,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      '__v': instance.v,
      'totalCartPrice': instance.totalCartPrice,
    };
