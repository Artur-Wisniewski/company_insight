import 'package:bloc_test/bloc_test.dart';
import 'package:company_insight_app/core/resources/data_source.dart';
import 'package:company_insight_app/features/company_insight/domain/entities/balance_sheet_statement.dart';
import 'package:company_insight_app/features/company_insight/domain/entities/income_statement.dart';
import 'package:company_insight_app/features/company_insight/domain/use_cases/get_balance_sheet_statements.dart';
import 'package:company_insight_app/features/company_insight/domain/use_cases/get_income_statements.dart';
import 'package:company_insight_app/features/company_insight/presentation/manager/company_finacial_health/company_financial_health_cubit.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'company_financial_health_cubit_test.mocks.dart';

class GetIncomeStatementsUseCaseTest extends Mock implements GetIncomeStatementsUseCase {}

class GetBalanceSheetStatementsUseCaseTest extends Mock implements GetBalanceSheetStatementsUseCase {}

@GenerateMocks([GetIncomeStatementsUseCaseTest, GetBalanceSheetStatementsUseCaseTest])
void main() {
  group('CompanyFinancialHealthCubit', () {
    late MockGetIncomeStatementsUseCaseTest getIncomeStatementsUseCase;
    late MockGetBalanceSheetStatementsUseCaseTest getBalanceSheetStatementsUseCase;
    late DateTime now;

    setUp(() {
      getIncomeStatementsUseCase = MockGetIncomeStatementsUseCaseTest();
      getBalanceSheetStatementsUseCase = MockGetBalanceSheetStatementsUseCaseTest();
      now = DateTime.now();
    });

    test('Initial state should be CompanyFinancialHealthInitial', () {
      expect(CompanyFinancialHealthCubit(getIncomeStatementsUseCase, getBalanceSheetStatementsUseCase).state,
          CompanyFinancialHealthInitial());
    });

    blocTest(
      'on getFinancialHealth action should set CompanyFinancialHealthFailure on any GetIncomeStatementsUseCase failureData',
      setUp: () {
        when(getIncomeStatementsUseCase.call(symbol: 'AAPL'))
            .thenAnswer((_) async => DataFailed(DioException(requestOptions: RequestOptions())));
        when(getBalanceSheetStatementsUseCase.call(symbol: 'AAPL'))
            .thenAnswer((_) async => DataFailed(DioException(requestOptions: RequestOptions())));
      },
      build: () => CompanyFinancialHealthCubit(getIncomeStatementsUseCase, getBalanceSheetStatementsUseCase),
      act: (cubit) => cubit.getFinancialHealth('AAPL'),
      expect: () => <CompanyFinancialHealthState>[
        CompanyFinancialHealthLoading(),
        const CompanyFinancialHealthFailure(),
      ],
    );

    blocTest('on getFinancialHealth action should set state done with all calculated values',
        setUp: () {
          when(getIncomeStatementsUseCase.call(symbol: 'AAPL')).thenAnswer((_) async => DataSuccess([
                IncomeStatementEntity(
                  date: now,
                  symbol: 'AAPL',
                  revenue: 5,
                  netIncome: 10,
                )
              ]));
          when(getBalanceSheetStatementsUseCase.call(symbol: 'AAPL')).thenAnswer((_) async => DataSuccess([
                BalanceSheetStatementEntity(
                  date: now,
                  symbol: 'AAPL',
                  totalCurrentAssets: 15,
                  totalCurrentLiabilities: 15,
                  totalStockholdersEquity: 5,
                )
              ]));
        },
        build: () => CompanyFinancialHealthCubit(getIncomeStatementsUseCase, getBalanceSheetStatementsUseCase),
        act: (cubit) => cubit.getFinancialHealth('AAPL'),
        expect: () => <CompanyFinancialHealthState>[
              CompanyFinancialHealthLoading(),
              CompanyFinancialHealthDone(
                netIncomeMarginsOverTime: [DateValue(date: now, value: 5)],
                currentRatiosOverTime: [DateValue(date: now, value: 1)],
                debtToEquityRatiosOverTime: [DateValue(date: now, value: 3)],
              ),
            ],
        verify: (_) {
          verify(getIncomeStatementsUseCase.call(symbol: 'AAPL')).called(1);
          verify(getBalanceSheetStatementsUseCase.call(symbol: 'AAPL')).called(1);
        });
  });
}
