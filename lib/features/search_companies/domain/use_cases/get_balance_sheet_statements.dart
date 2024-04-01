import 'package:company_insight_app/core/resources/data_source.dart';
import 'package:injectable/injectable.dart';

import '../entities/balance_sheet_statement.dart';
import '../repositories/company_repository.dart';

@lazySingleton
class GetBalanceSheetStatementsUseCase {
  final CompanyRepository repository;

  const GetBalanceSheetStatementsUseCase(this.repository);

  Future<DataState<List<BalanceSheetStatementEntity>>> call({required String symbol}) async {
    return await repository.getBalanceSheetStatements(symbol: symbol);
  }
}
