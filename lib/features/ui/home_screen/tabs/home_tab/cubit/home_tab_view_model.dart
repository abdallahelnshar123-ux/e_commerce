import 'package:e_commerce/core/exceptions/app_exceptions.dart';
import 'package:e_commerce/domain/use_cases/get_all_categories_use_case.dart';
import 'package:e_commerce/features/ui/home_screen/tabs/home_tab/cubit/home_tab_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class HomeTabViewModel extends Cubit<HomeTabStates> {
  final GetAllCategoriesUseCase _getAllCategoriesUseCase;

  HomeTabViewModel(this._getAllCategoriesUseCase) : super(HomeTabInitState());

  void getAllCategories() async {
    try {
      emit(CategoryLoadingState());
      var categoriesList = await _getAllCategoriesUseCase.invoke();
      if (categoriesList != null) {
        emit(CategorySuccessState(categoriesList: categoriesList));
      } else {
        emit(
          CategoryErrorState(
            errorMessage: 'Sorry We could not load categories',
          ),
        );
      }
    } on AppException catch (e) {
      emit(CategoryErrorState(errorMessage: e.message));
    }
  }
}
