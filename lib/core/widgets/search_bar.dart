import 'package:company_insight_app/core/constants/assets.dart';
import 'package:company_insight_app/core/styles/gaps.dart';
import 'package:company_insight_app/core/styles/styles.dart';
import 'package:company_insight_app/translations/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
  });

  final bool isExpanded;
  final bool isReadOnly;
  final VoidCallback? onPressedWhenShrinked;
  final double rightShift;
  final AnimationController? animationController;
  final Duration animationDuration;
  final Duration animationDelay;

  @override
  State<AppSearchBar> createState() => _AppSearchBarState();
}

class _AppSearchBarState extends State<AppSearchBar> {
  double get containerSize => 60;
  late bool isExpanded = widget.isExpanded;

  @override
  void didUpdateWidget(covariant AppSearchBar oldWidget) {
    if (widget.isExpanded != oldWidget.isExpanded) {
      setState(() {
        isExpanded = widget.isExpanded;
      });
    }
    super.didUpdateWidget(oldWidget);
  }

  void onTap() {
    //if (!widget.isExpanded) {
    widget.onPressedWhenShrinked?.call();
    //}
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
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
    );
  }
}
