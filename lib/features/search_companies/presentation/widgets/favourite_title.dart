import 'package:company_insight_app/translations/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class AnimatedFavouriteTitle extends StatelessWidget {
  const AnimatedFavouriteTitle({super.key, required this.duration, required this.delay});

  final Duration duration;
  final Duration delay;

  @override
  Widget build(BuildContext context) {
    return Text(
      L10n.current.favorites,
      style: Theme.of(context).textTheme.displaySmall,
    ).animate(delay: delay).fadeIn(duration: duration).slideY(
          duration: duration,
          begin: -1.0,
          end: 0.0,
        );
  }
}
