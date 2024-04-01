import 'package:company_insight_app/core/services/shared_preferences.dart';
import 'package:company_insight_app/core/styles/gaps.dart';
import 'package:company_insight_app/core/styles/paddings.dart';
import 'package:company_insight_app/core/widgets/snackbars.dart';
import 'package:company_insight_app/setup/injectable.dart';
import 'package:company_insight_app/setup/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:showcaseview/showcaseview.dart';

import '../../../domain/entities/company_overview.dart';
import '../../manager/favorite_companies/favorite_companies_cubit.dart';
import '../../manager/search_company_previews/search_company_previews_bloc.dart';
import '../company_preview_card.dart';
import '../loading_preview_card.dart';

class CompanyPreviewsList extends StatefulWidget {
  const CompanyPreviewsList({super.key, required this.state});

  final SearchCompanyOverviewsDone state;

  @override
  State<CompanyPreviewsList> createState() => _CompanyPreviewsListState();
}

class _CompanyPreviewsListState extends State<CompanyPreviewsList> {
  final GlobalKey<AnimatedListState> _saveRemoveKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: Paddings.largeAllExceptTop,
      itemBuilder: (context, index) {
        if (index == 0) {
          _onFirstBookmarkButtonAppear();
        }
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
      widget.state.companyPreviews.length +
      (widget.state is SearchCompanyPreviewsLoadingMore ? SearchCompanyOverviewsBloc.itemsPerPage : 0);

  void _onLastVisibleItemRendered(BuildContext context) {
    final bloc = context.read<SearchCompanyOverviewsBloc>();
    if (bloc.state is! SearchCompanyPreviewsLoadingMore) {
      bloc.add(const SearchCompanyOverviewsLoadMore());
    }
  }

  bool isLastItem(int index) => index == widget.state.companyPreviews.length - 1;

  bool isLoadingCard(int index) => index >= widget.state.companyPreviews.length;

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

  void onCardTap(BuildContext context, {required CompanyPreviewEntity companyPreview}) {
    context.push(RoutesPaths.companyOverview, extra: companyPreview);
  }

  Widget _buildCompanyPreviewCardElement(int index) {
    final companyPreview = widget.state.companyPreviews[index];
    return BlocBuilder<FavoriteCompaniesCubit, FavoriteCompaniesState>(
      buildWhen: (previous, current) => current is FavoriteCompaniesDone,
      builder: (context, favoriteCompaniesState) {
        return CompanyPreviewCard(
          onBookMarkButtonPressed: () => onBookMarkButtonPressed(
            state: favoriteCompaniesState,
            context: context,
            companyPreview: companyPreview,
          ),
          onTap: () => onCardTap(context, companyPreview: companyPreview),
          name: companyPreview.name ?? '',
          symbol: companyPreview.symbol ?? '',
          isSelected: getIsSelected(
            state: favoriteCompaniesState,
            context: context,
            companyPreview: companyPreview,
          ),
          globalKey: index == 0 ? _saveRemoveKey : null,
        );
      },
    );
  }

  Future<void> _onFirstBookmarkButtonAppear() async {
    final sharePreferences = getIt.get<AppSharedPreferences>();
    final bool hasSeenFavoriteHint = await sharePreferences.getHasSeenFavoriteHint();
    final bool hasSkippedOnboarding = await sharePreferences.getHasSkippedOnboarding();
    if (!hasSeenFavoriteHint && !hasSkippedOnboarding) {
      if (mounted) {
        ShowCaseWidget.of(context).startShowCase([_saveRemoveKey]);
        getIt.get<AppSharedPreferences>().setHasSeenFavoriteHint(true);
      }
    }
  }
}
