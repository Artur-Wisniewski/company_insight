import 'package:company_insight_app/features/search_companies/domain/entities/company_overview.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'company_preview_model.freezed.dart';

part 'company_preview_model.g.dart';

@freezed
class CompanyPreviewModel with _$CompanyPreviewModel {
  const factory CompanyPreviewModel({
    required String? symbol,
    required String? name,
    required String? currency,
    required String? stockExchange,
    required String? exchangeShortName,
  }) = _CompanyOverviewModel;

  factory CompanyPreviewModel.fromJson(Map<String, dynamic> json) => _$CompanyPreviewModelFromJson(json);
}

extension CompanyPreviewDomainExtension on CompanyPreviewModel {
  CompanyPreviewEntity toDomain() => CompanyPreviewEntity(
        symbol: symbol,
        name: name,
        currency: currency,
        stockExchange: stockExchange,
        exchangeShortName: exchangeShortName,
      );
}
