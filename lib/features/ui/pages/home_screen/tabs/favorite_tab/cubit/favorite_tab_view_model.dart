import 'package:e_commerce_app/domain/use_cases/add_product_to_wishlist_use_case.dart';
import 'package:e_commerce_app/domain/use_cases/get_user_wishlist_use_case.dart';
import 'package:e_commerce_app/domain/use_cases/remove_product_from_wishlist_use_case.dart';
import 'package:e_commerce_app/features/ui/pages/home_screen/tabs/favorite_tab/cubit/favorite_tab_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class FavoriteTabViewModel extends Cubit<GetUserWishlistStates> {
  GetUserWishlistUseCase wishlistUseCase;
  AddProductToWishlistUseCase addProductToWishlistUseCase;
  RemoveProductFromWishlistUseCase removeProductFromWishlistUseCase;

  FavoriteTabViewModel({
    required this.wishlistUseCase,
    required this.addProductToWishlistUseCase,
    required this.removeProductFromWishlistUseCase,
  }) : super(GetUserWishlistLoadingState());

  static FavoriteTabViewModel get(context) =>
      BlocProvider.of<FavoriteTabViewModel>(context);

  void getUserWishlist() async {
    emit(GetUserWishlistLoadingState());
    var either = await wishlistUseCase.invoke();
    either.fold((error) {
      emit(GetUserWishlistErrorState(failures: error));
    }, (response) {
      emit(GetUserWishlistSuccessState(responseEntity: response));
    });
  }

  Future<void> addProductToWishlist(String productId) async {
    emit(AddToWishlistLoadingState());
    var either = await addProductToWishlistUseCase.invoke(productId);
    either.fold((error) {
      emit(AddToWishlistErrorState(failures: error));
    }, (response) {
      emit(AddToWishlistSuccessState(addProductResponseEntity: response));
      getUserWishlist();
    });
  }

  Future<void> removeProductFromWishlist(String productId) async {
    emit(RemoveFromWishlistLoadingState());
    var either = await removeProductFromWishlistUseCase.invoke(productId);
    either.fold((error) {
      emit(RemoveFromWishlistErrorState(failures: error));
    }, (response) {
      emit(RemoveFromWishlistSuccessState(
          removeProductResponseEntity: response));
      getUserWishlist();
    });
  }
}
