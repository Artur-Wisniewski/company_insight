import 'package:company_insight_app/core/resources/data_source.dart';
import 'package:injectable/injectable.dart';

import '../entities/company_overview.dart';
import '../repositories/company_repository.dart';

@lazySingleton
class SearchCompanyPreviewsUseCase {
  final CompanyRepository repository;

  const SearchCompanyPreviewsUseCase(this.repository);

  Future<DataState<List<CompanyPreviewEntity>>> call({required String query, required int limit}) async {
    return await repository.getCompanyOverviewBy(query: query, limit: limit);
  }
}
