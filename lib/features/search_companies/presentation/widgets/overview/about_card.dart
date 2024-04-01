import 'package:company_insight_app/core/styles/gaps.dart';
import 'package:company_insight_app/core/styles/styles.dart';
import 'package:company_insight_app/core/widgets/app_card.dart';
import 'package:company_insight_app/core/widgets/app_shimmer.dart';
import 'package:company_insight_app/core/widgets/modals/modals.dart';
import 'package:company_insight_app/translations/l10n.dart';
import 'package:flutter/material.dart';

class AboutCard extends StatelessWidget {
  const AboutCard({
    super.key,
    this.ceo,
    this.industry,
    this.exchange,
    this.cusip,
    this.marketCap,
    this.isLoading = false,
  });

  final String? ceo;
  final String? industry;
  final String? exchange;
  final String? cusip;
  final int? marketCap;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return AppCard(
      child: Column(
        children: [
          _buildRow(context, L10n.current.ceo, ceo),
          Gaps.medium,
          _buildRow(context, L10n.current.industry, industry),
          Gaps.medium,
          _buildRow(context, L10n.current.exchange, exchange),
          Gaps.medium,
          _buildRow(context, L10n.current.cusip, cusip),
          Gaps.medium,
          _buildRow(context, L10n.current.marketCapitalization, marketCapShort),
          Gaps.large,
          _buildMarketSizeIndicator(context),
        ],
      ),
    );
  }

  Widget _buildRow(BuildContext context, String? label, String? content) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
            child: Text(
          label ?? L10n.current.notAvailable,
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.w600),
        )),
        Gaps.large,
        if (isLoading)
          const Expanded(child: AppShimmer(child: SizedBox(width: 100, height: 20)))
        else
          Expanded(
            child: Text(
              content ?? L10n.current.notAvailable,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
      ],
    );
  }

  Widget _buildMarketSizeIndicator(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
            flex: 2,
            child: Text(
              L10n.current.marketSizeIndicator,
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.w600),
            )),
        Gaps.large,
        Flexible(
          flex: 3,
          child: Row(
            children: [
              if (isLoading)
                const AppShimmer(child: SizedBox(width: 100, height: 70))
              else
                Flexible(
                  child: Container(
                    padding: Paddings.smallAll,
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.surface,
                      borderRadius: BorderRadii.mediumAll,
                    ),
                    child: Text(marketSizeIndicator, style: Theme.of(context).textTheme.bodyLarge),
                  ),
                ),
              IconButton(
                onPressed: () => Modals.showCapInfo(context),
                icon: Icon(Icons.info_outline, color: Theme.of(context).colorScheme.secondary),
              ),
            ],
          ),
        ),
      ],
    );
  }

  String get marketSizeIndicator {
    switch (marketCap ?? 0) {
      case > 200000000000:
        return L10n.current.megaCap;
      case > 10000000000:
        return L10n.current.largeCap;
      case > 2000000000:
        return L10n.current.midCap;
      case > 250000000:
        return L10n.current.smallCap;
      default:
        return L10n.current.microCap;
    }
  }

  String get marketCapShort {
    final marketCapitalization = (marketCap ?? 0);
    switch (marketCapitalization) {
      case > 1000000000000:
        return '${(marketCapitalization / 1000000000000).toStringAsFixed(2)}T';
      case > 1000000000:
        return '${(marketCapitalization / 1000000000).toStringAsFixed(2)}B';
      case > 1000000:
        return '${(marketCapitalization / 1000000).toStringAsFixed(2)}M';
      case > 1000:
        return '${(marketCapitalization / 1000).toStringAsFixed(2)}K';
      default:
        return marketCap.toString();
    }
  }
}
