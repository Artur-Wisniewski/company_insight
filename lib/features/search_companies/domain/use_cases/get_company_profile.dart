import 'package:company_insight_app/core/resources/data_source.dart';
import 'package:injectable/injectable.dart';

import '../entities/company_profile.dart';
import '../repositories/company_repository.dart';

@lazySingleton
class GetCompanyProfileUseCase {
  final CompanyRepository repository;

  const GetCompanyProfileUseCase(this.repository);

  Future<DataState<CompanyProfileEntity>> call({required String symbol}) async {
    return await repository.getCompanyProfile(symbol: symbol);
  }
}
