import 'package:company_insight_app/core/styles/border_radii.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class AppShimmer extends StatelessWidget {
  const AppShimmer({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: const Color(0xFF2B3033).withOpacity(0.8),
      highlightColor: const Color(0xFF202527).withOpacity(0.8),
      child: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadii.mediumAll,
          color: Colors.white,
        ),
        child: child,
      ),
    );
  }
}
