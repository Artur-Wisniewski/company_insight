import 'package:company_insight_app/core/styles/paddings.dart';
import 'package:company_insight_app/core/widgets/backgrounds/blur_background.dart';
import 'package:company_insight_app/core/widgets/material_design_indicator.dart';
import 'package:company_insight_app/features/search_companies/domain/entities/company_overview.dart';
import 'package:company_insight_app/features/search_companies/presentation/manager/company_finacial_health/company_financial_health_cubit.dart';
import 'package:company_insight_app/features/search_companies/presentation/manager/company_profile/company_profile_cubit.dart';
import 'package:company_insight_app/setup/injectable.dart';
import 'package:company_insight_app/translations/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/overview/about_tab_view.dart';
import '../widgets/overview/financial_health_tab_view.dart';
import '../widgets/overview/overview_app_bar.dart';

class CompanyOverviewScreen extends StatefulWidget {
  const CompanyOverviewScreen({super.key, required this.companyPreview});

  final CompanyPreviewEntity companyPreview;

  @override
  State<CompanyOverviewScreen> createState() => _CompanyOverviewScreenState();
}

class _CompanyOverviewScreenState extends State<CompanyOverviewScreen> {
  @override
  void initState() {
    CompanyFinancialHealthCubit(getIt.get(), getIt.get()).getFinancialHealth(widget.companyPreview.symbol!);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CompanyFinancialHealthCubit>(
            create: (context) => CompanyFinancialHealthCubit(getIt.get(), getIt.get())
              ..getFinancialHealth(widget.companyPreview.symbol!)),
        BlocProvider<CompanyProfileCubit>(
            create: (context) => CompanyProfileCubit(getIt.get())..getCompanyProfile(widget.companyPreview.symbol!)),
      ],
      child: Scaffold(
        appBar: const OverviewAppBar(),
        extendBodyBehindAppBar: true,
        body: BackgroundBlur(
          corner: Corners.topLeft,
          child: SafeArea(
            child: DefaultTabController(
              length: 2,
              child: Column(
                children: [
                  TabBar(
                    padding: Paddings.smallAll,
                    dividerColor: Colors.transparent,
                    labelStyle: Theme.of(context).textTheme.headlineSmall!.copyWith(
                          color: Theme.of(context).colorScheme.secondary,
                          fontWeight: FontWeight.w600,
                        ),
                    labelColor: Theme.of(context).colorScheme.secondary,
                    unselectedLabelColor: Theme.of(context).unselectedWidgetColor,
                    indicatorSize: TabBarIndicatorSize.label,
                    indicator: MaterialDesignIndicator(
                      indicatorHeight: 4,
                      indicatorColor: Theme.of(context).colorScheme.secondary,
                    ),
                    tabs: [
                      Tab(text: L10n.current.about),
                      Tab(text: L10n.current.health),
                    ],
                  ),
                  const Expanded(
                    child: TabBarView(children: [
                      AboutTabView(),
                      FinancialHealthTabView(),
                    ]),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
