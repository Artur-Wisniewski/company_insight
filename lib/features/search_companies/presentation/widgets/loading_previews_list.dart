import 'package:company_insight_app/core/styles/gaps.dart';
import 'package:company_insight_app/core/styles/paddings.dart';
import 'package:company_insight_app/features/search_companies/presentation/widgets/loading_preview_card.dart';
import 'package:flutter/material.dart';

class LoadingPreviewsList extends StatelessWidget {
  const LoadingPreviewsList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (BuildContext context, int index) => const LoadingPreviewCard(),
      separatorBuilder: (BuildContext context, int index) => Gaps.medium,
      itemCount: 20,
      padding: Paddings.largeAllExceptTop,
    );
  }
}
