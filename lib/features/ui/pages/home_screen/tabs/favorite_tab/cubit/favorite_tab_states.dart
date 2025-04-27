import 'package:e_commerce_app/core/errors/failures.dart';
import 'package:e_commerce_app/domain/entities/AddOrRemoveProductWishlistEntity.dart';
import 'package:e_commerce_app/domain/entities/GetUserWishlistResponseEntity.dart';

abstract class GetUserWishlistStates {}

class GetUserWishlistLoadingState implements GetUserWishlistStates {}

class GetUserWishlistErrorState implements GetUserWishlistStates {
  Failures failures;

  GetUserWishlistErrorState({required this.failures});
}

class GetUserWishlistSuccessState implements GetUserWishlistStates {
  GetUserWishlistResponseEntity responseEntity;

  GetUserWishlistSuccessState({required this.responseEntity});
}

class AddToWishlistLoadingState implements GetUserWishlistStates {}

class AddToWishlistErrorState implements GetUserWishlistStates {
  Failures failures;

  AddToWishlistErrorState({required this.failures});
}

class AddToWishlistSuccessState implements GetUserWishlistStates {
  AddOrRemoveProductWishlistEntity addProductResponseEntity;

  AddToWishlistSuccessState({required this.addProductResponseEntity});
}

class RemoveFromWishlistLoadingState implements GetUserWishlistStates {}

class RemoveFromWishlistErrorState implements GetUserWishlistStates {
  Failures failures;

  RemoveFromWishlistErrorState({required this.failures});
}

class RemoveFromWishlistSuccessState implements GetUserWishlistStates {
  AddOrRemoveProductWishlistEntity removeProductResponseEntity;

  RemoveFromWishlistSuccessState({required this.removeProductResponseEntity});
}
