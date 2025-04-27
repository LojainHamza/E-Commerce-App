import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/errors/failures.dart';
import 'package:e_commerce_app/domain/entities/GetUserWishlistResponseEntity.dart';
import 'package:e_commerce_app/domain/repositories/wishlist/wishlist_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetUserWishlistUseCase {
  WishlistRepository wishlistRepository;

  GetUserWishlistUseCase({required this.wishlistRepository});

  Future<Either<Failures, GetUserWishlistResponseEntity>> invoke() {
    return wishlistRepository.getUserWishlist();
  }
}
