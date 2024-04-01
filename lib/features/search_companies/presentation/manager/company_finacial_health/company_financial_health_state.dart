part of 'company_financial_health_cubit.dart';

abstract class CompanyFinancialHealthState extends Equatable {
  const CompanyFinancialHealthState();

  @override
  List<Object?> get props => [];
}

class CompanyFinancialHealthInitial extends CompanyFinancialHealthState {}

class CompanyFinancialHealthLoading extends CompanyFinancialHealthState {}

class CompanyFinancialHealthDone extends CompanyFinancialHealthState {
  final List<DateValue> netIncomeMarginsOverTime;
  final List<DateValue> currentRatiosOverTime;
  final List<DateValue> debtToEquityRatiosOverTime;

  const CompanyFinancialHealthDone({
    required this.netIncomeMarginsOverTime,
    required this.currentRatiosOverTime,
    required this.debtToEquityRatiosOverTime,
  });

  @override
  List<Object> get props => [netIncomeMarginsOverTime, currentRatiosOverTime, debtToEquityRatiosOverTime];
}

class CompanyFinancialHealthFailure extends CompanyFinancialHealthState {
  final String? message;

  const CompanyFinancialHealthFailure({this.message});

  @override
  List<Object?> get props => [message];
}

class DateValue extends Equatable {
  final DateTime date;
  final double value;

  const DateValue({required this.date, required this.value});

  @override
  List<Object> get props => [date, value];
}
