import 'package:company_insight_app/core/constants/assets.dart';
import 'package:company_insight_app/core/styles/box_shadows.dart';
import 'package:company_insight_app/core/styles/gaps.dart';
import 'package:company_insight_app/core/styles/paddings.dart';
import 'package:company_insight_app/core/widgets/app_animated_icon.dart';
import 'package:company_insight_app/core/widgets/app_card.dart';
import 'package:company_insight_app/translations/l10n.dart';
import 'package:flutter/material.dart';
import 'package:showcaseview/showcaseview.dart';

class CompanyPreviewCard extends StatelessWidget {
  const CompanyPreviewCard({
    super.key,
    required this.onBookMarkButtonPressed,
    required this.name,
    required this.symbol,
    required this.isSelected,
    required this.onTap,
    this.globalKey,
  });

  final GlobalKey? globalKey;
  final VoidCallback onBookMarkButtonPressed;
  final String name;
  final String symbol;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AppCard(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(name, style: Theme.of(context).textTheme.titleLarge),
                  Gaps.small,
                  Text(symbol,
                      style: Theme.of(context)
                          .textTheme
                          .titleSmall!
                          .copyWith(color: Theme.of(context).unselectedWidgetColor)),
                ],
              ),
            ),
            Gaps.medium,
            Builder(builder: (context) {
              final iconButton = IconButton(
                padding: EdgeInsets.zero,
                onPressed: onBookMarkButtonPressed,
                icon: Container(
                  padding: Paddings.smallAll,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Theme.of(context).colorScheme.surface,
                    boxShadow: const [AppBoxShadows.primaryShadow],
                  ),
                  child: AppAnimatedIcon(
                    outlineIcon: SvgAssets.bookmarkOutline,
                    fillIcon: SvgAssets.bookmarkFill,
                    isSelected: isSelected,
                  ),
                ),
              );
              if (globalKey != null) {
                return Showcase(
                  key: globalKey!,
                  description: L10n.current.tapOnSaveHint,
                  child: iconButton,
                );
              }
              return iconButton;
            }),
          ],
        ),
      ),
    );
  }
}
