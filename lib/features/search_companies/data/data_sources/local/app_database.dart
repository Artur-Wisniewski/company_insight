import 'dart:async';
import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

import '../../models/local/company_preview_dto.dart';
import 'dao/company_previews_local_data_source.dart';

part 'app_database.g.dart'; // the generated code will be there

@Database(version: 1, entities: [CompanyPreviewDTO])
abstract class AppDatabase extends FloorDatabase {
  CompanyPreviewsDao get companiesOverviewDao;
}
