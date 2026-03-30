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
import '../../data/data_sources/remote/brand/category_remote_data_source.dart'
    as _i611;
import '../../data/data_sources/remote/brand/impl/brand_remote_data_source_impl.dart'
    as _i549;
import '../../data/data_sources/remote/category/category_remote_data_source.dart'
    as _i89;
import '../../data/data_sources/remote/category/impl/category_remote_data_source_impl.dart'
    as _i214;
import '../../data/data_sources/remote/product/impl/product_remote_data_source_impl.dart'
    as _i1055;
import '../../data/data_sources/remote/product/product_remote_data_source.dart'
    as _i1038;
import '../../data/repository/auth/auth_repository_impl.dart' as _i392;
import '../../data/repository/brand/brand_repository_impl.dart' as _i829;
import '../../data/repository/category/category_repository_impl.dart' as _i954;
import '../../data/repository/product/category_repository_impl.dart' as _i978;
import '../../domain/repository/auth/auth_repository.dart' as _i912;
import '../../domain/repository/brand/brand_repository.dart' as _i244;
import '../../domain/repository/category/category_repository.dart' as _i495;
import '../../domain/repository/product/product_repository.dart' as _i798;
import '../../domain/use_cases/get_all_brands_use_case.dart' as _i773;
import '../../domain/use_cases/get_all_categories_use_case.dart' as _i201;
import '../../domain/use_cases/get_all_products_use_case.dart' as _i218;
import '../../domain/use_cases/login_use_cases.dart' as _i408;
import '../../domain/use_cases/register_use_cases.dart' as _i724;
import '../../features/ui/auth/login/cubit/login_view_model.dart' as _i245;
import '../../features/ui/auth/register/cubit/register_view_model.dart'
    as _i873;
import '../../features/ui/home_screen/cubit/home_screen_view_model.dart'
    as _i313;
import '../../features/ui/home_screen/tabs/home_tab/cubit/home_tab_view_model.dart'
    as _i519;
import '../../features/ui/home_screen/tabs/products_tab/cubit/product_tab_view_model.dart'
    as _i280;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final getItModule = _$GetItModule();
    gh.factory<_i313.HomeScreenViewModel>(() => _i313.HomeScreenViewModel());
    gh.singleton<_i361.BaseOptions>(() => getItModule.baseOptions);
    gh.singleton<_i528.PrettyDioLogger>(() => getItModule.prettyDioLogger);
    gh.singleton<_i394.ApiServices>(() => getItModule.apiServices);
    gh.factory<_i1038.ProductRemoteDataSource>(
      () => _i1055.ProductRemoteDataSourceImpl(gh<_i394.ApiServices>()),
    );
    gh.factory<_i798.ProductRepository>(
      () => _i978.ProductRepositoryImpl(gh<_i1038.ProductRemoteDataSource>()),
    );
    gh.factory<_i89.CategoryRemoteDataSource>(
      () => _i214.CategoryRemoteDataSourceImpl(gh<_i394.ApiServices>()),
    );
    gh.factory<_i202.AuthRemoteDataSource>(
      () => _i646.AuthRemoteDataSourceImpl(gh<_i394.ApiServices>()),
    );
    gh.factory<_i218.GetAllProductsUseCase>(
      () => _i218.GetAllProductsUseCase(gh<_i798.ProductRepository>()),
    );
    gh.factory<_i912.AuthRepository>(
      () => _i392.AuthRepositoryImpl(gh<_i202.AuthRemoteDataSource>()),
    );
    gh.factory<_i611.BrandRemoteDataSource>(
      () => _i549.BrandRemoteDataSourceImpl(gh<_i394.ApiServices>()),
    );
    gh.factory<_i280.ProductTabViewModel>(
      () => _i280.ProductTabViewModel(gh<_i218.GetAllProductsUseCase>()),
    );
    gh.singleton<_i361.Dio>(
      () => getItModule.provideDio(
        gh<_i361.BaseOptions>(),
        gh<_i528.PrettyDioLogger>(),
      ),
    );
    gh.factory<_i244.BrandRepository>(
      () => _i829.BrandRepositoryImpl(gh<_i611.BrandRemoteDataSource>()),
    );
    gh.factory<_i408.LoginUseCases>(
      () => _i408.LoginUseCases(gh<_i912.AuthRepository>()),
    );
    gh.factory<_i724.RegisterUseCases>(
      () => _i724.RegisterUseCases(gh<_i912.AuthRepository>()),
    );
    gh.factory<_i495.CategoryRepository>(
      () => _i954.CategoryRepositoryImpl(gh<_i89.CategoryRemoteDataSource>()),
    );
    gh.factory<_i201.GetAllCategoriesUseCase>(
      () => _i201.GetAllCategoriesUseCase(gh<_i495.CategoryRepository>()),
    );
    gh.factory<_i873.RegisterViewModel>(
      () => _i873.RegisterViewModel(gh<_i724.RegisterUseCases>()),
    );
    gh.factory<_i773.GetAllBrandsUseCase>(
      () => _i773.GetAllBrandsUseCase(gh<_i244.BrandRepository>()),
    );
    gh.factory<_i245.LoginViewModel>(
      () => _i245.LoginViewModel(gh<_i408.LoginUseCases>()),
    );
    gh.factory<_i519.HomeTabViewModel>(
      () => _i519.HomeTabViewModel(
        gh<_i201.GetAllCategoriesUseCase>(),
        gh<_i773.GetAllBrandsUseCase>(),
      ),
    );
    return this;
  }
}

class _$GetItModule extends _i814.GetItModule {}
