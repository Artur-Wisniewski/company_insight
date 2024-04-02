import 'package:equatable/equatable.dart';

class IncomeStatementEntity extends Equatable {
  const IncomeStatementEntity({
    required this.symbol,
    required this.revenue,
    required this.netIncome,
    required this.date,
    this.costOfRevenue,
    this.grossProfit,
    this.operatingIncome,
    this.interestIncome,
    this.incomeTaxExpense,
    this.grossProfitRatio,
    this.operatingIncomeRatio,
    this.eps,
    this.epsdiluted,
    this.weightedAverageShsOut,
    this.weightedAverageShsOutDil,
    this.link,
    this.finalLink,
    this.reportedCurrency,
    this.cik,
    this.fillingDate,
    this.acceptedDate,
    this.calendarYear,
    this.period,
    this.researchAndDevelopmentExpenses,
    this.sellingAndMarketingExpenses,
    this.sellingGeneralAndAdministrativeExpenses,
    this.otherExpenses,
    this.operatingExpenses,
    this.costAndExpenses,
    this.interestExpense,
    this.depreciationAndAmortization,
    this.ebitda,
    this.ebitdaRatio,
    this.totalOtherIncomeExpensesNet,
    this.incomeBeforeTax,
    this.incomeBeforeTaxRatio,
    this.netIncomeRatio,
  });

  final DateTime? date;
  final String symbol;
  final String? reportedCurrency;
  final String? cik;
  final DateTime? fillingDate;
  final DateTime? acceptedDate;
  final String? calendarYear;
  final String? period;
  final int? revenue;
  final int? costOfRevenue;
  final int? grossProfit;
  final double? grossProfitRatio;
  final int? researchAndDevelopmentExpenses;
  final int? sellingAndMarketingExpenses;
  final int? sellingGeneralAndAdministrativeExpenses;
  final int? otherExpenses;
  final int? operatingExpenses;
  final int? costAndExpenses;
  final int? interestIncome;
  final int? interestExpense;
  final int? depreciationAndAmortization;
  final int? ebitda;
  final double? ebitdaRatio;
  final int? operatingIncome;
  final double? operatingIncomeRatio;
  final int? totalOtherIncomeExpensesNet;
  final int? incomeBeforeTax;
  final double? incomeBeforeTaxRatio;
  final int? incomeTaxExpense;
  final int? netIncome;
  final double? netIncomeRatio;
  final double? eps;
  final double? epsdiluted;
  final int? weightedAverageShsOut;
  final int? weightedAverageShsOutDil;
  final String? link;
  final String? finalLink;

  @override
  List<Object?> get props => [
        date,
        symbol,
        reportedCurrency,
        cik,
        fillingDate,
        acceptedDate,
        calendarYear,
        period,
        revenue,
        costOfRevenue,
        grossProfit,
        grossProfitRatio,
        researchAndDevelopmentExpenses,
        sellingAndMarketingExpenses,
        sellingGeneralAndAdministrativeExpenses,
        otherExpenses,
        operatingExpenses,
        costAndExpenses,
        interestIncome,
        interestExpense,
        depreciationAndAmortization,
        ebitda,
        ebitdaRatio,
        operatingIncome,
        operatingIncomeRatio,
        totalOtherIncomeExpensesNet,
        incomeBeforeTax,
        incomeBeforeTaxRatio,
        incomeTaxExpense,
        netIncome,
        netIncomeRatio,
        eps,
        epsdiluted,
        weightedAverageShsOut,
        weightedAverageShsOutDil,
        link,
        finalLink,
      ];
}
