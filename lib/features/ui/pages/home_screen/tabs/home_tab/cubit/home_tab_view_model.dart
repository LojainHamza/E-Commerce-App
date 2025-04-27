import 'package:e_commerce_app/core/utils/app_assets.dart';
import 'package:e_commerce_app/domain/entities/CategoryOrBrandResponseEntity.dart';
import 'package:e_commerce_app/domain/use_cases/get_all_brands_use_case.dart';
import 'package:e_commerce_app/domain/use_cases/get_all_categories_use_case.dart';
import 'package:e_commerce_app/features/ui/pages/home_screen/tabs/home_tab/cubit/home_tab_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class HomeTabViewModel extends Cubit<HomeTabStates> {
  GetAllCategoriesUseCase getAllCategoriesUseCase;
  GetAllBrandsUseCase getAllBrandsUseCase;

  HomeTabViewModel(
      {required this.getAllCategoriesUseCase,
      required this.getAllBrandsUseCase})
      : super(HomeTabInitialState());

  // todo: hold data - handle logic
  List<CategoryOrBrandEntity> categoriesList = [];
  List<CategoryOrBrandEntity> brandsList = [];
  List<String> imagesList = [
    AppAssets.advertisement1,
    AppAssets.advertisement2,
    AppAssets.advertisement3,
  ];

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

  void getAllBrands() async {
    emit(BrandLoadingState());
    var either = await getAllBrandsUseCase.invoke();
    return either.fold((error) {
      emit(BrandErrorState(failures: error));
    }, (response) {
      brandsList = response.data!;
      emit(BrandSuccessState(brandResponseEntity: response));
    });
  }
}
