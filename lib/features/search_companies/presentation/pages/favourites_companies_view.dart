import 'package:company_insight_app/core/styles/gaps.dart';
import 'package:company_insight_app/core/styles/paddings.dart';
import 'package:company_insight_app/core/widgets/background.dart';
import 'package:company_insight_app/features/search_companies/presentation/manager/favorite_companies/favorite_companies_cubit.dart';
import 'package:company_insight_app/features/search_companies/presentation/widgets/favourite_title.dart';
import 'package:company_insight_app/features/search_companies/presentation/widgets/favourites_companies_list.dart';
import 'package:company_insight_app/setup/injectable.dart';
import 'package:flutter/material.dart';

class FavouritesCompaniesView extends StatefulWidget {
  const FavouritesCompaniesView({super.key});

  @override
  State<FavouritesCompaniesView> createState() => _FavouritesCompaniesViewState();
}

class _FavouritesCompaniesViewState extends State<FavouritesCompaniesView> {
  @override
  initState() {
    getIt.get<FavoriteCompaniesCubit>().getCompanies();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const BackgroundBlur(
      corner: Corners.topLeft,
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Gaps.extraLarge,
            Padding(
              padding: Paddings.largeHorizontal,
              child: AnimatedFavouriteTitle(
                duration: Durations.short4,
                delay: Duration.zero,
              ),
            ),
            Gaps.small,
            Expanded(child: FavouritesCompaniesList()),
          ],
        ),
      ),
    );
  }
}
