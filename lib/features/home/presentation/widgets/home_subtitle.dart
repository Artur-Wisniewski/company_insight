import 'package:company_insight_app/core/styles/paddings.dart';
import 'package:company_insight_app/translations/l10n.dart';
import 'package:flutter/material.dart';

class HomeSubtitle extends StatelessWidget {
  const HomeSubtitle({super.key, required this.name});

  final String name;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Paddings.largeHorizontal,
      child: Text(
        L10n.current.helloUser(name),
        style: Theme.of(context).textTheme.displaySmall,
      ),
    );
  }
}
