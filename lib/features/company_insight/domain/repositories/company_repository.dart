import 'package:company_insight_app/core/resources/data_source.dart';

import '../entities/balance_sheet_statement.dart';
import '../entities/company_overview.dart';
import '../entities/company_profile.dart';
import '../entities/income_statement.dart';

abstract interface class CompanyRepository {
  Future<DataState<List<CompanyPreviewEntity>>> getCompanyOverviewBy({required String query, int? limit});

  Future<DataState<List<CompanyPreviewEntity>>> getSavedCompanyOverviews();

  Future<void> addCompanyToSaved({required CompanyPreviewEntity companyOverview});

  Future<void> removeCompanyFromSaved({required CompanyPreviewEntity companyOverview});

  Future<DataState<CompanyProfileEntity>> getCompanyProfile({required String symbol});

  Future<DataState<List<BalanceSheetStatementEntity>>> getBalanceSheetStatements({required String symbol});

  Future<DataState<List<IncomeStatementEntity>>> getIncomeStatements({required String symbol});
}
