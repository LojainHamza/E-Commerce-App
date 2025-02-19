import 'package:e_commerce_app/core/errors/failures.dart';
import 'package:e_commerce_app/domain/entities/GetCartResponseEntity.dart';

abstract class CartStates {}

class GetCartLoadingState implements CartStates {}

class GetCartErrorState implements CartStates {
  Failures failures;

  GetCartErrorState({required this.failures});
}

class GetCartSuccessState implements CartStates {
  GetCartResponseEntity responseEntity;

  GetCartSuccessState({required this.responseEntity});
}
