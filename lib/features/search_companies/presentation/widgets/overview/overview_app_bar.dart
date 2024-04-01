import 'package:cached_network_image/cached_network_image.dart';
import 'package:company_insight_app/core/styles/box_shadows.dart';
import 'package:company_insight_app/core/styles/gaps.dart';
import 'package:company_insight_app/core/styles/styles.dart';
import 'package:company_insight_app/core/widgets/app_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/widgets/app_back_button.dart';
import '../../manager/company_profile/company_profile_cubit.dart';

class OverviewAppBar extends StatelessWidget implements PreferredSizeWidget {
  const OverviewAppBar({super.key});

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
      title: BlocBuilder<CompanyProfileCubit, CompanyProfileState>(
        builder: (context, state) {
          if (state is CompanyProfileDone) {
            return _buildCompanyShortProfile(context, state);
          }
          if (state is CompanyProfileLoading) {
            return _buildLoadingShortProfile(context);
          }
          return const SizedBox();
        },
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(80);

  Widget _buildCompanyShortProfile(BuildContext context, CompanyProfileDone state) {
    return Padding(
      padding: Paddings.mediumRight,
      child: Row(
        children: [
          Container(
            width: 50,
            height: 50,
            padding: Paddings.extraSmallAll,
            decoration: BoxDecoration(
              borderRadius: BorderRadii.mediumAll,
              color: Theme.of(context).colorScheme.surface,
              boxShadow: const [AppBoxShadows.primaryShadow],
            ),
            child: CachedNetworkImage(
              imageUrl: state.companyProfile.image ?? '',
              fit: BoxFit.fill,
              progressIndicatorBuilder: (context, url, downloadProgress) => AppShimmer(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadii.largeAll,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                ),
              ),
              errorWidget: (context, url, error) => const Icon(Icons.image_not_supported),
            ),
          ),
          Gaps.small,
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  state.companyProfile.companyName ?? '',
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                Gaps.extraSmall,
                Text(
                  state.companyProfile.symbol ?? '',
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

  Widget _buildLoadingShortProfile(BuildContext context) {
    return Padding(
      padding: Paddings.mediumRight,
      child: Row(
        children: [
          AppShimmer(
            child: Container(
              width: 50,
              height: 50,
              padding: Paddings.extraSmallAll,
              decoration: BoxDecoration(
                borderRadius: BorderRadii.mediumAll,
                color: Theme.of(context).colorScheme.surface,
                boxShadow: const [AppBoxShadows.primaryShadow],
              ),
            ),
          ),
          Gaps.small,
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FractionallySizedBox(
                  widthFactor: 0.8,
                  child: AppShimmer(
                    child: Container(
                      height: 24,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadii.smallAll,
                        color: Theme.of(context).colorScheme.surface,
                      ),
                    ),
                  ),
                ),
                Gaps.extraSmall,
                FractionallySizedBox(
                  widthFactor: 0.3,
                  child: AppShimmer(
                    child: Container(
                      height: 18,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadii.smallAll,
                        color: Theme.of(context).colorScheme.surface,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
