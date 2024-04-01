import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:injectable/injectable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

@module
abstract class DioModule {
  @LazySingleton()
  Dio dio(@Named('ApiKey') String apiKey) => Dio(
        BaseOptions(
          baseUrl: 'https://financialmodelingprep.com',
          connectTimeout: const Duration(seconds: 45),
          receiveTimeout: const Duration(seconds: 15),
          followRedirects: false,
          validateStatus: (status) => status! < 500,
          queryParameters: <String, String>{'apikey': apiKey},
        ),
      )
        ..interceptors.add(prettyDioLogger)
        ..interceptors.add(DioCacheInterceptor(options: cacheOptions));

  @Named('ApiKey') // if you need to pre resolve the value
  String get prefs => const String.fromEnvironment('API_KEY');

  final cacheOptions = CacheOptions(
    store: MemCacheStore(),
    policy: CachePolicy.request,
    maxStale: const Duration(days: 1),
  );

  final prettyDioLogger = PrettyDioLogger(
    requestHeader: true,
    requestBody: true,
    responseBody: true,
    responseHeader: false,
    error: true,
    compact: true,
    maxWidth: 90,
  );
}
