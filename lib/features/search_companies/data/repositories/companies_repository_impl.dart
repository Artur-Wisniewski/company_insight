import 'package:company_insight_app/core/resources/data_source.dart';
import 'package:company_insight_app/features/search_companies/data/data_sources/local/app_database.dart';
import 'package:company_insight_app/features/search_companies/data/data_sources/remote/companies_list_data_source.dart';
import 'package:company_insight_app/features/search_companies/data/models/local/company_preview_dto.dart';
import 'package:company_insight_app/features/search_companies/data/models/remote/company_preview_model.dart';
import 'package:company_insight_app/features/search_companies/domain/entities/company_overview.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../domain/repositories/company_repository.dart';

@LazySingleton(as: CompanyRepository)
class CompaniesRepositoryImpl implements CompanyRepository {
  final CompanyPreviewsListRemoteDataSource remoteDataSource;
  final AppDatabase appDatabase;

  CompaniesRepositoryImpl({
    required this.remoteDataSource,
    required this.appDatabase,
  });

  @override
  Future<DataState<List<CompanyPreviewEntity>>> getCompanyOverviewBy({required String query, int? limit}) async {
    try {
      final response = await remoteDataSource.findCompanyOverviewBy(searchQuery: query, limit: limit);
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
}
