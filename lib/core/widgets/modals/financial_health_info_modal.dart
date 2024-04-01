import 'package:company_insight_app/core/styles/gaps.dart';
import 'package:company_insight_app/translations/l10n.dart';
import 'package:flutter/material.dart';

import 'modal_card.dart';

class FinancialHealthInfoModal extends StatelessWidget {
  const FinancialHealthInfoModal({
    super.key,
    required this.descriptionContent,
    required this.formulaContent,
    required this.title,
  });

  final String title;
  final String descriptionContent;
  final String formulaContent;

  @override
  Widget build(BuildContext context) {
    return ModalCard(
      title: title,
      icon: Icon(
        Icons.info_outline,
        color: Theme.of(context).colorScheme.secondary,
      ),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(L10n.current.description, style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.bold)),
          Text(descriptionContent, style: Theme.of(context).textTheme.bodyMedium),
          Gaps.medium,
          Text(L10n.current.formula, style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.bold)),
          Text(formulaContent, style: Theme.of(context).textTheme.bodyMedium),
        ],
      ),
    );
  }
}
