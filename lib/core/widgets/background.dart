import 'package:flutter/material.dart';

enum Corners {
  topLeft,
  topRight,
  bottomLeft,
  bottomRight,
}

class BackgroundBlur extends StatelessWidget {
  const BackgroundBlur({super.key, required this.child, this.corner = Corners.topRight});

  final Widget child;
  final Corners corner;

  double get primaryBlurRadius => 1300;

  @override
  Widget build(BuildContext context) {
    double shiftFromRight = 0;
    double shiftFromTop = 0;
    double getLeftPosition() => -primaryBlurRadius / 2 - 30 + MediaQuery.of(context).size.width;
    double getTopPosition() => -primaryBlurRadius / 2 + 30;
    double getRightPosition() => -primaryBlurRadius / 2 + 30;
    double getBottomPosition() => MediaQuery.of(context).size.height - primaryBlurRadius / 2 - 30;

    switch (corner) {
      case Corners.topLeft:
        shiftFromRight = getLeftPosition();
        shiftFromTop = getTopPosition();
        break;
      case Corners.topRight:
        shiftFromRight = getRightPosition();
        shiftFromTop = getTopPosition();
        break;
      case Corners.bottomLeft:
        shiftFromRight = getLeftPosition();
        shiftFromTop = getBottomPosition();
        break;
      case Corners.bottomRight:
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
        ),
        Container(),
        child,
      ],
    );
  }
}
