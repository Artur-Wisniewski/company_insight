import 'package:equatable/equatable.dart';

class BalanceSheetStatementEntity extends Equatable {
  const BalanceSheetStatementEntity({
    required this.date,
    required this.symbol,
    required this.reportedCurrency,
    required this.cik,
    required this.fillingDate,
    required this.acceptedDate,
    required this.calendarYear,
    required this.period,
    required this.cashAndCashEquivalents,
    required this.shortTermInvestments,
    required this.cashAndShortTermInvestments,
    required this.netReceivables,
    required this.inventory,
    required this.otherCurrentAssets,
    required this.totalCurrentAssets,
    required this.propertyPlantEquipmentNet,
    required this.goodwill,
    required this.intangibleAssets,
    required this.goodwillAndIntangibleAssets,
    required this.longTermInvestments,
    required this.taxAssets,
    required this.otherNonCurrentAssets,
    required this.totalNonCurrentAssets,
    required this.otherAssets,
    required this.totalAssets,
    required this.accountPayables,
    required this.shortTermDebt,
    required this.taxPayables,
    required this.deferredRevenue,
    required this.otherCurrentLiabilities,
    required this.totalCurrentLiabilities,
    required this.longTermDebt,
    required this.deferredRevenueNonCurrent,
    required this.deferredTaxLiabilitiesNonCurrent,
    required this.otherNonCurrentLiabilities,
    required this.totalNonCurrentLiabilities,
    required this.otherLiabilities,
    required this.capitalLeaseObligations,
    required this.totalLiabilities,
    required this.preferredStock,
    required this.commonStock,
    required this.retainedEarnings,
    required this.accumulatedOtherComprehensiveIncomeLoss,
    required this.othertotalStockholdersEquity,
    required this.totalStockholdersEquity,
    required this.totalEquity,
    required this.totalLiabilitiesAndStockholdersEquity,
    required this.minorityInterest,
    required this.totalLiabilitiesAndTotalEquity,
    required this.totalInvestments,
    required this.totalDebt,
    required this.netDebt,
    required this.link,
    required this.finalLink,
  });

  final DateTime? date;
  final String symbol;
  final String? reportedCurrency;
  final String? cik;
  final DateTime? fillingDate;
  final DateTime? acceptedDate;
  final String? calendarYear;
  final String? period;
  final int? cashAndCashEquivalents;
  final int? shortTermInvestments;
  final int? cashAndShortTermInvestments;
  final int? netReceivables;
  final int? inventory;
  final int? otherCurrentAssets;
  final int? totalCurrentAssets;
  final int? propertyPlantEquipmentNet;
  final int? goodwill;
  final int? intangibleAssets;
  final int? goodwillAndIntangibleAssets;
  final int? longTermInvestments;
  final int? taxAssets;
  final int? otherNonCurrentAssets;
  final int? totalNonCurrentAssets;
  final int? otherAssets;
  final int? totalAssets;
  final int? accountPayables;
  final int? shortTermDebt;
  final int? taxPayables;
  final int? deferredRevenue;
  final int? otherCurrentLiabilities;
  final int? totalCurrentLiabilities;
  final int? longTermDebt;
  final int? deferredRevenueNonCurrent;
  final int? deferredTaxLiabilitiesNonCurrent;
  final int? otherNonCurrentLiabilities;
  final int? totalNonCurrentLiabilities;
  final int? otherLiabilities;
  final int? capitalLeaseObligations;
  final int? totalLiabilities;
  final int? preferredStock;
  final int? commonStock;
  final int? retainedEarnings;
  final int? accumulatedOtherComprehensiveIncomeLoss;
  final int? othertotalStockholdersEquity;
  final int? totalStockholdersEquity;
  final int? totalEquity;
  final int? totalLiabilitiesAndStockholdersEquity;
  final int? minorityInterest;
  final int? totalLiabilitiesAndTotalEquity;
  final int? totalInvestments;
  final int? totalDebt;
  final int? netDebt;
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
        cashAndCashEquivalents,
        shortTermInvestments,
        cashAndShortTermInvestments,
        netReceivables,
        inventory,
        otherCurrentAssets,
        totalCurrentAssets,
        propertyPlantEquipmentNet,
        goodwill,
        intangibleAssets,
        goodwillAndIntangibleAssets,
        longTermInvestments,
        taxAssets,
        otherNonCurrentAssets,
        totalNonCurrentAssets,
        otherAssets,
        totalAssets,
        accountPayables,
        shortTermDebt,
        taxPayables,
        deferredRevenue,
        otherCurrentLiabilities,
        totalCurrentLiabilities,
        longTermDebt,
        deferredRevenueNonCurrent,
        deferredTaxLiabilitiesNonCurrent,
        otherNonCurrentLiabilities,
        totalNonCurrentLiabilities,
        otherLiabilities,
        capitalLeaseObligations,
        totalLiabilities,
        preferredStock,
        commonStock,
        retainedEarnings,
        accumulatedOtherComprehensiveIncomeLoss,
        othertotalStockholdersEquity,
        totalStockholdersEquity,
        totalEquity,
        totalLiabilitiesAndStockholdersEquity,
        minorityInterest,
        totalLiabilitiesAndTotalEquity,
        totalInvestments,
        totalDebt,
        netDebt,
        link,
        finalLink,
      ];
}
