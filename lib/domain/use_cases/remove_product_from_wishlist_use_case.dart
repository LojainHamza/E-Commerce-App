import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/errors/failures.dart';
import 'package:e_commerce_app/domain/entities/AddOrRemoveProductWishlistEntity.dart';
import 'package:e_commerce_app/domain/repositories/wishlist/wishlist_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class RemoveProductFromWishlistUseCase {
  WishlistRepository wishlistRepository;

  RemoveProductFromWishlistUseCase({required this.wishlistRepository});

  Future<Either<Failures, AddOrRemoveProductWishlistEntity>> invoke(
      String productId) {
    return wishlistRepository.removeProductFromWishlist(productId);
  }
}
