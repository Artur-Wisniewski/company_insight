import 'package:company_insight_app/core/styles/gaps.dart';
import 'package:company_insight_app/core/styles/styles.dart';
import 'package:company_insight_app/features/search_companies/presentation/widgets/overview/description_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../manager/company_profile/company_profile_cubit.dart';
import 'about_card.dart';

class AboutTabView extends StatelessWidget {
  const AboutTabView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: Paddings.largeAllExceptTop,
        child: BlocBuilder<CompanyProfileCubit, CompanyProfileState>(
          builder: (context, state) {
            switch (state) {
              case CompanyProfileLoading _:
                return const Column(
                  children: [
                    AboutCard(isLoading: true),
                    Gaps.large,
                    DescriptionSection(isLoading: true),
                  ],
                );
              case CompanyProfileDone _:
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AboutCard(
                      ceo: state.companyProfile.ceo,
                      industry: state.companyProfile.industry,
                      exchange: state.companyProfile.exchange,
                      cusip: state.companyProfile.cusip,
                      marketCap: state.companyProfile.mktCap,
                    ),
                    Gaps.large,
                    DescriptionSection(
                      description: state.companyProfile.description,
                    ),
                    Gaps.extraLarge,
                  ],
                );
              case CompanyProfileFailure _:
                return const Center(child: Text('Failed to load company profile'));
              default:
                return const SizedBox();
            }
          },
        ),
      ),
    );
  }
}
