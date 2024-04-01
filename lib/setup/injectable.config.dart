// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:company_insight_app/core/services/shared_preferences.dart'
    as _i4;
import 'package:company_insight_app/core/widgets/app_bottom_navigation_bar/manager/bottom_navigation_bar_cubit.dart'
    as _i5;
import 'package:company_insight_app/features/company_insight/data/data_sources/local/app_database.dart'
    as _i3;
import 'package:company_insight_app/features/company_insight/data/data_sources/local/app_database_injection.dart'
    as _i22;
import 'package:company_insight_app/features/company_insight/data/data_sources/remote/companies_list_remote_data_source.dart'
    as _i10;
import 'package:company_insight_app/features/company_insight/data/data_sources/remote/company_information_remote_data_source.dart'
    as _i9;
import 'package:company_insight_app/features/company_insight/data/repositories/company_repository_impl.dart'
    as _i12;
import 'package:company_insight_app/features/company_insight/domain/repositories/company_repository.dart'
    as _i11;
import 'package:company_insight_app/features/company_insight/domain/use_cases/get_balance_sheet_statements.dart'
    as _i13;
import 'package:company_insight_app/features/company_insight/domain/use_cases/get_company_profile.dart'
    as _i14;
import 'package:company_insight_app/features/company_insight/domain/use_cases/get_income_statements.dart'
    as _i15;
import 'package:company_insight_app/features/company_insight/domain/use_cases/get_saved_company_previews.dart'
    as _i16;
import 'package:company_insight_app/features/company_insight/domain/use_cases/remove_company_previews_from_saved.dart'
    as _i17;
import 'package:company_insight_app/features/company_insight/domain/use_cases/save_company_previews.dart'
    as _i18;
import 'package:company_insight_app/features/company_insight/domain/use_cases/search_company_previews.dart'
    as _i19;
import 'package:company_insight_app/features/company_insight/presentation/manager/favorite_companies/favorite_companies_cubit.dart'
    as _i20;
import 'package:company_insight_app/features/company_insight/presentation/manager/search_company_previews/search_company_previews_bloc.dart'
    as _i21;
import 'package:company_insight_app/setup/dio.dart' as _i23;
import 'package:dio/dio.dart' as _i8;
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart' as _i6;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:pretty_dio_logger/pretty_dio_logger.dart' as _i7;

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
    await gh.lazySingletonAsync<_i4.AppSharedPreferences>(
      () {
        final i = _i4.AppSharedPreferences();
        return i.init().then((_) => i);
      },
      preResolve: true,
    );
    gh.lazySingleton<_i5.BottomNavigationBarCubit>(
        () => _i5.BottomNavigationBarCubit());
    gh.factory<_i6.CacheOptions>(() => dioModule.cacheOptions);
    gh.factory<_i7.PrettyDioLogger>(() => dioModule.prettyDioLogger);
    gh.factory<String>(
      () => dioModule.prefs,
      instanceName: 'ApiKey',
    );
    gh.lazySingleton<_i8.Dio>(
        () => dioModule.dio(gh<String>(instanceName: 'ApiKey')));
    gh.singleton<_i9.CompanyInformationRemoteDataSource>(
        () => _i9.CompanyInformationRemoteDataSourceImpl(gh<_i8.Dio>()));
    gh.singleton<_i10.CompanyPreviewsListRemoteDataSource>(
        () => _i10.CompaniesOverviewListRemoteDataSourceImpl(gh<_i8.Dio>()));
    gh.lazySingleton<_i11.CompanyRepository>(() => _i12.CompanyRepositoryImpl(
          searchCompaniesRemoteDataSource:
              gh<_i10.CompanyPreviewsListRemoteDataSource>(),
          companyInformationRemoteDataSource:
              gh<_i9.CompanyInformationRemoteDataSource>(),
          appDatabase: gh<_i3.AppDatabase>(),
        ));
    gh.lazySingleton<_i13.GetBalanceSheetStatementsUseCase>(() =>
        _i13.GetBalanceSheetStatementsUseCase(gh<_i11.CompanyRepository>()));
    gh.lazySingleton<_i14.GetCompanyProfileUseCase>(
        () => _i14.GetCompanyProfileUseCase(gh<_i11.CompanyRepository>()));
    gh.lazySingleton<_i15.GetIncomeStatementsUseCase>(
        () => _i15.GetIncomeStatementsUseCase(gh<_i11.CompanyRepository>()));
    gh.lazySingleton<_i16.GetSavedCompanyPreviewsUseCase>(() =>
        _i16.GetSavedCompanyPreviewsUseCase(gh<_i11.CompanyRepository>()));
    gh.lazySingleton<_i17.RemoveCompanyOverviewFromSavedUseCase>(() =>
        _i17.RemoveCompanyOverviewFromSavedUseCase(
            gh<_i11.CompanyRepository>()));
    gh.lazySingleton<_i18.SaveCompanyPreviewUseCase>(
        () => _i18.SaveCompanyPreviewUseCase(gh<_i11.CompanyRepository>()));
    gh.lazySingleton<_i19.SearchCompanyPreviewsUseCase>(
        () => _i19.SearchCompanyPreviewsUseCase(gh<_i11.CompanyRepository>()));
    gh.lazySingleton<_i20.FavoriteCompaniesCubit>(
        () => _i20.FavoriteCompaniesCubit(
              gh<_i16.GetSavedCompanyPreviewsUseCase>(),
              gh<_i17.RemoveCompanyOverviewFromSavedUseCase>(),
              gh<_i18.SaveCompanyPreviewUseCase>(),
            ));
    gh.lazySingleton<_i21.SearchCompanyOverviewsBloc>(() =>
        _i21.SearchCompanyOverviewsBloc(
            gh<_i19.SearchCompanyPreviewsUseCase>()));
    return this;
  }
}

class _$DatabaseModule extends _i22.DatabaseModule {}

class _$DioModule extends _i23.DioModule {}
