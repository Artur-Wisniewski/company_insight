import 'package:company_insight_app/core/styles/gaps.dart';
import 'package:company_insight_app/translations/l10n.dart';
import 'package:flutter/material.dart';

class DescriptionSection extends StatelessWidget {
  const DescriptionSection({super.key, required this.description});

  final String description;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(L10n.current.description, style: Theme.of(context).textTheme.titleLarge),
        Gaps.small,
        Text(
          description,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ],
    );
  }
}
