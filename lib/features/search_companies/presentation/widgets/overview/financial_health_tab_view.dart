import 'package:company_insight_app/core/styles/gaps.dart';
import 'package:flutter/material.dart';

class FinancialHealthTabView extends StatelessWidget {
  const FinancialHealthTabView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Financial Health', style: Theme.of(context).textTheme.titleLarge),
        Gaps.small,
        Text(
          'This is a description of the financial health of the company',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ],);
  }
}
