import 'package:company_insight_app/core/widgets/background.dart';
import 'package:flutter/material.dart';

class SearchCompaniesView extends StatelessWidget {
  const SearchCompaniesView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: BackgroundBlur(
        corner: Corners.bottomRight,
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(child: Text('Search Companies')),
            ],
          ),
        ),
      ),
    );
  }
}
