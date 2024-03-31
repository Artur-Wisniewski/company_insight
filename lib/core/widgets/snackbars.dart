import 'package:another_flushbar/flushbar.dart';
import 'package:company_insight_app/core/styles/styles.dart';
import 'package:company_insight_app/translations/l10n.dart';
import 'package:flutter/material.dart';

Flushbar getSaveToFavoritesSnackbar(BuildContext context) => Flushbar(
      margin: Paddings.mediumAll,
      padding: Paddings.mediumAll,
      borderRadius: BorderRadii.mediumAll,
      icon: Icon(
        Icons.check_rounded,
        size: 28.0,
        color: Theme.of(context).colorScheme.secondary,
      ),
      messageText: Text(
        L10n.current.savedToFavorites,
        style: Theme.of(context).textTheme.bodyMedium,
      ),
      duration: const Duration(seconds: 3),
      backgroundGradient: const LinearGradient(colors: [
        ColorPalette.violet,
        ColorPalette.darkViolet2,
      ]), //here's the gradient support
    );

Flushbar getRemoveFromFavoritesSnackbar(BuildContext context) => Flushbar(
  margin: Paddings.mediumAll,
  padding: Paddings.mediumAll,
  borderRadius: BorderRadii.mediumAll,
  icon: Icon(
    Icons.close_rounded,
    size: 28.0,
    color: Theme.of(context).colorScheme.secondary,
  ),
  messageText: Text(
    L10n.current.removeFromFavorites,
    style: Theme.of(context).textTheme.bodyMedium,
  ),
  duration: const Duration(seconds: 3),
  backgroundGradient: const LinearGradient(colors: [
    ColorPalette.violet,
    ColorPalette.darkViolet2,
  ]), //here's the gradient support
);