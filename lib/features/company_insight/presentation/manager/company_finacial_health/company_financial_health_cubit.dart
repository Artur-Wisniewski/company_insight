import 'package:bloc/bloc.dart';
import 'package:company_insight_app/core/resources/data_source.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/use_cases/get_balance_sheet_statements.dart';
import '../../../domain/use_cases/get_income_statements.dart';

part 'company_financial_health_state.dart';

class CompanyFinancialHealthCubit extends Cubit<CompanyFinancialHealthState> {
  CompanyFinancialHealthCubit(this.getIncomeStatementsUseCase, this.getBalanceSheetStatementsUseCase)
      : super(CompanyFinancialHealthInitial());

  final GetIncomeStatementsUseCase getIncomeStatementsUseCase;
  final GetBalanceSheetStatementsUseCase getBalanceSheetStatementsUseCase;

  void getFinancialHealth(String symbol) async {
    emit(CompanyFinancialHealthLoading());
    final incomeStatementsFuture = getIncomeStatementsUseCase(symbol: symbol);
    final balanceSheetStatementsFuture = getBalanceSheetStatementsUseCase(symbol: symbol);
    await Future.wait([incomeStatementsFuture, balanceSheetStatementsFuture]);
    final incomeStatements = await incomeStatementsFuture;
    final balanceSheetStatements = await balanceSheetStatementsFuture;

    if (incomeStatements is DataSuccess && balanceSheetStatements is DataSuccess) {
      final incomeStatementsData = incomeStatements.data!;
      final balanceSheetStatementsData = balanceSheetStatements.data!;

      final List<DateValue> netMarginsOverTime = incomeStatementsData
          .map((incomeStatement) => DateValue(
              date: incomeStatement.date!,
              value: ((incomeStatement.netIncome ?? 0) - (incomeStatement.revenue ?? 0).toDouble())))
          .toList();

      final List<DateValue> currentRatiosOverTime = balanceSheetStatementsData
          .map((balanceSheetStatement) => DateValue(
              date: balanceSheetStatement.date!,
              value: (balanceSheetStatement.totalCurrentAssets ?? 0) /
                  (balanceSheetStatement.totalCurrentLiabilities ?? 1)))
          .toList();

      final List<DateValue> deptToEquityRatioOverTime = balanceSheetStatementsData
          .map((balanceSheetStatement) => DateValue(
              date: balanceSheetStatement.date!,
              value: (balanceSheetStatement.totalCurrentLiabilities ?? 0) /
                  (balanceSheetStatement.totalStockholdersEquity ?? 1)))
          .toList();

      emit(CompanyFinancialHealthDone(
        netIncomeMarginsOverTime: netMarginsOverTime,
        currentRatiosOverTime: currentRatiosOverTime,
        debtToEquityRatiosOverTime: deptToEquityRatioOverTime,
      ));
    } else if (incomeStatements is DataFailed || balanceSheetStatements is DataFailed) {
      emit(const CompanyFinancialHealthFailure());
    }
  }
}
