import 'package:bloc_test/bloc_test.dart';
import 'package:company_insight_app/core/resources/data_source.dart';
import 'package:company_insight_app/features/company_insight/domain/entities/company_profile.dart';
import 'package:company_insight_app/features/company_insight/domain/use_cases/get_company_profile.dart';
import 'package:company_insight_app/features/company_insight/presentation/manager/company_profile/company_profile_cubit.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'company_profile_cubit_test.mocks.dart';

class GetCompanyProfileUseCaseTest extends Mock implements GetCompanyProfileUseCase {}

@GenerateMocks([GetCompanyProfileUseCaseTest])
void main() {
  group('CompanyProfileCubit', () {
    late MockGetCompanyProfileUseCaseTest getCompanyProfileUseCaseTest;
    late DioException dioException;

    setUp(() {
      getCompanyProfileUseCaseTest = MockGetCompanyProfileUseCaseTest();
      dioException = DioException(requestOptions: RequestOptions());
    });

    test('Initial state should be CompanyProfileInitial', () {
      expect(CompanyProfileCubit(getCompanyProfileUseCaseTest).state, CompanyProfileInitial());
    });

    blocTest(
      'on getFinancialHealth action should set CompanyProfileFailure on any GetIncomeStatementsUseCase failureData',
      setUp: () {
        when(getCompanyProfileUseCaseTest.call(symbol: 'AAPL')).thenAnswer((_) async => DataFailed(dioException));
      },
      build: () => CompanyProfileCubit(getCompanyProfileUseCaseTest),
      act: (cubit) => cubit.getCompanyProfile('AAPL'),
      expect: () => <CompanyProfileState>[
        CompanyProfileLoading(),
        CompanyProfileFailure(exception: dioException),
      ],
      verify: (_) {
        verify(getCompanyProfileUseCaseTest.call(symbol: 'AAPL')).called(1);
      },
    );

    blocTest(
      'on getFinancialHealth action should set CompanyProfileFailure on any GetIncomeStatementsUseCase failureData',
      setUp: () {
        when(getCompanyProfileUseCaseTest.call(symbol: 'AAPL'))
            .thenAnswer((_) async => const DataSuccess(CompanyProfileEntity(symbol: 'AAPL')));
      },
      build: () => CompanyProfileCubit(getCompanyProfileUseCaseTest),
      act: (cubit) => cubit.getCompanyProfile('AAPL'),
      expect: () => <CompanyProfileState>[
        CompanyProfileLoading(),
        const CompanyProfileDone(companyProfile: CompanyProfileEntity(symbol: 'AAPL')),
      ],
      verify: (_) {
        verify(getCompanyProfileUseCaseTest.call(symbol: 'AAPL')).called(1);
      },
    );
  });
}
