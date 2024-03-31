import 'package:company_insight_app/core/styles/gaps.dart';
import 'package:company_insight_app/core/styles/paddings.dart';
import 'package:company_insight_app/core/widgets/snackbars.dart';
import 'package:company_insight_app/features/search_companies/domain/entities/company_overview.dart';
import 'package:company_insight_app/features/search_companies/presentation/widgets/loading_preview_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../manager/favorite_companies/favorite_companies_cubit.dart';
import '../manager/search_company_previews/search_company_previews_bloc.dart';
import 'company_preview_card.dart';

class CompanyPreviewsList extends StatelessWidget {
  const CompanyPreviewsList({super.key, required this.state});

  final SearchCompanyOverviewsDone state;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: Paddings.largeAllExceptTop,
      itemBuilder: (context, index) {
        if (isLastItem(index)) {
          _onLastVisibleItemRendered(context);
        }
        if (!isLoadingCard(index)) {
          return _buildCompanyPreviewCardElement(index);
        }
        return const LoadingPreviewCard();
      },
      separatorBuilder: (context, index) => Gaps.medium,
      itemCount: itemCount,
    );
  }

  int get itemCount =>
      state.companyPreviews.length +
      (state is SearchCompanyPreviewsLoadingMore ? SearchCompanyOverviewsBloc.itemsPerPage : 0);

  void _onLastVisibleItemRendered(BuildContext context) {
    final bloc = context.read<SearchCompanyOverviewsBloc>();
    if (bloc.state is! SearchCompanyPreviewsLoadingMore) {
      bloc.add(const SearchCompanyOverviewsLoadMore());
    }
  }

  bool isLastItem(int index) => index == state.companyPreviews.length - 1;

  bool isLoadingCard(int index) => index >= state.companyPreviews.length;

  bool getIsSelected({
    required FavoriteCompaniesState state,
    required BuildContext context,
    required CompanyPreviewEntity companyPreview,
  }) {
    if (state is FavoriteCompaniesDone) {
      return state.companies.any((favoriteCompanyPreview) => favoriteCompanyPreview.symbol == companyPreview.symbol);
    }
    return false;
  }

  onBookMarkButtonPressed({
    required FavoriteCompaniesState state,
    required BuildContext context,
    required CompanyPreviewEntity companyPreview,
  }) {
    if (state is FavoriteCompaniesDone) {
      if (state.companies.any((favoriteCompanyPreview) => favoriteCompanyPreview.symbol == companyPreview.symbol)) {
        getRemoveFromFavoritesSnackbar(context).show(context);
      } else {
        getSaveToFavoritesSnackbar(context).show(context);
      }
      context.read<FavoriteCompaniesCubit>().toggleFavorite(companyPreview);
    }
  }

  Widget _buildCompanyPreviewCardElement(int index) {
    final companyPreview = state.companyPreviews[index];
    return BlocBuilder<FavoriteCompaniesCubit, FavoriteCompaniesState>(
      buildWhen: (previous, current) => current is FavoriteCompaniesDone,
      builder: (context, favoriteCompaniesState) {
        return CompanyPreviewCard(
          onBookMarkButtonPressed: () => onBookMarkButtonPressed(
            state: favoriteCompaniesState,
            context: context,
            companyPreview: companyPreview,
          ),
          name: companyPreview.name ?? '',
          symbol: companyPreview.symbol ?? '',
          isSelected: getIsSelected(
            state: favoriteCompaniesState,
            context: context,
            companyPreview: companyPreview,
          ),
        );
      },
    );
  }
}
