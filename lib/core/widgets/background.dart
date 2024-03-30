import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

enum Corners {
  topLeft,
  topRight,
  bottomLeft,
  bottomRight,
}

class BackgroundBlur extends StatelessWidget {
  const BackgroundBlur({
    super.key,
    required this.child,
    this.corner = Corners.topRight,
    this.animationController,
    this.duration,
    this.delay,
  });

  final Widget child;
  final Corners corner;
  final AnimationController? animationController;
  final Duration? duration;
  final Duration? delay;

  double get primaryBlurRadius => 1300;

  @override
  Widget build(BuildContext context) {
    double shiftFromRight = 0;
    double shiftFromTop = 0;
    double getLeftPosition() => -primaryBlurRadius / 2 - 30 + MediaQuery.of(context).size.width;
    double getTopPosition() => -primaryBlurRadius / 2 + 30;
    double getRightPosition() => -primaryBlurRadius / 2 + 30;
    double getBottomPosition() => MediaQuery.of(context).size.height - primaryBlurRadius / 2 - 30;
    double animationStartY;

    switch (corner) {
      case Corners.topLeft:
        animationStartY = -0.3;
        shiftFromRight = getLeftPosition();
        shiftFromTop = getTopPosition();
        break;
      case Corners.topRight:
        animationStartY = -0.3;
        shiftFromRight = getRightPosition();
        shiftFromTop = getTopPosition();
        break;
      case Corners.bottomLeft:
        animationStartY = 0.3;
        shiftFromRight = getLeftPosition();
        shiftFromTop = getBottomPosition();
        break;
      case Corners.bottomRight:
        animationStartY = 0.3;
        shiftFromRight = getRightPosition();
        shiftFromTop = getBottomPosition();
        break;
    }
    return Stack(
      children: [
        Positioned(
          right: shiftFromRight,
          top: shiftFromTop,
          child: Container(
            height: primaryBlurRadius,
            width: primaryBlurRadius,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: RadialGradient(
                colors: [
                  Theme.of(context).colorScheme.primary.withOpacity(0.5),
                  Theme.of(context).colorScheme.primary.withOpacity(0.45),
                  Theme.of(context).colorScheme.primary.withOpacity(0.4),
                  Theme.of(context).colorScheme.primary.withOpacity(0.3),
                  Theme.of(context).colorScheme.primary.withOpacity(0.2),
                  Theme.of(context).colorScheme.primary.withOpacity(0.1),
                  Theme.of(context).colorScheme.primary.withOpacity(0.05),
                  Theme.of(context).colorScheme.primary.withOpacity(0.025),
                  Theme.of(context).colorScheme.primary.withOpacity(0.00125),
                  Theme.of(context).colorScheme.primary.withOpacity(0.0),
                ],
              ),
            ),
          ),
        )
            .animate(
              delay: delay,
              controller: animationController,
            )
            .fadeIn(
              duration: duration ?? Durations.short4,
            )
            .slideY(
              begin: animationStartY,
              end: 0,
              duration: duration ?? Durations.short4,
            ),
        Container(),
        child,
      ],
    );
  }
}
