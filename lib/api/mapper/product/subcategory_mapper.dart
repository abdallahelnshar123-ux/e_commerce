import 'package:e_commerce/data/model/response/product/subcategory_dto.dart';
import 'package:e_commerce/domain/entities/response/product/subcategory.dart';

extension SubcategoryMapper on SubcategoryDto {
  Subcategory toSubcategory() {
    return Subcategory(category: category, id: id, slug: slug, name: name);
  }
}
