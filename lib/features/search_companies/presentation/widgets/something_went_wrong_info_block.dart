import 'package:company_insight_app/core/constants/assets.dart';
import 'package:company_insight_app/translations/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'info_block.dart';

class SomethingWentWrongInfoBlock extends StatelessWidget {
  const SomethingWentWrongInfoBlock({super.key});

  @override
  Widget build(BuildContext context) {
    return InfoBlock(
      title: L10n.current.somethingWentWrong.toUpperCase(),
      subtitle: L10n.current.tryAgain,
      icon: SvgPicture.asset(
        SvgAssets.frown.path,
        semanticsLabel: SvgAssets.frown.semanticsLabel,
        colorFilter: ColorFilter.mode(
          Theme.of(context).colorScheme.secondary,
          BlendMode.srcIn,
        ),
        width: 130,
        height: 130,
      ),
    );
  }
}
