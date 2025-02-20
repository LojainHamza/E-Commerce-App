import 'package:e_commerce_app/domain/entities/CartResponseEntity.dart';
import 'package:e_commerce_app/domain/use_cases/delete_items_in_cart_use_case.dart';
import 'package:e_commerce_app/domain/use_cases/get_items_in_cart_use_case.dart';
import 'package:e_commerce_app/features/ui/pages/cart_screen/cubit/cart_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class CartViewModel extends Cubit<CartStates> {
  GetItemsInCartUseCase getItemsInCartUseCase;
  DeleteItemsInCartUseCase deleteItemsInCartUseCase;

  CartViewModel(
      {required this.getItemsInCartUseCase,
      required this.deleteItemsInCartUseCase})
      : super(CartLoadingState());

  // TODO: hold data - handle logic
  List<CartProductEntity> productsList = [];

  static CartViewModel get(context) => BlocProvider.of<CartViewModel>(context);

  void getItemsInCart() async {
    emit(CartLoadingState());
    var either = await getItemsInCartUseCase.invoke();
    either.fold((error) {
      emit(CartErrorState(failures: error));
    }, (response) {
      productsList = response.data!.products!;
      emit(CartSuccessState(responseEntity: response));
    });
  }

  void deleteItemsInCart(String productId) async {
    var either = await deleteItemsInCartUseCase.invoke(productId);
    either.fold((error) {
      emit(CartErrorState(failures: error));
    }, (response) {
      // productsList = response.data!.products!;
      emit(CartSuccessState(responseEntity: response));
    });
  }
}
