import 'package:company_insight_app/core/constants/assets.dart';
import 'package:company_insight_app/core/styles/paddings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppBackButton extends StatelessWidget {
  const AppBackButton({super.key, required this.onPressed, this.duration = Durations.short4});

  final VoidCallback onPressed;
  final Duration duration;

  static const double size = 40;
  static const EdgeInsets padding = Paddings.smallAll;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      padding: padding,
      icon: SvgPicture.asset(
        height: size,
        width: size,
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
          duration: duration,
        )
        .slideX(
          begin: 0.5,
          end: 0,
          duration: duration,
        );
  }
}
