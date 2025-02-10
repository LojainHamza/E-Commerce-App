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
import '../../data/repositories/auth_repository_impl.dart' as _i895;
import '../../domain/repositories/auth/auth_repository.dart' as _i660;
import '../../domain/repositories/data_sources/remote_data_sources/auth_remote_data_source.dart'
    as _i327;
import '../../domain/use_cases/login_use_case.dart' as _i471;
import '../../features/ui/auth/login/cubit/login_view_model.dart' as _i245;
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
    gh.factory<_i327.AuthRemoteDataSource>(() =>
        _i1057.AuthRemoteDataSourceImpl(apiManager: gh<_i1047.ApiManager>()));
    gh.factory<RegisterUseCase>(
        () => RegisterUseCase(authRepository: gh<AuthRepository>()));
    gh.factory<RegisterViewModel>(
        () => RegisterViewModel(registerUseCase: gh<RegisterUseCase>()));
    gh.factory<_i660.AuthRepository>(() => _i895.AuthRepositoryImpl(
        authRemoteDataSource: gh<_i327.AuthRemoteDataSource>()));
    gh.factory<_i471.LoginUseCase>(
        () => _i471.LoginUseCase(authRepository: gh<_i660.AuthRepository>()));
    gh.factory<_i245.LoginViewModel>(
        () => _i245.LoginViewModel(loginUseCase: gh<_i471.LoginUseCase>()));
    return this;
  }
}
