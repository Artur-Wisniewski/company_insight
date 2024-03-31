import 'package:injectable/injectable.dart';

import 'app_database.dart';

@module
abstract class DatabaseModule {
  @preResolve
  Future<AppDatabase> getAppDataBase() => $FloorAppDatabase.databaseBuilder('app_database').build();
}
