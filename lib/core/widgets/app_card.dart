import 'package:company_insight_app/core/styles/styles.dart';
import 'package:flutter/material.dart';

class AppCard extends StatelessWidget {
  const AppCard({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: Paddings.mediumAll,
      decoration: BoxDecoration(
        borderRadius: BorderRadii.largeAll,
        gradient: LinearGradient(
          colors: [
            const Color(0xFF2B3033).withOpacity(0.75),
            const Color(0xFF202527).withOpacity(0.75),
          ],
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: child,
    );
  }
}
