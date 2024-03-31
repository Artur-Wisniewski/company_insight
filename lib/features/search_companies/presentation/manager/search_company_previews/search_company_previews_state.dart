part of 'search_company_previews_bloc.dart';

@immutable
sealed class SearchCompanyOverviewsState extends Equatable {
  const SearchCompanyOverviewsState({this.query});
  final String? query;

  @override
  List<Object?> get props => [query];
}

@immutable
class SearchCompanyOverviewsInitial extends SearchCompanyOverviewsState {
  const SearchCompanyOverviewsInitial({super.query});
}

@immutable
class SearchCompanyOverviewsLoading extends SearchCompanyOverviewsState {
  const SearchCompanyOverviewsLoading({super.query});
}

@immutable
class SearchCompanyOverviewsEmpty extends SearchCompanyOverviewsState {
  const SearchCompanyOverviewsEmpty({super.query});
}

@immutable
class SearchCompanyOverviewsFailure extends SearchCompanyOverviewsState {
  const SearchCompanyOverviewsFailure({super.query, required this.exception});

  final Exception exception;

  @override
  List<Object?> get props => [query, exception];
}

@immutable
class SearchCompanyOverviewsDone extends SearchCompanyOverviewsState {
  const SearchCompanyOverviewsDone({
    super.query,
    required this.page,
    required this.companyOverviews,
    required this.hasReachedMax,
  });

  final List<CompanyPreviewEntity> companyOverviews;
  final int page;
  final bool hasReachedMax;

  @override
  List<Object?> get props => [page, companyOverviews, query, hasReachedMax];
}

@immutable
class SearchCompanyOverviewsLoadingMore extends SearchCompanyOverviewsDone {
  const SearchCompanyOverviewsLoadingMore({
    super.query,
    required super.page,
    required super.companyOverviews,
    required super.hasReachedMax,
  });

  factory SearchCompanyOverviewsLoadingMore.fromDone(SearchCompanyOverviewsDone done) {
    return SearchCompanyOverviewsLoadingMore(
      page: done.page,
      companyOverviews: done.companyOverviews,
      query: done.query,
      hasReachedMax: done.hasReachedMax,
    );
  }
}
