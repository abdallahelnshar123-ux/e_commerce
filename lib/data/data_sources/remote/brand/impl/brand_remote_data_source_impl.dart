import 'package:e_commerce/api/mapper/category_brand/category_brand_mapper.dart';
import 'package:e_commerce/data/data_sources/remote/brand/category_remote_data_source.dart';
import 'package:e_commerce/domain/entities/response/common/category_brand.dart';
import 'package:injectable/injectable.dart';

import '../../../../../api/api_services.dart';

@Injectable(as: BrandRemoteDataSource)
class BrandRemoteDataSourceImpl implements BrandRemoteDataSource {
  final ApiServices _apiServices;

  BrandRemoteDataSourceImpl(this._apiServices);

  @override
  Future<List<CategoryOrBrand>?> getAllBrands() async {
    var brandResponse = await _apiServices.getAllBrands();
    return brandResponse.data
        ?.map((brandDto) => brandDto.toCategoryOrBrand())
        .toList();
  }
}
