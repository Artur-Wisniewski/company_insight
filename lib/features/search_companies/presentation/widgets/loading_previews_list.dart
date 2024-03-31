import 'package:company_insight_app/core/styles/paddings.dart';
import 'package:company_insight_app/features/search_companies/presentation/widgets/loading_preview_card.dart';
import 'package:flutter/material.dart';

class LoadingPreviewsList extends StatelessWidget {
  const LoadingPreviewsList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: List.generate(
        20,
        (index) => const Padding(
          padding: Paddings.largeAllExceptTop,
          child: LoadingPreviewCard(),
        ),
      ),
    );
  }
}
