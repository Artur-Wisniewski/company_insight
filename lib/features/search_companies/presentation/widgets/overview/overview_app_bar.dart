import 'package:cached_network_image/cached_network_image.dart';
import 'package:company_insight_app/core/styles/box_shadows.dart';
import 'package:company_insight_app/core/styles/gaps.dart';
import 'package:company_insight_app/core/styles/styles.dart';
import 'package:company_insight_app/core/widgets/app_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/widgets/app_back_button.dart';

class OverviewAppBar extends StatelessWidget implements PreferredSizeWidget {
  const OverviewAppBar({
    super.key,
    required this.imageUrl,
    required this.name,
    required this.symbol,
  });

  final String imageUrl;
  final String name;
  final String symbol;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leadingWidth: 70,
      elevation: 0,
      titleSpacing: 0,
      toolbarHeight: 80,
      backgroundColor: Colors.transparent,
      leading: AppBackButton(
        onPressed: context.pop,
        duration: Durations.medium4,
      ),
      title: Row(
        children: [
          Container(
            width: 50,
            height: 50,
            padding: Paddings.extraSmallAll,
            decoration: BoxDecoration(
              borderRadius: BorderRadii.largeAll,
              color: Theme.of(context).colorScheme.surface,
              boxShadow: const [AppBoxShadows.primaryShadow],
            ),
            child: CachedNetworkImage(
              imageUrl: imageUrl,
              fit: BoxFit.fill,
              progressIndicatorBuilder: (context, url, downloadProgress) => AppShimmer(
                child: Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadii.largeAll,
                    color: Colors.white,
                  ),
                ),
              ),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
          ),
          Gaps.small,
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                Gaps.extraSmall,
                Text(
                  symbol,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(80);
}
