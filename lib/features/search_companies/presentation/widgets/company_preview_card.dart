import 'package:company_insight_app/core/constants/assets.dart';
import 'package:company_insight_app/core/styles/border_radii.dart';
import 'package:company_insight_app/core/styles/box_shadows.dart';
import 'package:company_insight_app/core/styles/gaps.dart';
import 'package:company_insight_app/core/styles/paddings.dart';
import 'package:company_insight_app/core/widgets/app_animated_icon.dart';
import 'package:flutter/material.dart';

class CompanyPreviewCard extends StatelessWidget {
  const CompanyPreviewCard({
    super.key,
    required this.onBookMarkButtonPressed,
    required this.name,
    required this.symbol,
    required this.isSelected,
    required this.onTap,
  });

  final VoidCallback onBookMarkButtonPressed;
  final String name;
  final String symbol;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: Paddings.mediumAll,
        decoration: BoxDecoration(
          borderRadius: BorderRadii.largeAll,
          gradient: LinearGradient(
            colors: [
              const Color(0xFF2B3033).withOpacity(0.75),
              const Color(0xFF202527).withOpacity(0.75),
            ],
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
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
            IconButton(
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
            ),
          ],
        ),
      ),
    );
  }
}
