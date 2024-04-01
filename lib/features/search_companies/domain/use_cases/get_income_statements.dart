import 'package:company_insight_app/core/resources/data_source.dart';
import 'package:injectable/injectable.dart';

import '../entities/income_statement.dart';
import '../repositories/company_repository.dart';

@lazySingleton
class GetIncomeStatementsUseCase {
  final CompanyRepository repository;

  const GetIncomeStatementsUseCase(this.repository);

  Future<DataState<List<IncomeStatementEntity>>> call({required String symbol}) async {
    return await repository.getIncomeStatements(symbol: symbol);
  }
}
