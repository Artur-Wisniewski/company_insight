import 'package:company_insight_app/core/styles/border_radii.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class LoadingPreviewCard extends StatelessWidget {
  const LoadingPreviewCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: const Color(0xFF2B3033).withOpacity(0.8),
      highlightColor: const Color(0xFF202527).withOpacity(0.8),
      child: Container(
        height: 100,
        decoration: const BoxDecoration(
          borderRadius: BorderRadii.largeAll,
          color: Colors.white,
        ),
      ),
    );
  }
}
