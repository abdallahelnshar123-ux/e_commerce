import 'package:dio/dio.dart';
import 'package:e_commerce/data/data_sources/remote/brand/category_remote_data_source.dart';
import 'package:e_commerce/domain/entities/response/common/category_brand.dart';
import 'package:e_commerce/domain/repository/brand/brand_repository.dart';
import 'package:injectable/injectable.dart';

import '../../../core/exceptions/app_exceptions.dart';

@Injectable(as:BrandRepository )
class BrandRepositoryImpl implements BrandRepository{
  final BrandRemoteDataSource _brandRemoteDataSource;
  BrandRepositoryImpl(this._brandRemoteDataSource);
  @override
  Future<List<CategoryOrBrand>?> getAllBrands() {
    try {
      return _brandRemoteDataSource.getAllBrands();
    } on DioException catch (e) {
      String message = (e.error as AppException).message;
      throw ServerException(message: message);
    }

  }
}