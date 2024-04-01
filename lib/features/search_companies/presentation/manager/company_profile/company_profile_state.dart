part of 'company_profile_cubit.dart';

abstract class CompanyProfileState extends Equatable {
  const CompanyProfileState();

  @override
  List<Object> get props => [];
}

class CompanyProfileInitial extends CompanyProfileState {}

class CompanyProfileLoading extends CompanyProfileState {}

class CompanyProfileDone extends CompanyProfileState {
  final CompanyProfileEntity companyProfile;

  const CompanyProfileDone({required this.companyProfile});

  @override
  List<Object> get props => [companyProfile];
}

class CompanyProfileFailure extends CompanyProfileState {
  final Exception exception;

  const CompanyProfileFailure({required this.exception});

  @override
  List<Object> get props => [exception];
}
