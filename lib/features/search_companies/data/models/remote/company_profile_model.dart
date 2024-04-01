import 'package:company_insight_app/features/search_companies/domain/entities/company_profile.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'company_profile_model.freezed.dart';

part 'company_profile_model.g.dart';

@freezed
class CompanyProfileModel with _$CompanyProfileModel {
  const factory CompanyProfileModel({
    required String? symbol,
    required double? price,
    required double? beta,
    required int? volAvg,
    required int? mktCap,
    required double? lastDiv,
    required String? range,
    required double? changes,
    required String? companyName,
    required String? currency,
    required String? cik,
    required String? isin,
    required String? cusip,
    required String? exchange,
    required String? exchangeShortName,
    required String? industry,
    required String? website,
    required String? description,
    required String? ceo,
    required String? sector,
    required String? country,
    required String? fullTimeEmployees,
    required String? phone,
    required String? address,
    required String? city,
    required String? state,
    required String? zip,
    required double? dcfDiff,
    required double? dcf,
    required String? image,
    required String? ipoDate,
    required bool? defaultImage,
    required bool? isEtf,
    required bool? isActivelyTrading,
    required bool? isAdr,
    required bool? isFund,
  }) = _CompanyProfileModel;

  factory CompanyProfileModel.fromJson(Map<String, dynamic> json) => _$CompanyProfileModelFromJson(json);
}

extension CompanyProfileDomainExtension on CompanyProfileModel {
  CompanyProfileEntity toDomain() => CompanyProfileEntity(
        symbol: symbol,
        price: price,
        beta: beta,
        volAvg: volAvg,
        mktCap: mktCap,
        lastDiv: lastDiv,
        range: range,
        changes: changes,
        companyName: companyName,
        currency: currency,
        cik: cik,
        isin: isin,
        cusip: cusip,
        exchange: exchange,
        exchangeShortName: exchangeShortName,
        industry: industry,
        website: website,
        description: description,
        ceo: ceo,
        sector: sector,
        country: country,
        fullTimeEmployees: fullTimeEmployees,
        phone: phone,
        address: address,
        city: city,
        state: state,
        zip: zip,
        dcfDiff: dcfDiff,
        dcf: dcf,
        image: image,
        ipoDate: ipoDate,
        defaultImage: defaultImage,
        isEtf: isEtf,
        isActivelyTrading: isActivelyTrading,
        isAdr: isAdr,
        isFund: isFund,
      );
}
