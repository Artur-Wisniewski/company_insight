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
    required this.companyPreviews,
    required this.hasReachedMax,
  });

  final List<CompanyPreviewEntity> companyPreviews;
  final int page;
  final bool hasReachedMax;

  @override
  List<Object?> get props => [page, companyPreviews, query, hasReachedMax];
}

@immutable
class SearchCompanyPreviewsLoadingMore extends SearchCompanyOverviewsDone {
  const SearchCompanyPreviewsLoadingMore({
    super.query,
    required super.page,
    required super.companyPreviews,
    required super.hasReachedMax,
  });

  factory SearchCompanyPreviewsLoadingMore.fromDone(SearchCompanyOverviewsDone done) {
    return SearchCompanyPreviewsLoadingMore(
      page: done.page,
      companyPreviews: done.companyPreviews,
      query: done.query,
      hasReachedMax: done.hasReachedMax,
    );
  }
}
