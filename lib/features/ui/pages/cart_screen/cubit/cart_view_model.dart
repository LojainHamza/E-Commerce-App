import 'package:e_commerce_app/domain/entities/GetCartResponseEntity.dart';
import 'package:e_commerce_app/domain/use_cases/get_items_in_cart_use_case.dart';
import 'package:e_commerce_app/features/ui/pages/cart_screen/cubit/cart_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class CartViewModel extends Cubit<CartStates> {
  GetItemsInCartUseCase getItemsInCartUseCase;

  CartViewModel({required this.getItemsInCartUseCase})
      : super(GetCartLoadingState());

  // TODO: hold data - handle logic
  List<GetProductEntity> productsList = [];

  void getItemsInCart() async {
    emit(GetCartLoadingState());
    var either = await getItemsInCartUseCase.invoke();
    either.fold((error) {
      emit(GetCartErrorState(failures: error));
    }, (response) {
      productsList = response.data!.products!;
      emit(GetCartSuccessState(responseEntity: response));
    });
  }
}
