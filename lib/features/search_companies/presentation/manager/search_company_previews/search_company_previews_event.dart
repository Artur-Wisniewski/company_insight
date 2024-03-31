part of 'search_company_previews_bloc.dart';

@immutable
sealed class SearchCompanyOverviewsEvent extends Equatable {
  const SearchCompanyOverviewsEvent();

  @override
  List<Object?> get props => [];
}

@immutable
class SearchCompanyOverviews extends SearchCompanyOverviewsEvent {
  const SearchCompanyOverviews({required this.query});

  final String query;

  @override
  List<Object?> get props => [query];
}

@immutable
class SearchCompanyOverviewsLoadMore extends SearchCompanyOverviewsEvent {
  const SearchCompanyOverviewsLoadMore();
}
