import 'package:company_insight_app/core/constants/assets.dart';
import 'package:company_insight_app/core/styles/border_radii.dart';
import 'package:company_insight_app/core/styles/paddings.dart';
import 'package:company_insight_app/core/widgets/app_bottom_navigation_bar/manager/bottom_navigation_bar_cubit.dart';
import 'package:company_insight_app/core/widgets/app_bottom_navigation_bar/widgets/animated_bottom_bar_icon.dart';
import 'package:company_insight_app/setup/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class AppBottomNavigationBar extends StatelessWidget {
  const AppBottomNavigationBar({super.key});

  void _onHomePressed(BuildContext context, BottomBarNavigationState state) {
    if (state.currentItem == BottomBarItems.home) return;
    context.read<BottomNavigationBarCubit>().changeItem(BottomBarItems.home);
    context.go(RoutesPaths.home);
  }

  void _onFavoriteCompaniesPressed(BuildContext context, BottomBarNavigationState state) {
    if (state.currentItem == BottomBarItems.favorites) return;
    context.read<BottomNavigationBarCubit>().changeItem(BottomBarItems.favorites);
    context.go(RoutesPaths.favoriteCompanies);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavigationBarCubit, BottomBarNavigationState>(
      builder: (context, state) {
        return SafeArea(
          child: Container(
            padding: Paddings.largeHorizontalSmallVertical,
            decoration: BoxDecoration(
              color: Theme.of(context).scaffoldBackgroundColor,
              borderRadius: BorderRadii.largeTop,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  onPressed: () => _onHomePressed(context, state),
                  padding: Paddings.mediumAll,
                  icon: AnimatedBottomBarIcon(
                    isSelected: state.currentItem == BottomBarItems.home,
                    outlineIcon: SvgAssets.homeOutline,
                    fillIcon: SvgAssets.homeFill,
                  ),
                ),
                IconButton(
                  onPressed: () => _onFavoriteCompaniesPressed(context, state),
                  padding: EdgeInsets.zero,
                  icon: Container(
                    padding: Paddings.mediumAll,
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primary,
                      shape: BoxShape.circle,
                    ),
                    child: AnimatedBottomBarIcon(
                      isSelected: state.currentItem == BottomBarItems.favorites,
                      outlineIcon: SvgAssets.bookmarkOutline,
                      fillIcon: SvgAssets.bookmarkFill,
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  padding: Paddings.mediumAll,
                  icon: AnimatedBottomBarIcon(
                    isSelected: state.currentItem == BottomBarItems.profile,
                    outlineIcon: SvgAssets.profileOutline,
                    fillIcon: SvgAssets.profileFill,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
