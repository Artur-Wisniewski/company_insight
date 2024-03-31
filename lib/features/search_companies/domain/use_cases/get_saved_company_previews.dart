import 'package:company_insight_app/core/resources/data_source.dart';
import 'package:company_insight_app/features/search_companies/domain/entities/company_overview.dart';
import 'package:injectable/injectable.dart';

import '../repositories/company_repository.dart';

@lazySingleton
class GetSavedCompanyPreviewsUseCase {
  final CompanyRepository repository;

  const GetSavedCompanyPreviewsUseCase(this.repository);

  Future<DataState<List<CompanyPreviewEntity>>> call() async {
    return await repository.getSavedCompanyOverviews();
  }
}
