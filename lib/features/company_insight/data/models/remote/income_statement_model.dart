import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/entities/income_statement.dart';

part 'income_statement_model.freezed.dart';

part 'income_statement_model.g.dart';

@freezed
class IncomeStatementModel with _$IncomeStatementModel {
  const factory IncomeStatementModel({
    required DateTime? date,
    required String symbol,
    required String? reportedCurrency,
    required String? cik,
    required DateTime? fillingDate,
    required DateTime? acceptedDate,
    required String calendarYear,
    required String period,
    required int? revenue,
    required int? costOfRevenue,
    required int? grossProfit,
    required double? grossProfitRatio,
    required int? researchAndDevelopmentExpenses,
    required int? sellingAndMarketingExpenses,
    required int? sellingGeneralAndAdministrativeExpenses,
    required int? otherExpenses,
    required int? operatingExpenses,
    required int? costAndExpenses,
    required int? interestIncome,
    required int? interestExpense,
    required int? depreciationAndAmortization,
    required int? ebitda,
    required double? ebitdaRatio,
    required int? operatingIncome,
    required double? operatingIncomeRatio,
    required int? totalOtherIncomeExpensesNet,
    required int? incomeBeforeTax,
    required double? incomeBeforeTaxRatio,
    required int? incomeTaxExpense,
    required int? netIncome,
    required double? netIncomeRatio,
    required double? eps,
    required double? epsdiluted,
    required int? weightedAverageShsOut,
    required int? weightedAverageShsOutDil,
    required String? link,
    required String? finalLink,
  }) = _IncomeStatementModel;

  factory IncomeStatementModel.fromJson(Map<String, dynamic> json) => _$IncomeStatementModelFromJson(json);
}

extension IncomeStatementDomainExtension on IncomeStatementModel {
  IncomeStatementEntity toDomain() => IncomeStatementEntity(
        date: date,
        symbol: symbol,
        revenue: revenue,
        costOfRevenue: costOfRevenue,
        grossProfit: grossProfit,
        operatingIncome: operatingIncome,
        interestIncome: interestIncome,
        incomeTaxExpense: incomeTaxExpense,
        netIncome: netIncome,
        grossProfitRatio: grossProfitRatio,
        operatingIncomeRatio: operatingIncomeRatio,
        eps: eps,
        epsdiluted: epsdiluted,
        weightedAverageShsOut: weightedAverageShsOut,
        weightedAverageShsOutDil: weightedAverageShsOutDil,
        link: link,
        finalLink: finalLink,
        reportedCurrency: reportedCurrency,
        cik: cik,
        fillingDate: fillingDate,
        acceptedDate: acceptedDate,
        calendarYear: calendarYear,
        period: period,
        researchAndDevelopmentExpenses: researchAndDevelopmentExpenses,
        sellingAndMarketingExpenses: sellingAndMarketingExpenses,
        sellingGeneralAndAdministrativeExpenses: sellingGeneralAndAdministrativeExpenses,
        otherExpenses: otherExpenses,
        operatingExpenses: operatingExpenses,
        costAndExpenses: costAndExpenses,
        interestExpense: interestExpense,
        depreciationAndAmortization: depreciationAndAmortization,
        ebitda: ebitda,
        ebitdaRatio: ebitdaRatio,
        totalOtherIncomeExpensesNet: totalOtherIncomeExpensesNet,
        incomeBeforeTax: incomeBeforeTax,
        incomeBeforeTaxRatio: incomeBeforeTaxRatio,
        netIncomeRatio: netIncomeRatio,
      );
}
