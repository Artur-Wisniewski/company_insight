import 'package:flutter/material.dart';

class BorderRadii {
  static const small = 8.0;
  static const medium = 12.0;
  static const large = 18.0;

  static const BorderRadius smallAll = BorderRadius.all(Radius.circular(BorderRadii.small));

  static const BorderRadius mediumAll = BorderRadius.all(Radius.circular(BorderRadii.medium));

  static const BorderRadius largeAll = BorderRadius.all(Radius.circular(BorderRadii.large));

  static const BorderRadius largeLeft = BorderRadius.only(
    topLeft: Radius.circular(BorderRadii.large),
    bottomLeft: Radius.circular(BorderRadii.large),
  );

  static const BorderRadius largeTop = BorderRadius.only(
    topLeft: Radius.circular(BorderRadii.large),
    topRight: Radius.circular(BorderRadii.large),
  );
}
