import 'package:company_insight_app/core/styles/paddings.dart';
import 'package:company_insight_app/translations/l10n.dart';
import 'package:flutter/material.dart';

class HomeTitle extends StatelessWidget {
  const HomeTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Paddings.largeHorizontal,
      child: Text(L10n.current.findCompanyYouAreInterested, style: Theme.of(context).textTheme.titleMedium),
    );
  }
}
