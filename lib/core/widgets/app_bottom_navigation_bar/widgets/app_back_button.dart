import 'package:company_insight_app/core/constants/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppBackButton extends StatelessWidget {
  const AppBackButton({super.key, required this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: SvgPicture.asset(
        height: 40,
        width: 40,
        SvgAssets.chevronLeft.path,
        semanticsLabel: SvgAssets.chevronLeft.semanticsLabel,
        colorFilter: ColorFilter.mode(
          Theme.of(context).iconTheme.color!,
          BlendMode.srcATop,
        ),
      ),
    )
        .animate()
        .fadeIn(
          duration: Durations.short4,
        )
        .slideX(
          begin: 0.5,
          end: 0,
          duration: Durations.short4,
        );
  }
}
