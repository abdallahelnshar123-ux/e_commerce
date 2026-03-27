import '../common/category_brand.dart';
import '../common/meta_data.dart';

class CategoryOrBrandResponseDto {
  final int? results;

  final Metadata? metadata;

  final List<CategoryOrBrand>? data;

  CategoryOrBrandResponseDto({this.results, this.metadata, this.data});
}
