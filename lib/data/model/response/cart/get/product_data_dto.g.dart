// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_data_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductDataDto _$ProductDataDtoFromJson(Map<String, dynamic> json) =>
    ProductDataDto(
      count: (json['count'] as num?)?.toInt(),
      id: json['_id'] as String?,
      product: json['product'] == null
          ? null
          : ProductDto.fromJson(json['product'] as Map<String, dynamic>),
      price: (json['price'] as num?)?.toInt(),
    );

Map<String, dynamic> _$ProductDataDtoToJson(ProductDataDto instance) =>
    <String, dynamic>{
      'count': instance.count,
      '_id': instance.id,
      'product': instance.product,
      'price': instance.price,
    };
