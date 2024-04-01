import 'package:company_insight_app/setup/injectable.dart';
import 'package:company_insight_app/setup/start_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  await getIt.allReady();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(const StartApp());
}
