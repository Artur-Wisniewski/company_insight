import 'package:company_insight_app/core/styles/paddings.dart';
import 'package:company_insight_app/translations/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class HomeSubtitle extends StatelessWidget {
  const HomeSubtitle({
    super.key,
    required this.name,
    required this.animationController,
    required this.delay,
    required this.duration,
  });

  final String name;
  final AnimationController animationController;
  final Duration delay;
  final Duration duration;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Paddings.largeHorizontal,
      child: Text(
        L10n.current.helloUser(name),
        style: Theme.of(context).textTheme.displaySmall,
      ),
    )
        .animate(
          controller: animationController,
          autoPlay: false,
        )
        .fadeIn(
          duration: duration,
        )
        .slideY(
          begin: -0.5,
          end: 0,
          duration: duration,
        );
  }
}
