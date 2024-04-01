import 'package:company_insight_app/core/styles/gaps.dart';
import 'package:company_insight_app/core/styles/paddings.dart';
import 'package:company_insight_app/core/widgets/app_back_button.dart';
import 'package:company_insight_app/core/widgets/app_bottom_navigation_bar/manager/bottom_navigation_bar_cubit.dart';
import 'package:company_insight_app/core/widgets/backgrounds/blur_background.dart';
import 'package:company_insight_app/core/widgets/search_bars.dart';
import 'package:company_insight_app/setup/injectable.dart';
import 'package:company_insight_app/setup/router.dart';
import 'package:company_insight_app/translations/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

import '../widgets/home/home_subtitle.dart';
import '../widgets/home/home_title.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late final AnimationController _animationController = AnimationController(vsync: this);

  final ValueNotifier<bool> isExpanded = ValueNotifier(false);

  Future<void> _onSearchPressed() async {
    isExpanded.value = true;
    _animationController.reverse();
    getIt.get<BottomNavigationBarCubit>().markNavigateOutsideShell(true);
    await Future.delayed(Durations.medium2);
    if (mounted) {
      await context.push(RoutesPaths.searchCompanies);
    }
    if (mounted) {
      getIt.get<BottomNavigationBarCubit>().markNavigateOutsideShell(false);
    }
    isExpanded.value = false;
    _animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundBlur(
        animationController: _animationController,
        child: SafeArea(
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: Paddings.extraLargeTop,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Flexible(
                          child: HomeSubtitle(
                            name: L10n.current.there,
                            animationController: _animationController,
                            duration: Durations.short4,
                            delay: Duration.zero,
                          ),
                        ),
                        Gaps.large,
                        const Gap(60),
                      ],
                    ),
                  ),
                  Gaps.medium,
                  HomeTitle(
                    animationController: _animationController,
                    duration: Durations.short4,
                    delay: Durations.short2,
                  ),
                ],
              ),
              Positioned(
                top: Paddings.extraLarge,
                right: 0,
                child: AnimatedBuilder(
                  animation: isExpanded,
                  builder: (context, _) {
                    return AppSearchBar(
                      onPressedWhenShrinked: _onSearchPressed,
                      isExpanded: isExpanded.value,
                      rightShift: AppBackButton.size + AppBackButton.padding.horizontal + Paddings.smallLeft.horizontal,
                    ).animate().fadeIn(duration: Durations.short4).slideX(begin: 1, end: 0, duration: Durations.short4);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    isExpanded.dispose();
    super.dispose();
  }
}
