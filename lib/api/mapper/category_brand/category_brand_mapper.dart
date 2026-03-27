import 'package:e_commerce/data/model/response/common/category_brand_dto.dart';
import 'package:e_commerce/domain/entities/response/common/category_brand.dart';

extension CategoryBrandMapper on CategoryBrandDto {
  CategoryOrBrand toCategoryOrBrand() {
    return CategoryOrBrand(name: name, image: image, id: id, slug: slug);
  }
}


