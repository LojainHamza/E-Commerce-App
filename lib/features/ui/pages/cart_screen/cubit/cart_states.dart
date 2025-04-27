import 'package:e_commerce_app/core/errors/failures.dart';
import 'package:e_commerce_app/domain/entities/CartResponseEntity.dart';

abstract class CartStates {}

class CartLoadingState implements CartStates {}

class CartErrorState implements CartStates {
  Failures failures;

  CartErrorState({required this.failures});
}

class CartSuccessState implements CartStates {
  CartResponseEntity responseEntity;

  CartSuccessState({required this.responseEntity});
}
