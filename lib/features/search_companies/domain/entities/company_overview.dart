class CompanyPreviewEntity {
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
}