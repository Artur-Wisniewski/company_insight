import 'package:company_insight_app/core/constants/status_codes.dart';
import 'package:company_insight_app/core/exceptions/exceptions.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../models/remote/company_preview_model.dart';

abstract interface class CompanyPreviewsListRemoteDataSource {
  Future<List<CompanyPreviewModel>> findCompanyOverviewBy({required String searchQuery, int? limit});
}

@Singleton(as: CompanyPreviewsListRemoteDataSource)
class CompaniesOverviewListRemoteDataSourceImpl implements CompanyPreviewsListRemoteDataSource {
  final Dio client;

  const CompaniesOverviewListRemoteDataSourceImpl(this.client);

  @override
  Future<List<CompanyPreviewModel>> findCompanyOverviewBy({required String searchQuery, int? limit}) async {
    final response = await client.get('/api/v3/search', queryParameters: <String, String>{
      'query': searchQuery,
      if (limit != null) 'limit': limit.toString(),
    });
    if (response.statusCode == StatusCode.ok || response.statusCode == StatusCode.notModified) {
      return [for (final item in response.data) CompanyPreviewModel.fromJson(item)];
    } else if (response.statusCode == StatusCode.notFound) {
      throw NotFoundException(message: response.statusMessage);
    } else {
      throw ErrorException(message: response.statusMessage);
    }
  }
}
