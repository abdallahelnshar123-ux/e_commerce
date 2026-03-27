import 'package:e_commerce/domain/entities/response/common/category_brand.dart';

sealed class HomeTabStates {}
class HomeTabInitState extends HomeTabStates{}
class CategoryLoadingState extends HomeTabStates{}
class CategorySuccessState extends HomeTabStates{
  List<CategoryOrBrand> categoriesList;
  CategorySuccessState({required this.categoriesList});

}
class CategoryErrorState extends HomeTabStates{
  String errorMessage;
  CategoryErrorState({required this.errorMessage});
}
