import 'package:company_insight_app/core/widgets/app_bottom_navigation_bar/widgets/app_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';

class ScaffoldWithBottomBar extends StatelessWidget {
  const ScaffoldWithBottomBar({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: child,
      extendBody: true,
      bottomNavigationBar: const AppBottomNavigationBar(),
    );
  }
}
