import 'package:company_insight_app/core/styles/gaps.dart';
import 'package:company_insight_app/core/styles/styles.dart';
import 'package:company_insight_app/features/search_companies/presentation/widgets/overview/description_section.dart';
import 'package:flutter/material.dart';

import 'about_card.dart';

class AboutTabView extends StatelessWidget {
  const AboutTabView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Padding(
        padding: Paddings.largeAll,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AboutCard(
              ceo: 'Elon Musk',
              industry: 'Automotive',
              exchange: 'NASDAQ',
              cusip: '123456789',
              marketCap: 279414414392,
            ),
            Gaps.large,
            DescriptionSection(
              description:
                  'Laopskd oaskdopas kopdask dkasopd kpasod kpoaskd poaskd asopd kasopd kasopd kasopd kopaskd poaksd opaskpdo askopdk ',
            ),
          ],
        ),
      ),
    );
  }
}
