import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

@module
abstract class DioModule {
  @LazySingleton()
  Dio dio(@Named('ApiKey') String apiKey) => Dio(
        BaseOptions(
          baseUrl: 'https://financialmodelingprep.com',
          connectTimeout: const Duration(seconds: 5),
          receiveTimeout: const Duration(seconds: 3),
          queryParameters: <String, String>{'apikey': apiKey},
        ),
      )..interceptors.add(PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          responseBody: true,
          responseHeader: false,
          error: true,
          compact: true,
          maxWidth: 90,
        ));

  @Named('ApiKey') // if you need to pre resolve the value
  String get prefs => const String.fromEnvironment('API_KEY');
}
