import 'package:e_commerce_app/core/errors/failures.dart';
import 'package:e_commerce_app/domain/entities/CategoryOrBrandResponseEntity.dart';

abstract class HomeTabStates {}

class HomeTabInitialState implements HomeTabStates {}

class CategoryLoadingState implements HomeTabStates {}

class CategoryErrorState implements HomeTabStates {
  Failures failures;
  CategoryErrorState({required this.failures});
}

class CategorySuccessState implements HomeTabStates {
  CategoryOrBrandResponseEntity categoryResponseEntity;
  CategorySuccessState({required this.categoryResponseEntity});
}

class BrandLoadingState implements HomeTabStates {}

class BrandErrorState implements HomeTabStates {
  Failures failures;

  BrandErrorState({required this.failures});
}

class BrandSuccessState implements HomeTabStates {
  CategoryOrBrandResponseEntity brandResponseEntity;

  BrandSuccessState({required this.brandResponseEntity});
}
