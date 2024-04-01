import 'package:company_insight_app/core/constants/assets.dart';
import 'package:company_insight_app/core/widgets/app_animated_icon.dart';
import 'package:company_insight_app/core/widgets/snackbars.dart';
import 'package:company_insight_app/setup/injectable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entities/company_overview.dart';
import '../../manager/favorite_companies/favorite_companies_cubit.dart';

class ToggleFavouritesActionButton extends StatelessWidget {
  const ToggleFavouritesActionButton({super.key, required this.companyPreview});

  final CompanyPreviewEntity companyPreview;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoriteCompaniesCubit, FavoriteCompaniesState>(
      bloc: getIt<FavoriteCompaniesCubit>(),
      builder: (context, state) {
        return FloatingActionButton(
          onPressed: () => onBookMarkButtonPressed(state: state, context: context, companyPreview: companyPreview),
          child: AppAnimatedIcon(
            outlineIcon: SvgAssets.bookmarkOutline,
            fillIcon: SvgAssets.bookmarkFill,
            isSelected: getIsSelected(state: state, context: context, companyPreview: companyPreview),
          ),
        );
      },
    );
  }

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
      getIt<FavoriteCompaniesCubit>().toggleFavorite(companyPreview);
    }
  }
}
