// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:company_insight_app/features/search_companies/data/data_sources/local/app_database.dart'
    as _i3;
import 'package:company_insight_app/features/search_companies/data/data_sources/local/app_database_injection.dart'
    as _i13;
import 'package:company_insight_app/features/search_companies/data/data_sources/remote/companies_list_data_source.dart'
    as _i5;
import 'package:company_insight_app/features/search_companies/data/repositories/companies_repository_impl.dart'
    as _i7;
import 'package:company_insight_app/features/search_companies/domain/repositories/company_repository.dart'
    as _i6;
import 'package:company_insight_app/features/search_companies/domain/use_cases/get_saved_company_previews.dart'
    as _i8;
import 'package:company_insight_app/features/search_companies/domain/use_cases/remove_company_previews_from_saved.dart'
    as _i9;
import 'package:company_insight_app/features/search_companies/domain/use_cases/save_company_previews.dart'
    as _i10;
import 'package:company_insight_app/features/search_companies/domain/use_cases/search_company_previews.dart'
    as _i11;
import 'package:company_insight_app/features/search_companies/presentation/manager/search_company_previews/search_company_previews_bloc.dart'
    as _i12;
import 'package:company_insight_app/setup/dio.dart' as _i14;
import 'package:dio/dio.dart' as _i4;
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
    gh.factory<String>(
      () => dioModule.prefs,
      instanceName: 'ApiKey',
    );
    gh.lazySingleton<_i4.Dio>(
        () => dioModule.dio(gh<String>(instanceName: 'ApiKey')));
    gh.singleton<_i5.CompanyPreviewsListRemoteDataSource>(
        () => _i5.CompaniesOverviewListRemoteDataSourceImpl(gh<_i4.Dio>()));
    gh.lazySingleton<_i6.CompanyRepository>(() => _i7.CompaniesRepositoryImpl(
          remoteDataSource: gh<_i5.CompanyPreviewsListRemoteDataSource>(),
          appDatabase: gh<_i3.AppDatabase>(),
        ));
    gh.lazySingleton<_i8.GetSavedCompanyPreviewsUseCase>(
        () => _i8.GetSavedCompanyPreviewsUseCase(gh<_i6.CompanyRepository>()));
    gh.lazySingleton<_i9.RemoveCompanyOverviewFromSavedUseCase>(() =>
        _i9.RemoveCompanyOverviewFromSavedUseCase(gh<_i6.CompanyRepository>()));
    gh.lazySingleton<_i10.SaveCompanyPreviewUseCase>(
        () => _i10.SaveCompanyPreviewUseCase(gh<_i6.CompanyRepository>()));
    gh.lazySingleton<_i11.SearchCompanyPreviewsUseCase>(
        () => _i11.SearchCompanyPreviewsUseCase(gh<_i6.CompanyRepository>()));
    gh.lazySingleton<_i12.SearchCompanyOverviewsBloc>(() =>
        _i12.SearchCompanyOverviewsBloc(
            gh<_i11.SearchCompanyPreviewsUseCase>()));
    return this;
  }
}

class _$DatabaseModule extends _i13.DatabaseModule {}

class _$DioModule extends _i14.DioModule {}
