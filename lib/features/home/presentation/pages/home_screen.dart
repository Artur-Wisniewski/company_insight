import 'package:company_insight_app/core/styles/gaps.dart';
import 'package:company_insight_app/core/styles/paddings.dart';
import 'package:company_insight_app/core/widgets/background.dart';
import 'package:company_insight_app/core/widgets/search_bar.dart';
import 'package:company_insight_app/features/home/presentation/widgets/home_subtitle.dart';
import 'package:company_insight_app/features/home/presentation/widgets/home_title.dart';
import 'package:company_insight_app/setup/router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: BackgroundBlur(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: Paddings.extraLargeTop,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Flexible(
                      child: HomeSubtitle(name: 'Artur'),
                    ),
                    Gaps.large,
                    AppSearchBar(
                      onPressedWhenShrinked: () {
                        context.push(RoutesPaths.searchCompanies);
                      },
                    ),
                  ],
                ),
              ),
              Gaps.medium,
              const HomeTitle(),
            ],
          ),
        ),
      ),
    );
  }
}
