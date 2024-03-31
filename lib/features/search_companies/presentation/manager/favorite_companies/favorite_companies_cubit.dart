import 'package:bloc/bloc.dart';
import 'package:company_insight_app/features/search_companies/domain/entities/company_overview.dart';
import 'package:company_insight_app/features/search_companies/domain/use_cases/get_saved_company_previews.dart';
import 'package:company_insight_app/features/search_companies/domain/use_cases/remove_company_previews_from_saved.dart';
import 'package:company_insight_app/features/search_companies/domain/use_cases/save_company_previews.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

part 'favorite_companies_state.dart';

@lazySingleton
class FavoriteCompaniesCubit extends Cubit<FavoriteCompaniesState> {
  FavoriteCompaniesCubit(
    this._getSavedCompanyPreviewsUseCase,
    this._removeCompanyOverviewFromSavedUseCase,
    this._saveCompanyPreviewUseCase,
  ) : super(FavoriteCompaniesInitial());

  final GetSavedCompanyPreviewsUseCase _getSavedCompanyPreviewsUseCase;
  final RemoveCompanyOverviewFromSavedUseCase _removeCompanyOverviewFromSavedUseCase;
  final SaveCompanyPreviewUseCase _saveCompanyPreviewUseCase;

  Future<void> getCompanies() async {
    print('getCompanies');
    emit(FavoriteCompaniesLoading());
    final savedCompanyPreviews = await _getSavedCompanyPreviewsUseCase.call();
    print('savedCompanyPreviews: ${savedCompanyPreviews.data?.length}');
    emit(FavoriteCompaniesDone(companies: savedCompanyPreviews.data!));
  }

  Future<void> toggleFavorite(CompanyPreviewEntity companyPreview) async {
    if (state is! FavoriteCompaniesDone) return;
    final companies = (state as FavoriteCompaniesDone).companies;
    if (!companies.contains(companyPreview)) {
      await _saveCompanyPreviewUseCase.call(companyOverview: companyPreview);
    } else {
      await _removeCompanyOverviewFromSavedUseCase.call(companyOverview: companyPreview);
    }
    await getCompanies();
  }
}
