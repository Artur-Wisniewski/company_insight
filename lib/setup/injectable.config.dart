// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:company_insight_app/core/widgets/app_bottom_navigation_bar/manager/bottom_navigation_bar_cubit.dart'
    as _i4;
import 'package:company_insight_app/features/search_companies/data/data_sources/local/app_database.dart'
    as _i3;
import 'package:company_insight_app/features/search_companies/data/data_sources/local/app_database_injection.dart'
    as _i15;
import 'package:company_insight_app/features/search_companies/data/data_sources/remote/companies_list_data_source.dart'
    as _i6;
import 'package:company_insight_app/features/search_companies/data/repositories/companies_repository_impl.dart'
    as _i8;
import 'package:company_insight_app/features/search_companies/domain/repositories/company_repository.dart'
    as _i7;
import 'package:company_insight_app/features/search_companies/domain/use_cases/get_saved_company_previews.dart'
    as _i9;
import 'package:company_insight_app/features/search_companies/domain/use_cases/remove_company_previews_from_saved.dart'
    as _i10;
import 'package:company_insight_app/features/search_companies/domain/use_cases/save_company_previews.dart'
    as _i11;
import 'package:company_insight_app/features/search_companies/domain/use_cases/search_company_previews.dart'
    as _i12;
import 'package:company_insight_app/features/search_companies/presentation/manager/favorite_companies/favorite_companies_cubit.dart'
    as _i13;
import 'package:company_insight_app/features/search_companies/presentation/manager/search_company_previews/search_company_previews_bloc.dart'
    as _i14;
import 'package:company_insight_app/setup/dio.dart' as _i16;
import 'package:dio/dio.dart' as _i5;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i1.GetIt> init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final databaseModule = _$DatabaseModule();
    final dioModule = _$DioModule();
    await gh.factoryAsync<_i3.AppDatabase>(
      () => databaseModule.getAppDataBase(),
      preResolve: true,
    );
    gh.lazySingleton<_i4.BottomNavigationBarCubit>(
        () => _i4.BottomNavigationBarCubit());
    gh.factory<String>(
      () => dioModule.prefs,
      instanceName: 'ApiKey',
    );
    gh.lazySingleton<_i5.Dio>(
        () => dioModule.dio(gh<String>(instanceName: 'ApiKey')));
    gh.singleton<_i6.CompanyPreviewsListRemoteDataSource>(
        () => _i6.CompaniesOverviewListRemoteDataSourceImpl(gh<_i5.Dio>()));
    gh.lazySingleton<_i7.CompanyRepository>(() => _i8.CompaniesRepositoryImpl(
          remoteDataSource: gh<_i6.CompanyPreviewsListRemoteDataSource>(),
          appDatabase: gh<_i3.AppDatabase>(),
        ));
    gh.lazySingleton<_i9.GetSavedCompanyPreviewsUseCase>(
        () => _i9.GetSavedCompanyPreviewsUseCase(gh<_i7.CompanyRepository>()));
    gh.lazySingleton<_i10.RemoveCompanyOverviewFromSavedUseCase>(() =>
        _i10.RemoveCompanyOverviewFromSavedUseCase(
            gh<_i7.CompanyRepository>()));
    gh.lazySingleton<_i11.SaveCompanyPreviewUseCase>(
        () => _i11.SaveCompanyPreviewUseCase(gh<_i7.CompanyRepository>()));
    gh.lazySingleton<_i12.SearchCompanyPreviewsUseCase>(
        () => _i12.SearchCompanyPreviewsUseCase(gh<_i7.CompanyRepository>()));
    gh.lazySingleton<_i13.FavoriteCompaniesCubit>(
        () => _i13.FavoriteCompaniesCubit(
              gh<_i9.GetSavedCompanyPreviewsUseCase>(),
              gh<_i10.RemoveCompanyOverviewFromSavedUseCase>(),
              gh<_i11.SaveCompanyPreviewUseCase>(),
            ));
    gh.lazySingleton<_i14.SearchCompanyOverviewsBloc>(() =>
        _i14.SearchCompanyOverviewsBloc(
            gh<_i12.SearchCompanyPreviewsUseCase>()));
    return this;
  }
}

class _$DatabaseModule extends _i15.DatabaseModule {}

class _$DioModule extends _i16.DioModule {}
