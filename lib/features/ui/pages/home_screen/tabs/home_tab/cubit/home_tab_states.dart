import 'package:e_commerce_app/core/errors/failures.dart';
import 'package:e_commerce_app/domain/entities/CategoryResponseEntity.dart';

abstract class HomeTabStates {}

class HomeTabInitialState implements HomeTabStates {}

class CategoryLoadingState implements HomeTabStates {}

class CategoryErrorState implements HomeTabStates {
  Failures failures;

  CategoryErrorState({required this.failures});
}

class CategorySuccessState implements HomeTabStates {
  CategoryResponseEntity categoryResponseEntity;

  CategorySuccessState({required this.categoryResponseEntity});
}
// class BrandLoadingState implements HomeTabStates{}
// class BrandErrorState implements HomeTabStates{}
// class BrandSuccessState implements HomeTabStates{}
