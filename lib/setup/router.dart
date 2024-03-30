import 'package:company_insight_app/core/widgets/scaffold_with_bottom_bar.dart';
import 'package:company_insight_app/features/home/presentation/pages/home_screen.dart';
import 'package:company_insight_app/features/search_companies/presentation/pages/search_companies_view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RoutesPaths {
  static const home = '/';
  static const searchCompanies = '/search-companies';
  static const favoriteCompanies = '/favorite-companies';
  static const companyDetails = '/company-details';
}

final router = GoRouter(
  initialLocation: RoutesPaths.home,
  routes: [
    ShellRoute(
      pageBuilder: (BuildContext context, GoRouterState state, Widget child) => NoTransitionPage<void>(
        key: state.pageKey,
        child: ScaffoldWithBottomBar(child: child),
      ),
      routes: [
        GoRoute(
          path: RoutesPaths.home,
          pageBuilder: (context, state) => NoTransitionPage<void>(
            key: state.pageKey,
            child: const HomeScreen(),
          ),
        ),
        GoRoute(
          path: RoutesPaths.favoriteCompanies,
          pageBuilder: (context, state) => NoTransitionPage<void>(
            key: state.pageKey,
            child: const SizedBox(),
          ),
        ),
      ],
    ),
    GoRoute(
      path: RoutesPaths.searchCompanies,
      pageBuilder: (context, state) => NoTransitionPage<void>(
        key: state.pageKey,
        child: const SearchCompaniesView(),
      ),
    ),
    GoRoute(
      path: RoutesPaths.companyDetails,
      pageBuilder: (context, state) => NoTransitionPage<void>(
        key: state.pageKey,
        child: const SizedBox(),
      ),
    ),
  ],
);
