import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/errors/failures.dart';
import 'package:e_commerce_app/domain/entities/AddOrRemoveProductWishlistEntity.dart';
import 'package:e_commerce_app/domain/entities/GetUserWishlistResponseEntity.dart';
import 'package:e_commerce_app/domain/repositories/data_sources/remote_data_sources/wishlist_remote_data_source.dart';
import 'package:e_commerce_app/domain/repositories/wishlist/wishlist_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: WishlistRepository)
class WishlistRepositoryImpl implements WishlistRepository {
  WishlistRemoteDataSource wishlistRemoteDataSource;

  WishlistRepositoryImpl({required this.wishlistRemoteDataSource});

  @override
  Future<Either<Failures, GetUserWishlistResponseEntity>>
      getUserWishlist() async {
    var either = await wishlistRemoteDataSource.getUserWishlist();
    return either.fold((error) => Left(error), (response) => Right(response));
  }

  @override
  Future<Either<Failures, AddOrRemoveProductWishlistEntity>>
      addProductToWishlist(String productId) async {
    var either = await wishlistRemoteDataSource.addProductToWishlist(productId);
    return either.fold((error) => Left(error), (response) => Right(response));
  }

  @override
  Future<Either<Failures, AddOrRemoveProductWishlistEntity>>
      removeProductFromWishlist(String productId) async {
    var either =
        await wishlistRemoteDataSource.removeProductFromWishlist(productId);
    return either.fold((error) => Left(error), (response) => Right(response));
  }
}
