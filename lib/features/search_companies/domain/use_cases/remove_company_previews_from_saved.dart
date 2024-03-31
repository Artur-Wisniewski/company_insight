import 'package:company_insight_app/features/search_companies/domain/entities/company_overview.dart';
import 'package:injectable/injectable.dart';

import '../repositories/company_repository.dart';

@lazySingleton
class RemoveCompanyOverviewFromSavedUseCase {
  final CompanyRepository repository;

  const RemoveCompanyOverviewFromSavedUseCase(this.repository);

  Future<void> call({required CompanyPreviewEntity companyOverview}) async {
    await repository.removeCompanyFromSaved(companyOverview: companyOverview);
  }
}
