import 'package:company_insight_app/features/search_companies/domain/entities/company_overview.dart';
import 'package:injectable/injectable.dart';

import '../repositories/company_repository.dart';

@lazySingleton
class SaveCompanyPreviewUseCase {
  final CompanyRepository repository;

  const SaveCompanyPreviewUseCase(this.repository);

  Future<void> call({required CompanyPreviewEntity companyOverview}) async {
    await repository.addCompanyToSaved(companyOverview: companyOverview);
  }
}
