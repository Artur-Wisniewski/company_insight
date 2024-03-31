import 'package:company_insight_app/core/styles/gaps.dart';
import 'package:company_insight_app/core/styles/paddings.dart';
import 'package:company_insight_app/features/search_companies/presentation/widgets/loading_preview_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../manager/search_company_previews/search_company_previews_bloc.dart';
import 'company_preview_card.dart';

class CompanyPreviewsList extends StatelessWidget {
  const CompanyPreviewsList({super.key, required this.state});

  final SearchCompanyOverviewsDone state;

  @override
  Widget build(BuildContext context) {
    final itemCount = state.companyOverviews.length +
        (state is SearchCompanyOverviewsLoadingMore ? SearchCompanyOverviewsBloc.itemsPerPage : 0);

    return ListView.separated(
      padding: Paddings.largeAllExceptTop,
      itemBuilder: (context, index) {
        if (index == state.companyOverviews.length - 1) {
          final bloc = context.read<SearchCompanyOverviewsBloc>();
          if (bloc.state is! SearchCompanyOverviewsLoadingMore) {
            bloc.add(const SearchCompanyOverviewsLoadMore());
          }
        }
        if (index < state.companyOverviews.length) {
          final companyOverview = state.companyOverviews[index];
          return CompanyPreviewCard(
            onBookMarkButtonPressed: () {},
            name: companyOverview.name ?? '',
            symbol: companyOverview.symbol ?? '',
            isSelected: false,
          );
        }
        return const LoadingPreviewCard();
      },
      separatorBuilder: (context, index) => Gaps.medium,
      itemCount: itemCount,
    );
  }
}
