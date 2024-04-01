import 'package:company_insight_app/core/styles/paddings.dart';
import 'package:company_insight_app/core/widgets/modals/modals.dart';
import 'package:company_insight_app/features/search_companies/presentation/widgets/something_went_wrong_info_block.dart';
import 'package:company_insight_app/translations/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../manager/company_finacial_health/company_financial_health_cubit.dart';
import 'financial_health_section.dart';

class FinancialHealthTabView extends StatelessWidget {
  const FinancialHealthTabView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: BlocBuilder<CompanyFinancialHealthCubit, CompanyFinancialHealthState>(builder: (context, state) {
        switch (state) {
          case CompanyFinancialHealthLoading _:
            return const CircularProgressIndicator();
          case CompanyFinancialHealthDone stateDone:
            return Padding(
              padding: Paddings.largeAllExceptTop,
              child: Column(
                children: [
                  FinancialHealthSection(
                    title: L10n.current.netIncomeMargin,
                    valuesOverTime: stateDone.netIncomeMarginsOverTime,
                    onInfoPressed: () => Modals.showNetIncomeMarginInfo(context),
                  ),
                  FinancialHealthSection(
                    title: L10n.current.currentRatio,
                    valuesOverTime: stateDone.currentRatiosOverTime,
                    onInfoPressed: () => Modals.showCurrentRatioInfo(context),
                  ),
                  FinancialHealthSection(
                    title: L10n.current.debtToEquityRatio,
                    valuesOverTime: stateDone.debtToEquityRatiosOverTime,
                    onInfoPressed: () => Modals.showDebtToEquityRatio(context),
                  ),
                ],
              ),
            );
          case CompanyFinancialHealthFailure _:
            return const SomethingWentWrongInfoBlock();
          default:
            return const SizedBox();
        }
      }),
    );
  }
}
