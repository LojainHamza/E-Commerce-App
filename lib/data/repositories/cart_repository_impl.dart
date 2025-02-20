import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/errors/failures.dart';
import 'package:e_commerce_app/domain/entities/CartResponseEntity.dart';
import 'package:e_commerce_app/domain/repositories/cart/cart_repository.dart';
import 'package:e_commerce_app/domain/repositories/data_sources/remote_data_sources/cart_remote_data_source.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: CartRepository)
class CartRepositoryImpl implements CartRepository {
  CartRemoteDataSource cartRemoteDataSource;

  CartRepositoryImpl({required this.cartRemoteDataSource});

  @override
  Future<Either<Failures, CartResponseEntity>> getItemInCart() async {
    var either = await cartRemoteDataSource.getItemInCart();
    return either.fold((error) => Left(error), (response) => Right(response));
  }

  @override
  Future<Either<Failures, CartResponseEntity>> deleteItemsInCart(
      String productId) async {
    var either = await cartRemoteDataSource.deleteItemsInCart(productId);
    return either.fold((error) => Left(error), (response) => Right(response));
  }

  @override
  Future<Either<Failures, CartResponseEntity>> updateCountInCart(
      String productId, int count) async {
    var either = await cartRemoteDataSource.updateCountInCart(productId, count);
    return either.fold((error) => Left(error), (response) => Right(response));
  }
}
