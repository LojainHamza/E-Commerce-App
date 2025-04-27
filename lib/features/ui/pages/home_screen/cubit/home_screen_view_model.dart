import 'package:e_commerce_app/features/ui/pages/home_screen/cubit/home_screen_states.dart';
import 'package:e_commerce_app/features/ui/pages/home_screen/tabs/favorite_tab/favorite_tab.dart';
import 'package:e_commerce_app/features/ui/pages/home_screen/tabs/home_tab/home_tab.dart';
import 'package:e_commerce_app/features/ui/pages/home_screen/tabs/product_tab/product_tab.dart';
import 'package:e_commerce_app/features/ui/pages/home_screen/tabs/profile_tab/profile_tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreenViewModel extends Cubit<HomeScreenStates> {
  HomeScreenViewModel() :super(HomeScreenInitialState());

  // todo: hold data - handle logic
  int selectedIndex = 0;
  List<Widget> bodyList = [
    HomeTab(),
    ProductTab(),
    FavoriteTab(),
    ProfileTab()
  ];

  void bottomNavOnTap(int index) {
    selectedIndex = index;
    emit(HomeScreenChangeSelectedIndexState());
  }
}