import 'package:company_insight_app/core/styles/paddings.dart';
import 'package:company_insight_app/core/widgets/app_back_button.dart';
import 'package:company_insight_app/core/widgets/search_bars.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SearchAppBar extends StatelessWidget implements PreferredSizeWidget {
  const SearchAppBar({super.key, required this.onSearchChanged});

  final Function(String) onSearchChanged;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      backgroundColor: Colors.transparent,
      elevation: 0,
      titleSpacing: 0,
      toolbarHeight: 116,
      leadingWidth: 70,
      leading: Padding(
        padding: Paddings.mediumTop,
        child: AppBackButton(
          onPressed: context.pop,
        ),
      ),
      title: Padding(
        padding: const EdgeInsets.only(top: 16.0, left: 6),
        child: AppSearchBar(
          isExpanded: true,
          isReadOnly: false,
          animationDelay: Duration.zero,
          animationDuration: Duration.zero,
          onSearchChanged: onSearchChanged,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(116.0);
}
