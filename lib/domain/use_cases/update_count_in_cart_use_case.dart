import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/errors/failures.dart';
import 'package:e_commerce_app/domain/entities/CartResponseEntity.dart';
import 'package:e_commerce_app/domain/repositories/cart/cart_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class UpdateCountInCartUseCase {
  CartRepository cartRepository;

  UpdateCountInCartUseCase({required this.cartRepository});

  Future<Either<Failures, CartResponseEntity>> invoke(
      String productId, int count) {
    return cartRepository.updateCountInCart(productId, count);
  }
}
