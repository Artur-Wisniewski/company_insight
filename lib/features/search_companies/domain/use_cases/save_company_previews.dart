import 'package:injectable/injectable.dart';

import '../entities/company_overview.dart';
import '../repositories/company_repository.dart';

@lazySingleton
class SaveCompanyPreviewUseCase {
  final CompanyRepository repository;

  const SaveCompanyPreviewUseCase(this.repository);

  Future<void> call({required CompanyPreviewEntity companyOverview}) async {
    await repository.addCompanyToSaved(companyOverview: companyOverview);
  }
}
