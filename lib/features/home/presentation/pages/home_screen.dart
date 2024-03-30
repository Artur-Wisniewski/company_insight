import 'package:company_insight_app/core/styles/gaps.dart';
import 'package:company_insight_app/core/styles/paddings.dart';
import 'package:company_insight_app/core/widgets/background.dart';
import 'package:company_insight_app/core/widgets/search_bar.dart';
import 'package:company_insight_app/translations/l10n.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundBlur(
        child: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: Paddings.extraLargeTop,
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Flexible(
                      child: Padding(
                        padding: Paddings.largeHorizontal,
                        child: Text(L10n.current.helloUser('Artur'), style: Theme.of(context).textTheme.displaySmall),
                      ),
                    ),
                    Gaps.large,
                    const AppSearchBar(),
                  ],
                ),
              ),
              Gaps.medium,
              Padding(
                padding: Paddings.largeHorizontal,
                child: Text(L10n.current.findCompanyYouAreInterested, style: Theme.of(context).textTheme.titleMedium),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
