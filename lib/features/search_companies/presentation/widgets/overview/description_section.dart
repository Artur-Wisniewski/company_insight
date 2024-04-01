import 'package:company_insight_app/core/styles/gaps.dart';
import 'package:company_insight_app/core/widgets/app_shimmer.dart';
import 'package:company_insight_app/translations/l10n.dart';
import 'package:flutter/material.dart';

class DescriptionSection extends StatelessWidget {
  const DescriptionSection({super.key, this.description, this.isLoading = false});

  final String? description;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(L10n.current.description, style: Theme.of(context).textTheme.titleLarge),
        Gaps.small,
        if(isLoading)
          const AppShimmer(child: SizedBox(width: double.infinity, height: 400))
        else
        Text(
          description ?? L10n.current.notAvailable,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ],
    );
  }
}
