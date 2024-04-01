import 'package:company_insight_app/core/styles/border_radii.dart';
import 'package:company_insight_app/core/widgets/app_shimmer.dart';
import 'package:flutter/material.dart';

class LoadingPreviewCard extends StatelessWidget {
  const LoadingPreviewCard({super.key});

  @override
  Widget build(BuildContext context) {
    return AppShimmer(
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
