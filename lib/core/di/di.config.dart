// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../data/data_sources/remote_data_sources/auth_remote_data_source_impl.dart'
    as _i1057;
import '../../data/data_sources/remote_data_sources/cart_remote_data_source_impl.dart'
    as _i1008;
import '../../data/data_sources/remote_data_sources/home_remote_data_source_impl.dart'
    as _i868;
import '../../data/repositories/auth_repository_impl.dart' as _i895;
import '../../data/repositories/cart_repository_impl.dart' as _i915;
import '../../data/repositories/home_repository_impl.dart' as _i514;
import '../../domain/repositories/auth/auth_repository.dart' as _i660;
import '../../domain/repositories/cart/cart_repository.dart' as _i388;
import '../../domain/repositories/data_sources/remote_data_sources/auth_remote_data_source.dart'
    as _i327;
import '../../domain/repositories/data_sources/remote_data_sources/cart_remote_data_source.dart'
    as _i629;
import '../../domain/repositories/data_sources/remote_data_sources/home_remote_data_source.dart'
    as _i923;
import '../../domain/repositories/home/home_repository.dart' as _i22;
import '../../domain/use_cases/add_to_cart_use_case.dart' as _i1024;
import '../../domain/use_cases/get_all_brands_use_case.dart' as _i773;
import '../../domain/use_cases/get_all_categories_use_case.dart' as _i201;
import '../../domain/use_cases/get_all_products_use_case.dart' as _i939;
import '../../domain/use_cases/get_items_in_cart_use_case.dart' as _i315;
import '../../domain/use_cases/login_use_case.dart' as _i471;
import '../../domain/use_cases/register_use_case.dart' as _i479;
import '../../features/ui/auth/login/cubit/login_view_model.dart' as _i245;
import '../../features/ui/auth/register/cubit/register_view_model.dart'
    as _i873;
import '../../features/ui/pages/cart_screen/cubit/cart_view_model.dart' as _i98;
import '../../features/ui/pages/home_screen/tabs/home_tab/cubit/home_tab_view_model.dart'
    as _i524;
import '../../features/ui/pages/home_screen/tabs/product_tab/cubit/product_tab_view_model.dart'
    as _i13;
import '../api/api_manager.dart' as _i1047;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.singleton<_i1047.ApiManager>(() => _i1047.ApiManager());
    gh.factory<_i923.HomeRemoteDataSource>(() =>
        _i868.HomeRemoteDataSourceImpl(apiManager: gh<_i1047.ApiManager>()));
    gh.factory<_i629.CartRemoteDataSource>(() =>
        _i1008.CartRemoteDataSourceImpl(apiManager: gh<_i1047.ApiManager>()));
    gh.factory<_i327.AuthRemoteDataSource>(() =>
        _i1057.AuthRemoteDataSourceImpl(apiManager: gh<_i1047.ApiManager>()));
    gh.factory<_i388.CartRepository>(() => _i915.CartRepositoryImpl(
        cartRemoteDataSource: gh<_i629.CartRemoteDataSource>()));
    gh.factory<_i22.HomeRepository>(() => _i514.HomeRepositoryImpl(
        homeRemoteDataSource: gh<_i923.HomeRemoteDataSource>()));
    gh.factory<_i660.AuthRepository>(() => _i895.AuthRepositoryImpl(
        authRemoteDataSource: gh<_i327.AuthRemoteDataSource>()));
    gh.factory<_i315.GetItemsInCartUseCase>(() => _i315.GetItemsInCartUseCase(
        cartRepository: gh<_i388.CartRepository>()));
    gh.factory<_i98.CartViewModel>(() => _i98.CartViewModel(
        getItemsInCartUseCase: gh<_i315.GetItemsInCartUseCase>()));
    gh.factory<_i1024.AddToCartUseCase>(() =>
        _i1024.AddToCartUseCase(homeRepository: gh<_i22.HomeRepository>()));
    gh.factory<_i773.GetAllBrandsUseCase>(() =>
        _i773.GetAllBrandsUseCase(homeRepository: gh<_i22.HomeRepository>()));
    gh.factory<_i201.GetAllCategoriesUseCase>(() =>
        _i201.GetAllCategoriesUseCase(
            homeRepository: gh<_i22.HomeRepository>()));
    gh.factory<_i939.GetAllProductsUseCase>(() =>
        _i939.GetAllProductsUseCase(homeRepository: gh<_i22.HomeRepository>()));
    gh.factory<_i471.LoginUseCase>(
        () => _i471.LoginUseCase(authRepository: gh<_i660.AuthRepository>()));
    gh.factory<_i479.RegisterUseCase>(() =>
        _i479.RegisterUseCase(authRepository: gh<_i660.AuthRepository>()));
    gh.factory<_i524.HomeTabViewModel>(() => _i524.HomeTabViewModel(
          getAllCategoriesUseCase: gh<_i201.GetAllCategoriesUseCase>(),
          getAllBrandsUseCase: gh<_i773.GetAllBrandsUseCase>(),
        ));
    gh.factory<_i873.RegisterViewModel>(() =>
        _i873.RegisterViewModel(registerUseCase: gh<_i479.RegisterUseCase>()));
    gh.factory<_i245.LoginViewModel>(
        () => _i245.LoginViewModel(loginUseCase: gh<_i471.LoginUseCase>()));
    gh.factory<_i13.ProductTabViewModel>(() => _i13.ProductTabViewModel(
          productsUseCase: gh<_i939.GetAllProductsUseCase>(),
          addToCartUseCase: gh<_i1024.AddToCartUseCase>(),
        ));
    return this;
  }
}
