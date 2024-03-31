import 'package:floor/floor.dart';

import '../../../domain/entities/company_overview.dart';

@Entity(tableName: 'companies_overviews', primaryKeys: ['symbol'])
class CompanyPreviewDTO extends CompanyPreviewEntity {
  const CompanyPreviewDTO({
    required super.symbol,
    required super.name,
    required super.currency,
    required super.stockExchange,
    required super.exchangeShortName,
  });

  CompanyPreviewEntity toDomain() => CompanyPreviewEntity(
        symbol: symbol,
        name: name,
        currency: currency,
        stockExchange: stockExchange,
        exchangeShortName: exchangeShortName,
      );

  factory CompanyPreviewDTO.fromDomain(CompanyPreviewEntity companyOverview) => CompanyPreviewDTO(
        symbol: companyOverview.symbol,
        name: companyOverview.name,
        currency: companyOverview.currency,
        stockExchange: companyOverview.stockExchange,
        exchangeShortName: companyOverview.exchangeShortName,
      );
}
