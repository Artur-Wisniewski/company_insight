part of 'favorite_companies_cubit.dart';

sealed class FavoriteCompaniesState extends Equatable {
  const FavoriteCompaniesState();

  @override
  List<Object?> get props => [];
}

class FavoriteCompaniesInitial extends FavoriteCompaniesState {}

class FavoriteCompaniesLoading extends FavoriteCompaniesState {}

class FavoriteCompaniesDone extends FavoriteCompaniesState {
  const FavoriteCompaniesDone({required this.companies});

  final List<CompanyPreviewEntity> companies;

  @override
  List<Object?> get props => [companies];
}

class FavoriteCompaniesFailure extends FavoriteCompaniesState {
  const FavoriteCompaniesFailure({this.exception});

  final Exception? exception;

  @override
  List<Object?> get props => [exception];
}
