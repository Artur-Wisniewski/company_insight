import 'package:company_insight_app/core/styles/paddings.dart';
import 'package:company_insight_app/translations/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class HomeTitle extends StatelessWidget {
  const HomeTitle({
    super.key,
    required this.animationController,
    required this.delay,
    required this.duration,
  });

  final AnimationController animationController;
  final Duration delay;
  final Duration duration;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Paddings.largeHorizontal,
      child: Text(
        L10n.current.findCompanyYouAreInterested,
        style: Theme.of(context).textTheme.titleMedium,
      )
          .animate(
            controller: animationController,
            delay: Durations.short2,
          )
          .fadeIn(
            duration: Durations.short4,
          )
          .slideY(
            begin: -1.5,
            end: 0,
            duration: Durations.short4,
          ),
    );
  }
}
