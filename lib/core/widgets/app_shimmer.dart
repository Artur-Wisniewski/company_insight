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
      child: child,
    );
  }
}
