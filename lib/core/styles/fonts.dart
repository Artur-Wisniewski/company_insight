import 'package:company_insight_app/core/styles/colors.dart';
import 'package:flutter/material.dart';

class AppFontFamilies {
  static const String novatica = 'Novatica';
  static const String euclidCircularB = 'Euclid Circular B';
}

class AppFonts {
  FontWeight get light => FontWeight.w300;

  FontWeight get regular => FontWeight.w400;

  FontWeight get medium => FontWeight.w500;

  FontWeight get bold => FontWeight.w700;

  TextStyle get h1 => TextStyle(
        color: ColorPalette.white,
        fontFamily: AppFontFamilies.novatica,
        fontSize: 96.0,
        fontWeight: light,
      );

  TextStyle get h2 => TextStyle(
        color: ColorPalette.white,
        fontFamily: AppFontFamilies.novatica,
        fontSize: 60.0,
        fontWeight: light,
      );

  TextStyle get h3 => TextStyle(
        color: ColorPalette.white,
        fontFamily: AppFontFamilies.novatica,
        fontSize: 48.0,
        fontWeight: medium,
      );

  TextStyle get h4 => TextStyle(
        color: ColorPalette.white,
        fontFamily: AppFontFamilies.novatica,
        fontSize: 34.0,
        fontWeight: regular,
      );

  TextStyle get h5 => TextStyle(
        color: ColorPalette.white,
        fontFamily: AppFontFamilies.novatica,
        fontSize: 24.0,
        fontWeight: regular,
      );

  TextStyle get h6 => TextStyle(
        color: ColorPalette.white,
        fontFamily: AppFontFamilies.novatica,
        fontSize: 20.0,
        fontWeight: medium,
      );

  TextStyle get subtitle1 => TextStyle(
        color: ColorPalette.white,
        fontFamily: AppFontFamilies.euclidCircularB,
        fontSize: 16.0,
        fontWeight: regular,
      );

  TextStyle get subtitle2 => TextStyle(
        color: ColorPalette.white,
        fontFamily: AppFontFamilies.euclidCircularB,
        fontSize: 14.0,
        fontWeight: medium,
      );

  TextStyle get body1 => TextStyle(
        color: ColorPalette.white,
        fontFamily: AppFontFamilies.euclidCircularB,
        fontSize: 16.0,
        fontWeight: regular,
      );

  TextStyle get body2 => TextStyle(
        color: ColorPalette.white,
        fontFamily: AppFontFamilies.novatica,
        fontSize: 14.0,
        fontWeight: regular,
      );

  TextStyle get button => TextStyle(
        color: ColorPalette.white,
        fontFamily: AppFontFamilies.euclidCircularB,
        fontSize: 14.0,
        fontWeight: medium,
      );

  TextStyle get caption => TextStyle(
        color: ColorPalette.white,
        fontFamily: AppFontFamilies.novatica,
        fontSize: 12.0,
        fontWeight: regular,
      );

  TextStyle get overline => TextStyle(
        color: ColorPalette.white,
        fontFamily: AppFontFamilies.euclidCircularB,
        fontSize: 10.0,
        fontWeight: regular,
      );
}
