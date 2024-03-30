import 'package:company_insight_app/core/styles/gaps.dart';
import 'package:company_insight_app/core/styles/paddings.dart';
import 'package:company_insight_app/core/widgets/app_back_button.dart';
import 'package:company_insight_app/core/widgets/app_bottom_navigation_bar/manager/bottom_navigation_bar_cubit.dart';
import 'package:company_insight_app/core/widgets/background.dart';
import 'package:company_insight_app/core/widgets/search_bar.dart';
import 'package:company_insight_app/features/home/presentation/widgets/home_subtitle.dart';
import 'package:company_insight_app/features/home/presentation/widgets/home_title.dart';
import 'package:company_insight_app/setup/router.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

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
    context.read<BottomNavigationBarCubit>().markNavigateOutsideShell(true);
    await Future.delayed(Durations.medium2);
    if (mounted) {
      await context.push(RoutesPaths.searchCompanies);
    }
    if (mounted) {
      context.read<BottomNavigationBarCubit>().markNavigateOutsideShell(false);
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
                            name: 'Artur',
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
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
