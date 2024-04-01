import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/entities/balance_sheet_statement.dart';

part 'balance_sheet_statement_model.freezed.dart';part 'balance_sheet_statement_model.g.dart';

@freezed
class BalanceSheetStatementModel with _$BalanceSheetStatementModel {
  const factory BalanceSheetStatementModel({
    required DateTime? date,
    required String symbol,
    required String? reportedCurrency,
    required String? cik,
    required DateTime? fillingDate,
    required DateTime? acceptedDate,
    required String? calendarYear,
    required String? period,
    required int? cashAndCashEquivalents,
    required int? shortTermInvestments,
    required int? cashAndShortTermInvestments,
    required int? netReceivables,
    required int? inventory,
    required int? otherCurrentAssets,
    required int? totalCurrentAssets,
    required int? propertyPlantEquipmentNet,
    required int? goodwill,
    required int? intangibleAssets,
    required int? goodwillAndIntangibleAssets,
    required int? longTermInvestments,
    required int? taxAssets,
    required int? otherNonCurrentAssets,
    required int? totalNonCurrentAssets,
    required int? otherAssets,
    required int? totalAssets,
    required int? accountPayables,
    required int? shortTermDebt,
    required int? taxPayables,
    required int? deferredRevenue,
    required int? otherCurrentLiabilities,
    required int? totalCurrentLiabilities,
    required int? longTermDebt,
    required int? deferredRevenueNonCurrent,
    required int? deferredTaxLiabilitiesNonCurrent,
    required int? otherNonCurrentLiabilities,
    required int? totalNonCurrentLiabilities,
    required int? otherLiabilities,
    required int? capitalLeaseObligations,
    required int? totalLiabilities,
    required int? preferredStock,
    required int? commonStock,
    required int? retainedEarnings,
    required int? accumulatedOtherComprehensiveIncomeLoss,
    required int? othertotalStockholdersEquity,
    required int? totalStockholdersEquity,
    required int? totalEquity,
    required int? totalLiabilitiesAndStockholdersEquity,
    required int? minorityInterest,
    required int? totalLiabilitiesAndTotalEquity,
    required int? totalInvestments,
    required int? totalDebt,
    required int? netDebt,
    required String? link,
    required String? finalLink,
  }) = _BalanceSheetStatementModel;

  factory BalanceSheetStatementModel.fromJson(Map<String, dynamic> json) => _$BalanceSheetStatementModelFromJson(json);
}

extension BalanceSheetDomainExtension on BalanceSheetStatementModel {
  BalanceSheetStatementEntity toDomain() => BalanceSheetStatementEntity(
        date: date,
        symbol: symbol,
        reportedCurrency: reportedCurrency,
        cik: cik,
        fillingDate: fillingDate,
        acceptedDate: acceptedDate,
        calendarYear: calendarYear,
        period: period,
        cashAndCashEquivalents: cashAndCashEquivalents,
        shortTermInvestments: shortTermInvestments,
        cashAndShortTermInvestments: cashAndShortTermInvestments,
        netReceivables: netReceivables,
        inventory: inventory,
        otherCurrentAssets: otherCurrentAssets,
        totalCurrentAssets: totalCurrentAssets,
        propertyPlantEquipmentNet: propertyPlantEquipmentNet,
        goodwill: goodwill,
        intangibleAssets: intangibleAssets,
        goodwillAndIntangibleAssets: goodwillAndIntangibleAssets,
        longTermInvestments: longTermInvestments,
        taxAssets: taxAssets,
        otherNonCurrentAssets: otherNonCurrentAssets,
        totalNonCurrentAssets: totalNonCurrentAssets,
        otherAssets: otherAssets,
        totalAssets: totalAssets,
        accountPayables: accountPayables,
        shortTermDebt: shortTermDebt,
        taxPayables: taxPayables,
        deferredRevenue: deferredRevenue,
        otherCurrentLiabilities: otherCurrentLiabilities,
        totalCurrentLiabilities: totalCurrentLiabilities,
        longTermDebt: longTermDebt,
        deferredRevenueNonCurrent: deferredRevenueNonCurrent,
        deferredTaxLiabilitiesNonCurrent: deferredTaxLiabilitiesNonCurrent,
        otherNonCurrentLiabilities: otherNonCurrentLiabilities,
        totalNonCurrentLiabilities: totalNonCurrentLiabilities,
        otherLiabilities: otherLiabilities,
        capitalLeaseObligations: capitalLeaseObligations,
        totalLiabilities: totalLiabilities,
        preferredStock: preferredStock,
        commonStock: commonStock,
        retainedEarnings: retainedEarnings,
        accumulatedOtherComprehensiveIncomeLoss: accumulatedOtherComprehensiveIncomeLoss,
        othertotalStockholdersEquity: othertotalStockholdersEquity,
        totalStockholdersEquity: totalStockholdersEquity,
        totalEquity: totalEquity,
        totalLiabilitiesAndStockholdersEquity: totalLiabilitiesAndStockholdersEquity,
        minorityInterest: minorityInterest,
        totalLiabilitiesAndTotalEquity: totalLiabilitiesAndTotalEquity,
        totalInvestments: totalInvestments,
        totalDebt: totalDebt,
        netDebt: netDebt,
        link: link,
        finalLink: finalLink,
      );
}