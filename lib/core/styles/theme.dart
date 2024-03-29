import 'package:company_insight_app/core/styles/colors.dart';
import 'package:company_insight_app/core/styles/fonts.dart';
import 'package:flutter/material.dart';

ThemeData get darkTheme {
  final fonts = AppFonts();
  return ThemeData.dark().copyWith(
    colorScheme: const ColorScheme.dark(
      primary: ColorPalette.violet,
      secondary: ColorPalette.white,
      surface: ColorPalette.darkGreyBlue,
      background: ColorPalette.darkGrey2,
      error: ColorPalette.red,
      onPrimary: ColorPalette.white,
      onSecondary: ColorPalette.black,
      onSurface: ColorPalette.white,
      onBackground: ColorPalette.white,
      onError: ColorPalette.white,
    ),
    primaryColor: ColorPalette.violet,
    scaffoldBackgroundColor: ColorPalette.darkGrey2,
    brightness: Brightness.dark,
    cardColor: ColorPalette.darkGrey,
    dialogBackgroundColor: ColorPalette.violet,
    unselectedWidgetColor: ColorPalette.grey,
    textTheme: const TextTheme().copyWith(
      displayLarge: fonts.h1,
      displayMedium: fonts.h2,
      displaySmall: fonts.h3,
      headlineMedium: fonts.h4,
      headlineSmall: fonts.h5,
      titleLarge: fonts.h6,
      titleMedium: fonts.subtitle1,
      titleSmall: fonts.subtitle2,
      bodyLarge: fonts.body1,
      bodyMedium: fonts.body2,
      labelLarge: fonts.button,
      labelMedium: fonts.caption,
      labelSmall: fonts.overline,
    ),
  );
}
