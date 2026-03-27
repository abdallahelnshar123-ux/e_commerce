import 'package:e_commerce/domain/repository/brand/brand_repository.dart';
import 'package:injectable/injectable.dart';

import '../entities/response/common/category_brand.dart';

@injectable
class GetAllBrandsUseCase {
  final BrandRepository _brandRepository;

  GetAllBrandsUseCase( this._brandRepository);

  Future<List<CategoryOrBrand>?> invoke() {
    return _brandRepository.getAllBrands();
  }
}
