// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:pretty_dio_logger/pretty_dio_logger.dart' as _i528;

import '../../api/api_services.dart' as _i394;
import '../../api/dio/get_it_module.dart' as _i814;
import '../../data/data_sources/remote/auth/auth_remote_data_source.dart'
    as _i202;
import '../../data/data_sources/remote/auth/impl/auth_remote_data_source_impl.dart'
    as _i646;
import '../../data/repository/auth/auth_repository_impl.dart' as _i392;
import '../../domain/repository/auth/auth_repository.dart' as _i912;
import '../../domain/use_cases/login_use_cases.dart' as _i408;
import '../../features/ui/auth/login/cubit/login_view_model.dart' as _i245;
import '../../features/ui/auth/register/cubit/register_view_model.dart'
    as _i873;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final getItModule = _$GetItModule();
    gh.singleton<_i361.BaseOptions>(() => getItModule.baseOptions);
    gh.singleton<_i528.PrettyDioLogger>(() => getItModule.prettyDioLogger);
    gh.singleton<_i394.ApiServices>(() => getItModule.apiServices);
    gh.factory<_i202.AuthRemoteDataSource>(
      () => _i646.AuthRemoteDataSourceImpl(gh<_i394.ApiServices>()),
    );
    gh.factory<_i912.AuthRepository>(
      () => _i392.AuthRepositoryImpl(gh<_i202.AuthRemoteDataSource>()),
    );
    gh.singleton<_i361.Dio>(
      () => getItModule.provideDio(
        gh<_i361.BaseOptions>(),
        gh<_i528.PrettyDioLogger>(),
      ),
    );
    gh.factory<_i408.LoginUseCases>(
      () => _i408.LoginUseCases(gh<_i912.AuthRepository>()),
    );
    gh.factory<_i245.LoginViewModel>(
      () => _i245.LoginViewModel(gh<_i408.LoginUseCases>()),
    );
    gh.factory<_i873.LoginViewModel>(
      () => _i873.LoginViewModel(gh<_i408.LoginUseCases>()),
    );
    return this;
  }
}

class _$GetItModule extends _i814.GetItModule {}
