import 'package:company_insight_app/core/constants/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:company_insight_app/core/styles/styles.dart';

class AppSearchBar extends StatefulWidget {
  const AppSearchBar({super.key});

  @override
  State<AppSearchBar> createState() => _AppSearchBarState();
}

class _AppSearchBarState extends State<AppSearchBar> {
  double get containerSize => 60;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: containerSize,
      width: containerSize,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary,
        borderRadius: BorderRadii.largeLeft,
      ),
      child: Padding(
        padding: Paddings.smallAll,
        child: SvgPicture.asset(
          SvgAssets.search.path,
          semanticsLabel: SvgAssets.search.semanticsLabel,
          colorFilter: ColorFilter.mode(
            Theme.of(context).colorScheme.onSecondary,
            BlendMode.srcIn,
          ),
        ),
      ),
    );
  }
}
