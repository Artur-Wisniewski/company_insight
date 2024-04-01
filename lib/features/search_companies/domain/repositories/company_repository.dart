import 'package:company_insight_app/core/resources/data_source.dart';
import 'package:company_insight_app/features/search_companies/domain/entities/company_overview.dart';
import 'package:company_insight_app/features/search_companies/domain/entities/company_profile.dart';

abstract interface class CompanyRepository {
  Future<DataState<List<CompanyPreviewEntity>>> getCompanyOverviewBy({required String query, int? limit});

  Future<DataState<List<CompanyPreviewEntity>>> getSavedCompanyOverviews();

  Future<void> addCompanyToSaved({required CompanyPreviewEntity companyOverview});

  Future<void> removeCompanyFromSaved({required CompanyPreviewEntity companyOverview});

  Future<DataState<CompanyProfileEntity>> getCompanyProfile({required String symbol});
}
