import 'package:company_insight_app/core/constants/assets.dart';
import 'package:company_insight_app/core/styles/border_radii.dart';
import 'package:company_insight_app/core/styles/paddings.dart';
import 'package:company_insight_app/core/widgets/app_bottom_navigation_bar/manager/bottom_navigation_bar_cubit.dart';
import 'package:company_insight_app/core/widgets/app_animated_icon.dart';
import 'package:company_insight_app/setup/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class AppBottomNavigationBar extends StatefulWidget {
  const AppBottomNavigationBar({super.key});

  @override
  State<AppBottomNavigationBar> createState() => _AppBottomNavigationBarState();
}

class _AppBottomNavigationBarState extends State<AppBottomNavigationBar> with SingleTickerProviderStateMixin {
  Duration get showItemInterval => 120.ms;

  Duration get fadeInItemDuration => 650.ms;

  Duration get slideInItemDuration => 500.ms;

  Duration get exitAnimationDuration => 400.ms;

  late final AnimationController _exitAnimationController = AnimationController(vsync: this);

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
    return BlocConsumer<BottomNavigationBarCubit, BottomBarNavigationState>(
      listener: (context, state) {
        if (state.isNavigatedOutsideShell) {
          _exitAnimationController.forward();
        } else {
          _exitAnimationController.reverse();
        }
      },
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
                  icon: AppAnimatedIcon(
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
                    child: AppAnimatedIcon(
                      isSelected: state.currentItem == BottomBarItems.favorites,
                      outlineIcon: SvgAssets.bookmarkOutline,
                      fillIcon: SvgAssets.bookmarkFill,
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  padding: Paddings.mediumAll,
                  icon: AppAnimatedIcon(
                    isSelected: state.currentItem == BottomBarItems.profile,
                    outlineIcon: SvgAssets.profileOutline,
                    fillIcon: SvgAssets.profileFill,
                  ),
                ),
              ]
                  .animate(
                    interval: showItemInterval,
                  )
                  .fadeIn(
                    duration: fadeInItemDuration,
                  )
                  .slideY(
                    begin: 0.7,
                    end: 0,
                    duration: slideInItemDuration,
                  ),
            ),
          )
              .animate(
                controller: _exitAnimationController,
                autoPlay: false,
              )
              .slideY(
                begin: 0,
                end: 0.5,
                duration: exitAnimationDuration,
              )
              .fadeOut(
                duration: exitAnimationDuration,
              ),
        );
      },
    );
  }
}
