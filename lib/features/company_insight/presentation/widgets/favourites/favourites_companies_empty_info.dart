import 'package:company_insight_app/core/constants/assets.dart';
import 'package:company_insight_app/translations/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../info_block.dart';

class FavouritesCompaniesEmptyInfo extends StatelessWidget {
  const FavouritesCompaniesEmptyInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return InfoBlock(
      title: L10n.current.yourListIsEmpty.toUpperCase(),
      subtitle: L10n.current.youCanFindCompaniesInHomeScreen,
      icon: SvgPicture.asset(
        SvgAssets.emptyBox.path,
        semanticsLabel: SvgAssets.frown.semanticsLabel,
        width: 150,
        height: 150,
      ),
    );
  }
}
