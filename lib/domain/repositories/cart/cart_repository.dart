import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/errors/failures.dart';
import 'package:e_commerce_app/domain/entities/CartResponseEntity.dart';

abstract class CartRepository {
  Future<Either<Failures, CartResponseEntity>> getItemInCart();

  Future<Either<Failures, CartResponseEntity>> deleteItemsInCart(
      String productId);
}
