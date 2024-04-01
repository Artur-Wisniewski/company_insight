import 'package:company_insight_app/core/constants/assets.dart';
import 'package:company_insight_app/translations/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../info_block.dart';

class NothingFoundInfo extends StatelessWidget {
  const NothingFoundInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return InfoBlock(
      title: L10n.current.nothingFound.toUpperCase(),
      subtitle: L10n.current.trySomethingElse,
      icon: SvgPicture.asset(
        SvgAssets.emptyBox.path,
        semanticsLabel: SvgAssets.emptyBox.semanticsLabel,
        width: 150,
        height: 150,
      ),
    );
  }
}
