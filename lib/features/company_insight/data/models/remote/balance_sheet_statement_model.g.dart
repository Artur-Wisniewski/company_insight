// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'balance_sheet_statement_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BalanceSheetStatementModelImpl _$$BalanceSheetStatementModelImplFromJson(
        Map<String, dynamic> json) =>
    _$BalanceSheetStatementModelImpl(
      date:
          json['date'] == null ? null : DateTime.parse(json['date'] as String),
      symbol: json['symbol'] as String,
      reportedCurrency: json['reportedCurrency'] as String?,
      cik: json['cik'] as String?,
      fillingDate: json['fillingDate'] == null
          ? null
          : DateTime.parse(json['fillingDate'] as String),
      acceptedDate: json['acceptedDate'] == null
          ? null
          : DateTime.parse(json['acceptedDate'] as String),
      calendarYear: json['calendarYear'] as String?,
      period: json['period'] as String?,
      cashAndCashEquivalents: json['cashAndCashEquivalents'] as int?,
      shortTermInvestments: json['shortTermInvestments'] as int?,
      cashAndShortTermInvestments: json['cashAndShortTermInvestments'] as int?,
      netReceivables: json['netReceivables'] as int?,
      inventory: json['inventory'] as int?,
      otherCurrentAssets: json['otherCurrentAssets'] as int?,
      totalCurrentAssets: json['totalCurrentAssets'] as int?,
      propertyPlantEquipmentNet: json['propertyPlantEquipmentNet'] as int?,
      goodwill: json['goodwill'] as int?,
      intangibleAssets: json['intangibleAssets'] as int?,
      goodwillAndIntangibleAssets: json['goodwillAndIntangibleAssets'] as int?,
      longTermInvestments: json['longTermInvestments'] as int?,
      taxAssets: json['taxAssets'] as int?,
      otherNonCurrentAssets: json['otherNonCurrentAssets'] as int?,
      totalNonCurrentAssets: json['totalNonCurrentAssets'] as int?,
      otherAssets: json['otherAssets'] as int?,
      totalAssets: json['totalAssets'] as int?,
      accountPayables: json['accountPayables'] as int?,
      shortTermDebt: json['shortTermDebt'] as int?,
      taxPayables: json['taxPayables'] as int?,
      deferredRevenue: json['deferredRevenue'] as int?,
      otherCurrentLiabilities: json['otherCurrentLiabilities'] as int?,
      totalCurrentLiabilities: json['totalCurrentLiabilities'] as int?,
      longTermDebt: json['longTermDebt'] as int?,
      deferredRevenueNonCurrent: json['deferredRevenueNonCurrent'] as int?,
      deferredTaxLiabilitiesNonCurrent:
          json['deferredTaxLiabilitiesNonCurrent'] as int?,
      otherNonCurrentLiabilities: json['otherNonCurrentLiabilities'] as int?,
      totalNonCurrentLiabilities: json['totalNonCurrentLiabilities'] as int?,
      otherLiabilities: json['otherLiabilities'] as int?,
      capitalLeaseObligations: json['capitalLeaseObligations'] as int?,
      totalLiabilities: json['totalLiabilities'] as int?,
      preferredStock: json['preferredStock'] as int?,
      commonStock: json['commonStock'] as int?,
      retainedEarnings: json['retainedEarnings'] as int?,
      accumulatedOtherComprehensiveIncomeLoss:
          json['accumulatedOtherComprehensiveIncomeLoss'] as int?,
      othertotalStockholdersEquity:
          json['othertotalStockholdersEquity'] as int?,
      totalStockholdersEquity: json['totalStockholdersEquity'] as int?,
      totalEquity: json['totalEquity'] as int?,
      totalLiabilitiesAndStockholdersEquity:
          json['totalLiabilitiesAndStockholdersEquity'] as int?,
      minorityInterest: json['minorityInterest'] as int?,
      totalLiabilitiesAndTotalEquity:
          json['totalLiabilitiesAndTotalEquity'] as int?,
      totalInvestments: json['totalInvestments'] as int?,
      totalDebt: json['totalDebt'] as int?,
      netDebt: json['netDebt'] as int?,
      link: json['link'] as String?,
      finalLink: json['finalLink'] as String?,
    );

