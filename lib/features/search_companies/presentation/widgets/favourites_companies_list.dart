import 'package:company_insight_app/core/styles/gaps.dart';
import 'package:company_insight_app/core/styles/styles.dart';
import 'package:company_insight_app/core/widgets/snackbars.dart';
import 'package:company_insight_app/features/search_companies/domain/entities/company_overview.dart';
import 'package:company_insight_app/features/search_companies/presentation/manager/favorite_companies/favorite_companies_cubit.dart';
import 'package:company_insight_app/features/search_companies/presentation/widgets/company_preview_card.dart';
import 'package:company_insight_app/setup/injectable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavouritesCompaniesList extends StatelessWidget {
  const FavouritesCompaniesList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoriteCompaniesCubit, FavoriteCompaniesState>(
      bloc: getIt.get(),
      builder: (context, state) {
        return ListView.separated(
          padding: Paddings.largeAllExceptTop,
          itemBuilder: (context, index) {
            if (state is FavoriteCompaniesDone) {
              final company = state.companies[index];
              return CompanyPreviewCard(
                onBookMarkButtonPressed: () => onBookMarkButtonPressed(context, company),
                name: company.name ?? '',
                symbol: company.symbol ?? '',
                isSelected: true,
              );
            }
            return const SizedBox();
          },
          separatorBuilder: (context, index) => Gaps.medium,
          itemCount: getItemCount(state),
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

  void onBookMarkButtonPressed(BuildContext context, CompanyPreviewEntity companyPreview) {
    getIt.get<FavoriteCompaniesCubit>().toggleFavorite(companyPreview);
    getRemoveFromFavoritesSnackbar(context).show(context);
  }

  int getItemCount(FavoriteCompaniesState state) {
    if (state is FavoriteCompaniesDone) {
      return state.companies.length;
    }
    return 0;
  }
}
