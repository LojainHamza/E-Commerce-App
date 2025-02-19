import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/errors/failures.dart';
import 'package:e_commerce_app/domain/entities/GetCartResponseEntity.dart';
import 'package:e_commerce_app/domain/repositories/cart/cart_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetItemsInCartUseCase {
  CartRepository cartRepository;

  GetItemsInCartUseCase({required this.cartRepository});

  Future<Either<Failures, GetCartResponseEntity>> invoke() {
    return cartRepository.getItemInCart();
  }
}
