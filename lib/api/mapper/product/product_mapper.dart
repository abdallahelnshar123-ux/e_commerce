import 'package:e_commerce/api/mapper/category_brand/category_brand_mapper.dart';
import 'package:e_commerce/api/mapper/product/subcategory_mapper.dart';
import 'package:e_commerce/data/model/response/product/product_dto.dart';
import 'package:e_commerce/domain/entities/response/product/product.dart';

extension ProductMapper on ProductDto {
  Product toProduct() {
    return Product(
      slug: slug,
      id: id,
      title: title,
      brand: brand?.toCategoryOrBrand(),
      category: category?.toCategoryOrBrand(),
      createdAt: createdAt,
      description: description,
      imageCover: imageCover,
      images: images,
      price: price,
      quantity: quantity,
      ratingsAverage: ratingsAverage,
      ratingsQuantity: ratingsQuantity,
      sold: sold,
      subcategory: subcategory!
          .map((subCatDto) => subCatDto.toSubcategory())
          .toList(),
      updatedAt: updatedAt,
    );
  }
}
