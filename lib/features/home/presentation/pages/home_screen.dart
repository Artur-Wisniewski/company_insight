import 'package:company_insight_app/core/constants/paddings.dart';
import 'package:company_insight_app/core/widgets/background.dart';
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
      body: SafeArea(
        child: BackgroundBlur(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Padding(
                    padding: Paddings.largeHorizontalExtraLargeVertical,
                    child: Text(L10n.current.helloUser('Artur'), style: Theme.of(context).textTheme.displaySmall),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
