import 'package:company_insight_app/core/styles/gaps.dart';
import 'package:company_insight_app/core/styles/styles.dart';
import 'package:company_insight_app/core/widgets/snackbars.dart';
import 'package:company_insight_app/setup/injectable.dart';
import 'package:company_insight_app/setup/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../domain/entities/company_overview.dart';
import '../../manager/favorite_companies/favorite_companies_cubit.dart';
import '../company_preview_card.dart';
import '../something_went_wrong_info_block.dart';
import 'favourites_companies_empty_info.dart';

class FavouritesCompaniesList extends StatelessWidget {
  const FavouritesCompaniesList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoriteCompaniesCubit, FavoriteCompaniesState>(
      bloc: getIt.get(),
      builder: (context, state) {
        if (state is FavoriteCompaniesDone && state.companies.isEmpty) {
          return const FavouritesCompaniesEmptyInfo();
        }
        return ListView.separated(
          padding: Paddings.largeAllExceptTop,
          itemBuilder: (context, index) {
            if (state is FavoriteCompaniesDone) {
              final company = state.companies[index];
              return CompanyPreviewCard(
                onBookMarkButtonPressed: () => _onBookMarkButtonPressed(context, company),
                name: company.name ?? '',
                symbol: company.symbol ?? '',
                isSelected: true,
                onTap: () => onCardTap(context, companyPreview: company),
              );
            }
            if (state is FavoriteCompaniesFailure) {
              return const SomethingWentWrongInfoBlock();
            }

            return const SizedBox();
          },
          separatorBuilder: (context, index) => Gaps.medium,
          itemCount: _getItemCount(state),
        )
            .animate()
            .fadeIn(
              duration: Durations.short4,
            )
            .slideX(
              begin: 0.5,
              end: 0.0,
              duration: Durations.short4,
            );
      },
    );
  }

  void onCardTap(BuildContext context, {required CompanyPreviewEntity companyPreview}) {
    context.push(RoutesPaths.companyOverview, extra: companyPreview);
  }

  void _onBookMarkButtonPressed(BuildContext context, CompanyPreviewEntity companyPreview) {
    getIt.get<FavoriteCompaniesCubit>().toggleFavorite(companyPreview);
    getRemoveFromFavoritesSnackbar(context).show(context);
  }

  int _getItemCount(FavoriteCompaniesState state) {
    if (state is FavoriteCompaniesDone) {
      return state.companies.length;
    }
    return 0;
  }
}
