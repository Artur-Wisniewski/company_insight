import 'package:bloc_test/bloc_test.dart';
import 'package:company_insight_app/core/resources/data_source.dart';
import 'package:company_insight_app/features/company_insight/domain/entities/company_overview.dart';
import 'package:company_insight_app/features/company_insight/domain/use_cases/get_saved_company_previews.dart';
import 'package:company_insight_app/features/company_insight/domain/use_cases/remove_company_previews_from_saved.dart';
import 'package:company_insight_app/features/company_insight/domain/use_cases/save_company_previews.dart';
import 'package:company_insight_app/features/company_insight/presentation/manager/favorite_companies/favorite_companies_cubit.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'favorite_companies_cubit_test.mocks.dart';

class GetSavedCompanyPreviewsUseCaseTest extends Mock implements GetSavedCompanyPreviewsUseCase {}

class RemoveCompanyOverviewFromSavedUseCaseTest extends Mock implements RemoveCompanyOverviewFromSavedUseCase {}

class SaveCompanyPreviewUseCaseTest extends Mock implements SaveCompanyPreviewUseCase {}

@GenerateMocks(
    [GetSavedCompanyPreviewsUseCaseTest, RemoveCompanyOverviewFromSavedUseCaseTest, SaveCompanyPreviewUseCaseTest])
void main() {
  group('FavoriteCompaniesCubit', () {
    late MockGetSavedCompanyPreviewsUseCaseTest getSavedCompanyPreviewsUseCaseTest;
    late MockRemoveCompanyOverviewFromSavedUseCaseTest removeCompanyOverviewFromSavedUseCaseTest;
    late MockSaveCompanyPreviewUseCaseTest saveCompanyPreviewUseCaseTest;
    late CompanyPreviewEntity companyPreview;

    setUp(() {
      getSavedCompanyPreviewsUseCaseTest = MockGetSavedCompanyPreviewsUseCaseTest();
      removeCompanyOverviewFromSavedUseCaseTest = MockRemoveCompanyOverviewFromSavedUseCaseTest();
      saveCompanyPreviewUseCaseTest = MockSaveCompanyPreviewUseCaseTest();
      companyPreview = const CompanyPreviewEntity(
        symbol: 'AAPL',
        name: 'Apple Inc.',
        currency: 'USD',
        stockExchange: 'NYPCS',
        exchangeShortName: 'NASDAQ',
      );
    });

    test('Initial state should be FavoriteCompaniesInitial', () {
      expect(
          FavoriteCompaniesCubit(getSavedCompanyPreviewsUseCaseTest, removeCompanyOverviewFromSavedUseCaseTest,
                  saveCompanyPreviewUseCaseTest)
              .state,
          const FavoriteCompaniesInitial());
    });

    blocTest(
      'On getCompanies action should set FavoriteCompaniesDone on any GetSavedCompanyPreviewsUseCase successData',
      setUp: () {
        when(getSavedCompanyPreviewsUseCaseTest.call()).thenAnswer((_) async => DataSuccess([companyPreview]));
      },
      build: () => FavoriteCompaniesCubit(
          getSavedCompanyPreviewsUseCaseTest, removeCompanyOverviewFromSavedUseCaseTest, saveCompanyPreviewUseCaseTest),
      act: (cubit) => cubit.getCompanies(),
      expect: () => <FavoriteCompaniesState>[
        const FavoriteCompaniesLoading(),
        FavoriteCompaniesDone(companies: [companyPreview]),
      ],
      verify: (_) {
        verify(getSavedCompanyPreviewsUseCaseTest.call()).called(1);
      },
    );

    blocTest<FavoriteCompaniesCubit, FavoriteCompaniesState>(
      'On toggleFavorite state should be FavoriteCompaniesDone',
      build: () => FavoriteCompaniesCubit(
          getSavedCompanyPreviewsUseCaseTest, removeCompanyOverviewFromSavedUseCaseTest, saveCompanyPreviewUseCaseTest),
      act: (cubit) => cubit.toggleFavorite(companyPreview),
      expect: () => <FavoriteCompaniesState>[],
      seed: () => const FavoriteCompaniesLoading(),
      verify: (_) {
        verifyNever(getSavedCompanyPreviewsUseCaseTest.call());
        verifyNever(removeCompanyOverviewFromSavedUseCaseTest.call(companyOverview: anyNamed('companyOverview')));
        verifyNever(saveCompanyPreviewUseCaseTest.call(companyOverview: anyNamed('companyOverview')));
      },
    );

    blocTest<FavoriteCompaniesCubit, FavoriteCompaniesState>(
      'On toggleFavorite save should be called',
      setUp: () {
        when(getSavedCompanyPreviewsUseCaseTest.call()).thenAnswer((_) async => DataSuccess([companyPreview]));
      },
      build: () => FavoriteCompaniesCubit(
          getSavedCompanyPreviewsUseCaseTest, removeCompanyOverviewFromSavedUseCaseTest, saveCompanyPreviewUseCaseTest),
      act: (cubit) => cubit.toggleFavorite(companyPreview),
      expect: () => <FavoriteCompaniesState>[
        const FavoriteCompaniesLoading(),
        FavoriteCompaniesDone(companies: [companyPreview]),
      ],
      seed: () => const FavoriteCompaniesDone(companies: []),
      verify: (_) {
        verify(getSavedCompanyPreviewsUseCaseTest.call()).called(1);
        verifyNever(removeCompanyOverviewFromSavedUseCaseTest.call(companyOverview: anyNamed('companyOverview')));
        verify(saveCompanyPreviewUseCaseTest.call(companyOverview: anyNamed('companyOverview'))).called(1);
      },
    );

    blocTest<FavoriteCompaniesCubit, FavoriteCompaniesState>(
      'On toggleFavorite remove should be called',
      setUp: () {
        when(getSavedCompanyPreviewsUseCaseTest.call()).thenAnswer((_) async => const DataSuccess([]));
        when(removeCompanyOverviewFromSavedUseCaseTest.call(companyOverview: companyPreview));
      },
      build: () => FavoriteCompaniesCubit(
          getSavedCompanyPreviewsUseCaseTest, removeCompanyOverviewFromSavedUseCaseTest, saveCompanyPreviewUseCaseTest),
      act: (cubit) => cubit.toggleFavorite(companyPreview),
      expect: () => <FavoriteCompaniesState>[
        const FavoriteCompaniesLoading(),
        const FavoriteCompaniesDone(companies: []),
      ],
      seed: () => FavoriteCompaniesDone(companies: [companyPreview]),
      verify: (_) {
        verify(getSavedCompanyPreviewsUseCaseTest.call()).called(1);
        verify(removeCompanyOverviewFromSavedUseCaseTest.call(companyOverview: anyNamed('companyOverview')))
            .called(1);
        verifyNever(saveCompanyPreviewUseCaseTest.call(companyOverview: anyNamed('companyOverview')));
      },
    );
  });
}
