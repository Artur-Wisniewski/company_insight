import 'package:company_insight_app/core/constants/assets.dart';
import 'package:company_insight_app/core/styles/gaps.dart';
import 'package:company_insight_app/core/styles/styles.dart';
import 'package:company_insight_app/translations/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppSearchBar extends StatefulWidget {
  const AppSearchBar({super.key, this.isExpanded = false, this.onPressedWhenShrinked});

  final bool isExpanded;
  final VoidCallback? onPressedWhenShrinked;

  @override
  State<AppSearchBar> createState() => _AppSearchBarState();
}

class _AppSearchBarState extends State<AppSearchBar> {
  double get containerSize => 60;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: containerSize,
      width: !widget.isExpanded ? containerSize : null,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary,
        borderRadius: BorderRadii.largeLeft,
      ),
      child: Row(
        mainAxisAlignment: widget.isExpanded ? MainAxisAlignment.start : MainAxisAlignment.center,
        children: [
          Gaps.medium,
          Expanded(
            child: TextField(
              onTap: widget.onPressedWhenShrinked,
              readOnly: !widget.isExpanded,
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
