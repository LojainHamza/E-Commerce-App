import 'package:e_commerce_app/domain/entities/ProductResponseEntity.dart';
import 'package:e_commerce_app/domain/use_cases/add_to_cart_use_case.dart';
import 'package:e_commerce_app/domain/use_cases/get_all_products_use_case.dart';
import 'package:e_commerce_app/features/ui/pages/home_screen/tabs/product_tab/cubit/product_tab_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class ProductTabViewModel extends Cubit<ProductTabStates> {
  GetAllProductsUseCase productsUseCase;
  AddToCartUseCase addToCartUseCase;

  ProductTabViewModel(
      {required this.productsUseCase, required this.addToCartUseCase})
      : super(ProductTabInitialState());

  // TODO: Hold data - handle logic
  List<ProductEntity> productsList = [];
  int numberOfCartItems = 0;
  ProductTabStates? lastToastState;

  static ProductTabViewModel get(context) =>
      BlocProvider.of<ProductTabViewModel>(
          context); // creates object from viewModel

  void getAllProducts() async {
    emit(ProductTabLoadingState());
    var either = await productsUseCase.invoke();
    either.fold((error) {
      emit(ProductTabErrorState(failures: error));
    }, (response) {
      productsList = response.data!;
      emit(ProductTabSuccessState(responseEntity: response));
    });
  }

  void addToCart(String productId) async {
    emit(AddToCartLoadingState());
    var either = await addToCartUseCase.invoke(productId);
    either.fold((error) {
      emit(AddToCartErrorState(failures: error));
    }, (response) {
      numberOfCartItems = response.numOfCartItems!.toInt();
      print('numberOfCartItems: $numberOfCartItems');
      emit(AddToCartSuccessState(responseEntity: response));
    });
  }
}
