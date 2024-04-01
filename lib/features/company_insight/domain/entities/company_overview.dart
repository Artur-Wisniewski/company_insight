import 'package:equatable/equatable.dart';

class CompanyPreviewEntity extends Equatable {
  const CompanyPreviewEntity({
    required this.symbol,
    required this.name,
    required this.currency,
    required this.stockExchange,
    required this.exchangeShortName,
  });

  final String? symbol;
  final String? name;
  final String? currency;
  final String? stockExchange;
  final String? exchangeShortName;

  @override
  List<Object?> get props => [symbol, name, currency, stockExchange, exchangeShortName];
}
