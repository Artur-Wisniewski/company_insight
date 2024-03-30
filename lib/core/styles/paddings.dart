import 'package:flutter/material.dart';

class Paddings {
  static const double extraSmall = 8.0;
  static const double small = 12.0;
  static const double medium = 16.0;
  static const double large = 24.0;
  static const double extraLarge = 36.0;

  static const EdgeInsets smallAll = EdgeInsets.all(small);
  static const EdgeInsets extraLargeTop = EdgeInsets.only(top: extraLarge);
  static const EdgeInsets extraLargeVertical = EdgeInsets.symmetric(vertical: extraLarge);
  static const EdgeInsets largeHorizontal = EdgeInsets.symmetric(horizontal: large);
}
