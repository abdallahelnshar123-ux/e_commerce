import 'package:e_commerce/api/api_services.dart';
import 'package:e_commerce/api/mapper/category_brand/category_brand_mapper.dart';
import 'package:e_commerce/data/data_sources/remote/category/category_remote_data_source.dart';
import 'package:e_commerce/domain/entities/response/common/category_brand.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: CategoryRemoteDataSource)
class CategoryRemoteDataSourceImpl implements CategoryRemoteDataSource {
  final ApiServices _apiServices;

  CategoryRemoteDataSourceImpl(this._apiServices);

  @override
  Future<List<CategoryOrBrand>?> getAllCategories() async {
    var categoryResponse = await _apiServices.getAllCategories();
    return categoryResponse.data
        ?.map((catDto) => catDto.toCategoryOrBrand())
        .toList();
  }
}
