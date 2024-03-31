import 'package:company_insight_app/core/styles/gaps.dart';
import 'package:company_insight_app/core/styles/paddings.dart';
import 'package:company_insight_app/core/widgets/app_bottom_navigation_bar/manager/bottom_navigation_bar_cubit.dart';
import 'package:company_insight_app/core/widgets/background.dart';
import 'package:company_insight_app/features/search_companies/presentation/manager/favorite_companies/favorite_companies_cubit.dart';
import 'package:company_insight_app/features/search_companies/presentation/widgets/favourite_title.dart';
import 'package:company_insight_app/features/search_companies/presentation/widgets/favourites_companies_list.dart';
import 'package:company_insight_app/setup/injectable.dart';
import 'package:company_insight_app/setup/router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class FavouritesCompaniesView extends StatefulWidget {
  const FavouritesCompaniesView({super.key});

  @override
  State<FavouritesCompaniesView> createState() => _FavouritesCompaniesViewState();
}

class _FavouritesCompaniesViewState extends State<FavouritesCompaniesView> {
  @override
  void didChangeDependencies() {
    print('didChangeDependencies');
    getIt.get<FavoriteCompaniesCubit>().getCompanies();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    // PopScope is bugged on go_router version: 13.X.X, will be fixed soon https://github.com/flutter/flutter/issues/138737
    return BackButtonListener(
      onBackButtonPressed: () async {
        getIt.get<BottomNavigationBarCubit>().changeItem(BottomBarItems.home);
        context.go(RoutesPaths.home);
        return true;
      },
      child: const BackgroundBlur(
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
      ),
    );
  }
}
