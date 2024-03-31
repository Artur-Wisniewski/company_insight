import 'package:company_insight_app/core/widgets/background.dart';
import 'package:company_insight_app/features/search_companies/presentation/manager/search_company_previews/search_company_previews_bloc.dart';
import 'package:company_insight_app/features/search_companies/presentation/widgets/nothing_found_info_block.dart';
import 'package:company_insight_app/features/search_companies/presentation/widgets/search_app_bar.dart';
import 'package:company_insight_app/features/search_companies/presentation/widgets/something_went_wrong_info_block.dart';
import 'package:company_insight_app/setup/injectable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';

import '../manager/favorite_companies/favorite_companies_cubit.dart';
import '../widgets/company_previews_list.dart';
import '../widgets/loading_previews_list.dart';

class SearchCompaniesView extends StatefulWidget {
  const SearchCompaniesView({super.key});

  @override
  State<SearchCompaniesView> createState() => _SearchCompaniesViewState();
}

class _SearchCompaniesViewState extends State<SearchCompaniesView> with TickerProviderStateMixin {
  late final AnimationController animationController = AnimationController(vsync: this);

  @override
  void initState() {
    getIt<FavoriteCompaniesCubit>().getCompanies();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: getIt<SearchCompanyOverviewsBloc>()),
        BlocProvider.value(value: getIt<FavoriteCompaniesCubit>()),
      ],
      child: KeyboardDismissOnTap(
        child: Scaffold(
          extendBodyBehindAppBar: true,
          appBar: SearchAppBar(
            onSearchChanged: (String query) {
              getIt<SearchCompanyOverviewsBloc>().add(SearchCompanyOverviews(query: query));
            },
          ),
          body: BackgroundBlur(
            corner: Corners.bottomRight,
            child: SafeArea(
              child: RefreshIndicator(
                onRefresh: () async {
                  final searchBloc = getIt<SearchCompanyOverviewsBloc>();
                  final state = searchBloc.state;
                  if (state.query?.isNotEmpty ?? false) {
                    searchBloc.add(SearchCompanyOverviews(query: state.query!));
                  }
                },
                child: BlocBuilder<SearchCompanyOverviewsBloc, SearchCompanyOverviewsState>(
                  builder: (context, state) {
                    switch (state) {
                      case SearchCompanyOverviewsInitial _:
                        return const SizedBox();
                      case SearchCompanyOverviewsLoading _:
                        return const LoadingPreviewsList();
                      case SearchCompanyOverviewsEmpty _:
                        return const NothingFoundInfo();
                      case SearchCompanyOverviewsFailure _:
                        return const SomethingWentWrongInfoBlock();
                      case SearchCompanyOverviewsDone state:
                        return CompanyPreviewsList(state: state);
                    }
                  },
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
