import 'package:e_commerce_app/domain/entities/CategoryResponseEntity.dart';
import 'package:e_commerce_app/domain/use_cases/get_all_categories_use_case.dart';
import 'package:e_commerce_app/features/ui/pages/home_screen/tabs/home_tab/cubit/home_tab_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class HomeTabViewModel extends Cubit<HomeTabStates> {
  GetAllCategoriesUseCase getAllCategoriesUseCase;

  HomeTabViewModel({required this.getAllCategoriesUseCase})
      : super(HomeTabInitialState());

  // todo: hold data - handle logic
  List<CategoryEntity> categoriesList = [];

  void getAllCategories() async {
    emit(CategoryLoadingState());
    var either = await getAllCategoriesUseCase.invoke();
    return either.fold((error) {
      emit(CategoryErrorState(failures: error));
    }, (response) {
      categoriesList = response.data!;
      emit(CategorySuccessState(categoryResponseEntity: response));
    });
  }
}
