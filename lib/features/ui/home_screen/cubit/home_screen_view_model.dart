import 'package:e_commerce/features/ui/home_screen/cubit/home_screen_states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../tabs/favorite_tab/favorite_tab.dart';
import '../tabs/home_tab/home_tab.dart';
import '../tabs/products_tab/products_tab.dart';
import '../tabs/user_tab/user_tab.dart';

@injectable
class HomeScreenViewModel extends Cubit<HomeScreenStates>{
  HomeScreenViewModel():super(HomeInitState());
  final List<Widget> tabsList = [
    HomeTab(),
    ProductsTab(),
    FavoriteTab(),
    UserTab(),
  ];

   int selectedTabIndex = 1;
  void changeIndex(int index){
    if(selectedTabIndex != index){
      selectedTabIndex = index;
    }
    emit(HomeChangeIndexState());

  }
}