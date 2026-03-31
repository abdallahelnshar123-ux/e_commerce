import 'package:e_commerce/data/data_sources/remote/cart/add/add_to_cart_remote_data_source.dart';
import 'package:e_commerce/domain/entities/response/cart/add/add_to_cart_response.dart';
import 'package:e_commerce/domain/repository/cart/add/add_to_cart_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: AddToCartRepository)
class AddToCartRepositoryImpl implements AddToCartRepository {
  final AddToCartRemoteDataSource _addToCartRemoteDataSource;

  AddToCartRepositoryImpl(this._addToCartRemoteDataSource);

  @override
  Future<AddToCartResponse> addProductToCart(String productId) {
    return _addToCartRemoteDataSource.addProductToCart(productId);
  }
}
