import 'package:floor/floor.dart';

import '../../../models/local/company_preview_dto.dart';

@dao
abstract class CompanyPreviewsDao {
  @Insert()
  Future<void> insertCompanyPreview(CompanyPreviewDTO companyPreview);

  @delete
  Future<void> deleteCompanyPreview(CompanyPreviewDTO companyPreview);

  @Query('SELECT * FROM companies_overviews')
  Future<List<CompanyPreviewDTO>> selectSavedCompanyPreviews();
}
