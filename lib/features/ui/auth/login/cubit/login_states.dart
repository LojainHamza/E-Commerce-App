import 'package:e_commerce_app/core/errors/failures.dart';
import 'package:e_commerce_app/domain/entities/LoginResponseEntity.dart';

abstract class LoginStates {}

class LoginInitialState extends LoginStates {}

class LoginLoadingState extends LoginStates {}

class LoginErrorState extends LoginStates {
  Failures errors;

  LoginErrorState({required this.errors});
}

class LoginSuccessState extends LoginStates {
  LoginResponseEntity responseEntity;

  LoginSuccessState({required this.responseEntity});
}
