import 'package:e_commerce/domain/repository/category/category_repository.dart';
import 'package:injectable/injectable.dart';

import '../entities/response/common/category_brand.dart';

@injectable
class GetAllCategoriesUseCase {
  final CategoryRepository _categoryRepository;

  GetAllCategoriesUseCase( this._categoryRepository);

  Future<List<CategoryOrBrand>?> invoke() {
    return _categoryRepository.getAllCategories();
  }
}