Map<String, dynamic> _$$BalanceSheetStatementModelImplToJson(
        _$BalanceSheetStatementModelImpl instance) =>
    <String, dynamic>{
      'date': instance.date?.toIso8601String(),
      'symbol': instance.symbol,
      'reportedCurrency': instance.reportedCurrency,
      'cik': instance.cik,
      'fillingDate': instance.fillingDate?.toIso8601String(),
      'acceptedDate': instance.acceptedDate?.toIso8601String(),
      'calendarYear': instance.calendarYear,
      'period': instance.period,
      'cashAndCashEquivalents': instance.cashAndCashEquivalents,
      'shortTermInvestments': instance.shortTermInvestments,
      'cashAndShortTermInvestments': instance.cashAndShortTermInvestments,
      'netReceivables': instance.netReceivables,
      'inventory': instance.inventory,
      'otherCurrentAssets': instance.otherCurrentAssets,
      'totalCurrentAssets': instance.totalCurrentAssets,
      'propertyPlantEquipmentNet': instance.propertyPlantEquipmentNet,
      'goodwill': instance.goodwill,
      'intangibleAssets': instance.intangibleAssets,
      'goodwillAndIntangibleAssets': instance.goodwillAndIntangibleAssets,
      'longTermInvestments': instance.longTermInvestments,
      'taxAssets': instance.taxAssets,
      'otherNonCurrentAssets': instance.otherNonCurrentAssets,
      'totalNonCurrentAssets': instance.totalNonCurrentAssets,
      'otherAssets': instance.otherAssets,
      'totalAssets': instance.totalAssets,
      'accountPayables': instance.accountPayables,
      'shortTermDebt': instance.shortTermDebt,
      'taxPayables': instance.taxPayables,
      'deferredRevenue': instance.deferredRevenue,
      'otherCurrentLiabilities': instance.otherCurrentLiabilities,
      'totalCurrentLiabilities': instance.totalCurrentLiabilities,
      'longTermDebt': instance.longTermDebt,
      'deferredRevenueNonCurrent': instance.deferredRevenueNonCurrent,
      'deferredTaxLiabilitiesNonCurrent':
          instance.deferredTaxLiabilitiesNonCurrent,
      'otherNonCurrentLiabilities': instance.otherNonCurrentLiabilities,
      'totalNonCurrentLiabilities': instance.totalNonCurrentLiabilities,
      'otherLiabilities': instance.otherLiabilities,
      'capitalLeaseObligations': instance.capitalLeaseObligations,
      'totalLiabilities': instance.totalLiabilities,
      'preferredStock': instance.preferredStock,
      'commonStock': instance.commonStock,
      'retainedEarnings': instance.retainedEarnings,
      'accumulatedOtherComprehensiveIncomeLoss':
          instance.accumulatedOtherComprehensiveIncomeLoss,
      'othertotalStockholdersEquity': instance.othertotalStockholdersEquity,
      'totalStockholdersEquity': instance.totalStockholdersEquity,
      'totalEquity': instance.totalEquity,
      'totalLiabilitiesAndStockholdersEquity':
          instance.totalLiabilitiesAndStockholdersEquity,
      'minorityInterest': instance.minorityInterest,
      'totalLiabilitiesAndTotalEquity': instance.totalLiabilitiesAndTotalEquity,
      'totalInvestments': instance.totalInvestments,
      'totalDebt': instance.totalDebt,
      'netDebt': instance.netDebt,
      'link': instance.link,
      'finalLink': instance.finalLink,
    };
