import 'package:equatable/equatable.dart';

class CompanyProfileEntity extends Equatable {
  const CompanyProfileEntity({
    required this.symbol,
    this.price,
    this.beta,
    this.volAvg,
    this.mktCap,
    this.lastDiv,
    this.range,
    this.changes,
    this.companyName,
    this.currency,
    this.cik,
    this.isin,
    this.cusip,
    this.exchange,
    this.exchangeShortName,
    this.industry,
    this.website,
    this.description,
    this.ceo,
    this.sector,
    this.country,
    this.fullTimeEmployees,
    this.phone,
    this.address,
    this.city,
    this.state,
    this.zip,
    this.dcfDiff,
    this.dcf,
    this.image,
    this.ipoDate,
    this.defaultImage,
    this.isEtf,
    this.isActivelyTrading,
    this.isAdr,
    this.isFund,
  });

  final String? symbol;
  final double? price;
  final double? beta;
  final int? volAvg;
  final int? mktCap;
  final double? lastDiv;
  final String? range;
  final double? changes;
  final String? companyName;
  final String? currency;
  final String? cik;
  final String? isin;
  final String? cusip;
  final String? exchange;
  final String? exchangeShortName;
  final String? industry;
  final String? website;
  final String? description;
  final String? ceo;
  final String? sector;
  final String? country;
  final String? fullTimeEmployees;
  final String? phone;
  final String? address;
  final String? city;
  final String? state;
  final String? zip;
  final double? dcfDiff;
  final double? dcf;
  final String? image;
  final String? ipoDate;
  final bool? defaultImage;
  final bool? isEtf;
  final bool? isActivelyTrading;
  final bool? isAdr;
  final bool? isFund;

  @override
  List<Object?> get props => [
        symbol,
        price,
        beta,
        volAvg,
        mktCap,
        lastDiv,
        range,
        changes,
        companyName,
        currency,
        cik,
        isin,
        cusip,
        exchange,
        exchangeShortName,
        industry,
        website,
        description,
        ceo,
        sector,
        country,
        fullTimeEmployees,
        phone,
        address,
        city,
        state,
        zip,
        dcfDiff,
        dcf,
        image,
        ipoDate,
        defaultImage,
        isEtf,
        isActivelyTrading,
        isAdr,
        isFund,
      ];
}
