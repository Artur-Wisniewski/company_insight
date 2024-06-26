import 'package:flutter/material.dart';

class Paddings {
  static const double extraSmall = 8.0;
  static const double small = 12.0;
  static const double medium = 16.0;
  static const double large = 24.0;
  static const double extraLarge = 36.0;

  static const EdgeInsets extraSmallAll = EdgeInsets.all(extraSmall);
  static const EdgeInsets smallAll = EdgeInsets.all(small);
  static const EdgeInsets mediumAll = EdgeInsets.all(medium);
  static const EdgeInsets largeAll = EdgeInsets.all(large);
  static const EdgeInsets extraLargeAll = EdgeInsets.all(extraLarge);
  static const EdgeInsets largeAllExceptTop = EdgeInsets.fromLTRB(large, 0, large, large);
  static const EdgeInsets extraLargeVertical = EdgeInsets.symmetric(vertical: extraLarge);
  static const EdgeInsets largeHorizontal = EdgeInsets.symmetric(horizontal: large);
  static const EdgeInsets largeHorizontalSmallVertical = EdgeInsets.symmetric(horizontal: large, vertical: small);
  static const EdgeInsets mediumTop = EdgeInsets.only(top: medium);
  static const EdgeInsets mediumRight = EdgeInsets.only(right: medium);
  static const EdgeInsets largeRight = EdgeInsets.only(right: large);
  static const EdgeInsets extraLargeTop = EdgeInsets.only(top: extraLarge);
  static const EdgeInsets smallLeft = EdgeInsets.only(left: small);
  static const EdgeInsets mediumBottom = EdgeInsets.only(bottom: medium);
  static const EdgeInsets mediumBottomMediumLeft = EdgeInsets.only(bottom: medium, left: medium);
}
