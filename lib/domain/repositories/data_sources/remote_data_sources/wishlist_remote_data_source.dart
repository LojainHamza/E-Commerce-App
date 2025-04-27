import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/errors/failures.dart';
import 'package:e_commerce_app/domain/entities/AddOrRemoveProductWishlistEntity.dart';
import 'package:e_commerce_app/domain/entities/GetUserWishlistResponseEntity.dart';

abstract class WishlistRemoteDataSource {
  Future<Either<Failures, GetUserWishlistResponseEntity>> getUserWishlist();

  Future<Either<Failures, AddOrRemoveProductWishlistEntity>>
      addProductToWishlist(String productId);

  Future<Either<Failures, AddOrRemoveProductWishlistEntity>>
      removeProductFromWishlist(String productId);
}
