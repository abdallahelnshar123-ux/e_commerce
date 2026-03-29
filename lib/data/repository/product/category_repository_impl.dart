import 'package:e_commerce/data/data_sources/remote/category/category_remote_data_source.dart';
import 'package:e_commerce/data/data_sources/remote/product/product_remote_data_source.dart';
import 'package:e_commerce/domain/entities/response/product/product.dart';
import 'package:e_commerce/domain/repository/product/product_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ProductRepository)
class ProductRepositoryImpl implements ProductRepository {
  final ProductRemoteDataSource _productRemoteDataSource;

  ProductRepositoryImpl(this._productRemoteDataSource);

  @override
  Future<List<Product>?> getAllProducts() {
    return _productRemoteDataSource.getAllProducts();
  }
}