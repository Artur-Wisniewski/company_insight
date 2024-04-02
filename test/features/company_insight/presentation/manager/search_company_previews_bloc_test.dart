import 'package:bloc_test/bloc_test.dart';
import 'package:company_insight_app/core/resources/data_source.dart';
import 'package:company_insight_app/features/company_insight/domain/entities/company_overview.dart';
import 'package:company_insight_app/features/company_insight/domain/use_cases/search_company_previews.dart';
import 'package:company_insight_app/features/company_insight/presentation/manager/search_company_previews/search_company_previews_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'search_company_previews_bloc_test.mocks.dart';

class SearchCompanyPreviewsUseCaseTest extends Mock implements SearchCompanyPreviewsUseCase {}

@GenerateMocks([SearchCompanyPreviewsUseCaseTest])
void main() {
  group('FavoriteCompaniesCubit', () {
    late MockSearchCompanyPreviewsUseCaseTest searchCompanyPreviewsUseCase;
    const int limit = SearchCompanyOverviewsBloc.itemsPerPage;
    late CompanyPreviewEntity companyPreview;
    late Exception exception;
    setUp(() {
      searchCompanyPreviewsUseCase = MockSearchCompanyPreviewsUseCaseTest();
      companyPreview = const CompanyPreviewEntity(
        symbol: 'AAPL',
        name: 'Apple Inc.',
        currency: 'USD',
        stockExchange: 'NYPCS',
        exchangeShortName: 'NASDAQ',
      );
      exception = Exception('Error');
    });

    test('Initial state should be SearchCompanyOverviewsInitial', () {
      expect(SearchCompanyOverviewsBloc(searchCompanyPreviewsUseCase).state, const SearchCompanyOverviewsInitial());
    });

    blocTest<SearchCompanyOverviewsBloc, SearchCompanyOverviewsState>(
      'On onSearchCompanyOverviews action should set SearchCompanyOverviewsDone on any SearchCompanyPreviewsUseCase successData',
      setUp: () {
        when(searchCompanyPreviewsUseCase.call(query: 'AAPL', limit: limit))
            .thenAnswer((_) async => DataSuccess([companyPreview]));
      },
      build: () => SearchCompanyOverviewsBloc(searchCompanyPreviewsUseCase),
      act: (bloc) => bloc.add(const SearchCompanyOverviews(query: 'AAPL')),
      expect: () => <SearchCompanyOverviewsState>[
        const SearchCompanyOverviewsLoading(),
        SearchCompanyOverviewsDone(
          companyPreviews: [companyPreview],
          page: 1,
          hasReachedMax: true,
          query: 'AAPL',
        ),
      ],
      verify: (_) {
        verify(searchCompanyPreviewsUseCase.call(query: 'AAPL', limit: limit)).called(1);
      },
    );

    blocTest<SearchCompanyOverviewsBloc, SearchCompanyOverviewsState>(
      'On SearchCompanyOverviewsLoadMore action should change limit by 100',
      setUp: () {
        when(searchCompanyPreviewsUseCase.call(query: 'AAPL', limit: 2 * limit))
            .thenAnswer((_) async => DataSuccess([companyPreview, companyPreview]));
      },
      build: () => SearchCompanyOverviewsBloc(searchCompanyPreviewsUseCase),
      act: (bloc) => bloc.add(const SearchCompanyOverviewsLoadMore()),
      seed: () => SearchCompanyOverviewsDone(
        companyPreviews: [companyPreview],
        page: 1,
        hasReachedMax: false,
        query: 'AAPL',
      ),
      expect: () => <SearchCompanyOverviewsState>[
        SearchCompanyPreviewsLoadingMore(
          companyPreviews: [companyPreview],
          page: 1,
          query: 'AAPL',
          hasReachedMax: false,
        ),
        SearchCompanyOverviewsDone(
          companyPreviews: [companyPreview, companyPreview],
          page: 2,
          hasReachedMax: true,
          query: 'AAPL',
        ),
      ],
      verify: (_) {
        verify(searchCompanyPreviewsUseCase.call(query: 'AAPL', limit: 2 * limit)).called(1);
      },
    );

    blocTest<SearchCompanyOverviewsBloc, SearchCompanyOverviewsState>(
      'On onSearchCompanyOverviews action should handle failed data',
      setUp: () {
        when(searchCompanyPreviewsUseCase.call(query: 'AAPL', limit: limit))
            .thenAnswer((_) async => DataFailed(exception));
      },
      build: () => SearchCompanyOverviewsBloc(searchCompanyPreviewsUseCase),
      act: (bloc) => bloc.add(const SearchCompanyOverviews(query: 'AAPL')),
      expect: () => <SearchCompanyOverviewsState>[
        const SearchCompanyOverviewsLoading(),
        SearchCompanyOverviewsFailure(exception: exception),
      ],
      verify: (_) {
        verify(searchCompanyPreviewsUseCase.call(query: 'AAPL', limit: limit)).called(1);
      },
    );

    blocTest<SearchCompanyOverviewsBloc, SearchCompanyOverviewsState>(
      'On onSearchCompanyOverviews action should not search while state is SearchCompanyOverviewsLoading',
      seed: () => const SearchCompanyOverviewsLoading(),
      build: () => SearchCompanyOverviewsBloc(searchCompanyPreviewsUseCase),
      act: (bloc) => bloc.add(const SearchCompanyOverviews(query: 'AAPL')),
      expect: () => <SearchCompanyOverviewsState>[],
    );

    blocTest<SearchCompanyOverviewsBloc, SearchCompanyOverviewsState>(
      'On SearchCompanyOverviewsLoadMore action should not search while state is SearchCompanyPreviewsLoadingMore',
      seed: () =>
          const SearchCompanyPreviewsLoadingMore(page: 1, companyPreviews: [], query: 'AAPL', hasReachedMax: false),
      build: () => SearchCompanyOverviewsBloc(searchCompanyPreviewsUseCase),
      act: (bloc) => bloc.add(const SearchCompanyOverviewsLoadMore()),
      expect: () => <SearchCompanyOverviewsState>[],
    );

    blocTest<SearchCompanyOverviewsBloc, SearchCompanyOverviewsState>(
      'On SearchCompanyOverviews action should not return state SearchCompanyOverviewsEmpty if data is empty',
      setUp: () {
        when(searchCompanyPreviewsUseCase.call(query: 'AAPL', limit: limit))
            .thenAnswer((_) async => const DataSuccess([]));
      },
      build: () => SearchCompanyOverviewsBloc(searchCompanyPreviewsUseCase),
      act: (bloc) => bloc.add(const SearchCompanyOverviews(query: 'AAPL')),
      expect: () => <SearchCompanyOverviewsState>[
        const SearchCompanyOverviewsLoading(),
        const SearchCompanyOverviewsEmpty(),
      ],
      verify: (_) {
        verify(searchCompanyPreviewsUseCase.call(query: 'AAPL', limit: limit)).called(1);
      },
    );

    blocTest<SearchCompanyOverviewsBloc, SearchCompanyOverviewsState>(
      'On SearchCompanyOverviewsLoadMore action should not search if hasReachedMax is true',
      seed: () =>
          SearchCompanyOverviewsDone(page: 1, companyPreviews: [companyPreview], query: 'AAPL', hasReachedMax: true),
      build: () => SearchCompanyOverviewsBloc(searchCompanyPreviewsUseCase),
      act: (bloc) => bloc.add(const SearchCompanyOverviewsLoadMore()),
      expect: () => <SearchCompanyOverviewsState>[],
      verify: (_) {
        verifyNever(searchCompanyPreviewsUseCase.call(query: 'AAPL', limit: 2 * limit));
      },
    );
  });
}
