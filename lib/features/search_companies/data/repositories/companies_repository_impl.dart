import 'package:company_insight_app/core/resources/data_source.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../data/models/remote/company_preview_model.dart';
import '../../data/models/remote/company_profile_model.dart';
import '../../domain/entities/company_overview.dart';
import '../../domain/entities/company_profile.dart';
import '../../domain/repositories/company_repository.dart';
import '../data_sources/local/app_database.dart';
import '../data_sources/remote/companies_list_remote_data_source.dart';
import '../data_sources/remote/company_information_remote_data_source.dart';
import '../models/local/company_preview_dto.dart';

@LazySingleton(as: CompanyRepository)
class CompaniesRepositoryImpl implements CompanyRepository {
  final CompanyPreviewsListRemoteDataSource searchCompaniesRemoteDataSource;
  final CompanyInformationRemoteDataSource companyInformationRemoteDataSource;
  final AppDatabase appDatabase;

  CompaniesRepositoryImpl({
    required this.searchCompaniesRemoteDataSource,
    required this.companyInformationRemoteDataSource,
    required this.appDatabase,
  });

  @override
  Future<DataState<List<CompanyPreviewEntity>>> getCompanyOverviewBy({required String query, int? limit}) async {
    try {
      final response = await searchCompaniesRemoteDataSource.findCompanyOverviewBy(searchQuery: query, limit: limit);
      return DataSuccess<List<CompanyPreviewEntity>>(response.map((e) => e.toDomain()).toList());
    } on DioException catch (e) {
      return DataFailed(e);
    } on Exception catch (e) {
      return DataFailed(e);
    }
  }

  @override
  Future<DataState<List<CompanyPreviewEntity>>> getSavedCompanyOverviews() async {
    final companiesOverviews = await appDatabase.companiesOverviewDao.selectSavedCompanyPreviews();
    return DataSuccess(companiesOverviews.map((e) => e.toDomain()).toList());
  }

  @override
  Future<void> addCompanyToSaved({required CompanyPreviewEntity companyOverview}) async {
    await appDatabase.companiesOverviewDao.insertCompanyPreview(CompanyPreviewDTO.fromDomain(companyOverview));
  }

  @override
  Future<void> removeCompanyFromSaved({required CompanyPreviewEntity companyOverview}) async {
    await appDatabase.companiesOverviewDao.deleteCompanyPreview(CompanyPreviewDTO.fromDomain(companyOverview));
  }

  @override
  Future<DataState<CompanyProfileEntity>> getCompanyProfile({required String symbol}) async {
    try {
      final response = await companyInformationRemoteDataSource.getCompanyProfile(symbol: symbol);
      return DataSuccess<CompanyProfileEntity>(response.toDomain());
    } on DioException catch (e) {
      return DataFailed(e);
    } on Exception catch (e) {
      return DataFailed(e);
    }
  }
}
