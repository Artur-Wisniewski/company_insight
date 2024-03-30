import 'package:company_insight_app/core/styles/styles.dart';
import 'package:company_insight_app/core/widgets/app_back_button.dart';
import 'package:company_insight_app/core/widgets/background.dart';
import 'package:company_insight_app/core/widgets/search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';

class SearchCompaniesView extends StatefulWidget {
  const SearchCompaniesView({super.key});

  @override
  State<SearchCompaniesView> createState() => _SearchCompaniesViewState();
}

class _SearchCompaniesViewState extends State<SearchCompaniesView> with TickerProviderStateMixin {
  late final AnimationController animationController = AnimationController(vsync: this);

  @override
  Widget build(BuildContext context) {
    return KeyboardDismissOnTap(
      child: Scaffold(
        body: BackgroundBlur(
          corner: Corners.bottomRight,
          child: SafeArea(
            child: Padding(
              padding: Paddings.extraLargeVertical,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: Paddings.smallLeft,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppBackButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                        const Flexible(
                          child: AppSearchBar(
                            isExpanded: true,
                            isReadOnly: false,
                            animationDelay: Duration.zero,
                            animationDuration: Duration.zero,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(child: Container())
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
