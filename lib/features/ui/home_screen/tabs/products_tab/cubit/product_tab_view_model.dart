import 'package:e_commerce/core/exceptions/app_exceptions.dart';
import 'package:e_commerce/domain/use_cases/get_all_products_use_case.dart';
import 'package:e_commerce/features/ui/home_screen/tabs/products_tab/cubit/product_tab_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class ProductTabViewModel extends Cubit<ProductTabStates> {
  final GetAllProductsUseCase _allProductsUseCase;

  ProductTabViewModel(this._allProductsUseCase) : super(ProductInitState());

  void getAllProducts() async {
    try {
      emit(ProductLoadingState());
      var productsList = await _allProductsUseCase.invoke();
      if (productsList != null) {
        emit(ProductSuccessState(productsList: productsList));
      } else {
        emit(
          ProductErrorState(errorMessage: 'Sorry we could not load Products '),
        );
      }
    } on AppException catch (e) {
      ProductErrorState(errorMessage: e.message);
    }
  }
}
