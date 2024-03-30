import 'package:company_insight_app/core/widgets/app_bottom_navigation_bar/widgets/app_bottom_navigation_bar.dart';
import 'package:company_insight_app/features/home/presentation/pages/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RoutesPaths {
  static const home = '/';
  static const search = '/search';
  static const favoriteCompanies = '/favoriteCompanies';
  static const companyDetails = '/companyDetails';
}

final router = GoRouter(routes: [
  ShellRoute(
    pageBuilder: (BuildContext context, GoRouterState state, Widget child) => NoTransitionPage<void>(
      key: state.pageKey,
      child: Scaffold(
        body: child,
        extendBody: true,
        bottomNavigationBar: const AppBottomNavigationBar(),
      ),
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
    path: RoutesPaths.search,
    pageBuilder: (context, state) => NoTransitionPage<void>(
      key: state.pageKey,
      child: const SizedBox(),
    ),
  ),
  GoRoute(
    path: RoutesPaths.companyDetails,
    pageBuilder: (context, state) => NoTransitionPage<void>(
      key: state.pageKey,
      child: const SizedBox(),
    ),
  ),
]);
