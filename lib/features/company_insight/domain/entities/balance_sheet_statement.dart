import 'package:equatable/equatable.dart';

class BalanceSheetStatementEntity extends Equatable {
  const BalanceSheetStatementEntity({
    required this.date,
    required this.symbol,
    required this.totalCurrentAssets,
    required this.totalCurrentLiabilities,
    required this.totalStockholdersEquity,
    this.reportedCurrency,
    this.cik,
    this.fillingDate,
    this.acceptedDate,
    this.calendarYear,
    this.period,
    this.cashAndCashEquivalents,
    this.shortTermInvestments,
    this.cashAndShortTermInvestments,
    this.netReceivables,
    this.inventory,
    this.otherCurrentAssets,
    this.propertyPlantEquipmentNet,
    this.goodwill,
    this.intangibleAssets,
    this.goodwillAndIntangibleAssets,
    this.longTermInvestments,
    this.taxAssets,
    this.otherNonCurrentAssets,
    this.totalNonCurrentAssets,
    this.otherAssets,
    this.totalAssets,
    this.accountPayables,
    this.shortTermDebt,
    this.taxPayables,
    this.deferredRevenue,
    this.otherCurrentLiabilities,
    this.longTermDebt,
    this.deferredRevenueNonCurrent,
    this.deferredTaxLiabilitiesNonCurrent,
    this.otherNonCurrentLiabilities,
    this.totalNonCurrentLiabilities,
    this.otherLiabilities,
    this.capitalLeaseObligations,
    this.totalLiabilities,
    this.preferredStock,
    this.commonStock,
    this.retainedEarnings,
    this.accumulatedOtherComprehensiveIncomeLoss,
    this.othertotalStockholdersEquity,
    this.totalEquity,
    this.totalLiabilitiesAndStockholdersEquity,
    this.minorityInterest,
    this.totalLiabilitiesAndTotalEquity,
    this.totalInvestments,
    this.totalDebt,
    this.netDebt,
    this.link,
    this.finalLink,
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
