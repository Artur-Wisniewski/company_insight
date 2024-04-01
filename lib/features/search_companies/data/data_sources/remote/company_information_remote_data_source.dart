import 'package:company_insight_app/core/constants/status_codes.dart';
import 'package:company_insight_app/core/exceptions/exceptions.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../models/remote/balance_sheet_statement_model.dart';
import '../../models/remote/company_profile_model.dart';
import '../../models/remote/income_statement_model.dart';

abstract interface class CompanyInformationRemoteDataSource {
  Future<CompanyProfileModel> getCompanyProfile({required String symbol});

  Future<List<IncomeStatementModel>> getIncomeStatement({required String symbol});

  Future<List<BalanceSheetStatementModel>> getBalanceSheetStatement({required String symbol});
}

@Singleton(as: CompanyInformationRemoteDataSource)
class CompanyInformationRemoteDataSourceImpl implements CompanyInformationRemoteDataSource {
  final Dio client;

  const CompanyInformationRemoteDataSourceImpl(this.client);

  @override
  Future<CompanyProfileModel> getCompanyProfile({required String symbol}) async {
    final response = await client.get('/api/v3/profile/$symbol');
    if (response.statusCode == StatusCode.ok && response.data.isNotEmpty) {
      return CompanyProfileModel.fromJson(response.data.first);
    } else if (response.statusCode == StatusCode.notFound) {
      throw NotFoundException(message: response.statusMessage);
    } else {
      throw ErrorException(message: response.statusMessage);
    }
  }

  @override
  Future<List<IncomeStatementModel>> getIncomeStatement({required String symbol}) async {
    final response = await client.get('/api/v3/income-statement/$symbol');
    if (response.statusCode == StatusCode.ok && response.data.isNotEmpty) {
      return [for (final item in response.data) IncomeStatementModel.fromJson(item)];
    } else if (response.statusCode == StatusCode.notFound) {
      throw NotFoundException(message: response.statusMessage);
    } else {
      throw ErrorException(message: response.statusMessage);
    }
  }

  @override
  Future<List<BalanceSheetStatementModel>> getBalanceSheetStatement({required String symbol}) async {
    final response = await client.get('/api/v3/balance-sheet-statement/$symbol');
    if (response.statusCode == StatusCode.ok && response.data.isNotEmpty) {
      return [for (final item in response.data) BalanceSheetStatementModel.fromJson(item)];
    } else if (response.statusCode == StatusCode.notFound) {
      throw NotFoundException(message: response.statusMessage);
    } else {
      throw ErrorException(message: response.statusMessage);
    }
  }
}
