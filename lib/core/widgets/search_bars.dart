import 'package:company_insight_app/core/constants/assets.dart';
import 'package:company_insight_app/core/services/shared_preferences.dart';
import 'package:company_insight_app/core/styles/gaps.dart';
import 'package:company_insight_app/core/styles/styles.dart';
import 'package:company_insight_app/core/widgets/modals/modals.dart';
import 'package:company_insight_app/setup/injectable.dart';
import 'package:company_insight_app/translations/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:showcaseview/showcaseview.dart';

class AppSearchBar extends StatefulWidget {
  const AppSearchBar({
    super.key,
    this.isExpanded = false,
    this.onPressedWhenShrinked,
    this.isReadOnly = true,
    this.rightShift = 0,
    this.animationController,
    this.animationDuration = Durations.short4,
    this.animationDelay = Durations.short4,
    this.onSearchChanged,
  });

  final bool isExpanded;
  final bool isReadOnly;
  final VoidCallback? onPressedWhenShrinked;
  final double rightShift;
  final AnimationController? animationController;
  final Duration animationDuration;
  final Duration animationDelay;
  final Function(String)? onSearchChanged;

  @override
  State<AppSearchBar> createState() => _AppSearchBarState();
}

class _AppSearchBarState extends State<AppSearchBar> {
  double get containerSize => 60;
  late bool isExpanded = widget.isExpanded;
  final GlobalKey _key = GlobalKey();

  @override
  void didUpdateWidget(covariant AppSearchBar oldWidget) {
    if (widget.isExpanded != oldWidget.isExpanded) {
      setState(() {
        isExpanded = widget.isExpanded;
      });
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback((_) => _onPostFrameCallback());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Showcase(
      key: _key,
      description: L10n.current.tapOnSearchHint,
      child: GestureDetector(
        onTap: onTap,
        child: AnimatedContainer(
          height: containerSize,
          width: !isExpanded ? containerSize : MediaQuery.of(context).size.width - widget.rightShift,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.secondary,
            borderRadius: BorderRadii.largeLeft,
          ),
          duration: const Duration(milliseconds: 200),
          child: Row(
            mainAxisAlignment: isExpanded ? MainAxisAlignment.start : MainAxisAlignment.center,
            children: [
              Gaps.medium,
              Expanded(
                child: TextField(
                  onChanged: widget.onSearchChanged,
                  autofocus: true,
                  onTap: onTap,
                  readOnly: widget.isReadOnly,
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: Theme.of(context).colorScheme.onSecondary,
                      ),
                  decoration: InputDecoration(
                    prefixIconConstraints: const BoxConstraints(minWidth: 35),
                    prefixIcon: SvgPicture.asset(
                      alignment: Alignment.topLeft,
                      width: 25,
                      height: 25,
                      SvgAssets.search.path,
                      semanticsLabel: SvgAssets.search.semanticsLabel,
                      colorFilter: ColorFilter.mode(
                        Theme.of(context).colorScheme.onSecondary,
                        BlendMode.srcIn,
                      ),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent),
                    ),
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent),
                    ),
                    hintStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: Theme.of(context).unselectedWidgetColor,
                        ),
                    hintText: L10n.current.typeHint,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void onTap() {
    widget.onPressedWhenShrinked?.call();
  }

  void _onPostFrameCallback() {
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) async {
      if (isExpanded) return;
      final bool isFirstAppVisit = await getIt.get<AppSharedPreferences>().getIsFirstEnter();
      if (!isFirstAppVisit) {
        _onFirstAppVisit();
      }
      getIt.get<AppSharedPreferences>().setIsFirstEnter(true);
    });
  }

  Future<void> _onFirstAppVisit() async {
    await Future.delayed(Durations.medium4);
    if (mounted) {
      final bool? startTutorial = await Modals.showInitialModal(context);
      if (startTutorial ?? false) {
        if (mounted) {
          final bool hasSeenSearchingHint = await getIt.get<AppSharedPreferences>().getHasSkippedOnboarding();
          if (!hasSeenSearchingHint) {
            _showTutorial();
          }
        }
      } else {
        getIt.get<AppSharedPreferences>().setHasSkippedOnboarding(true);
      }
    }
  }

  Future<void> _showTutorial() async {
    ShowCaseWidget.of(context).startShowCase([_key]);
    await getIt.get<AppSharedPreferences>().setHasSeenSearchingHint(true);
  }
}
