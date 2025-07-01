import 'package:flutter_clean_blox_template/core/core.dart';

class AppModule extends BaseModule {
  @override
  Future<void> registerDependencies() async {
    sl.registerLazySingleton<AuthDatabase>(() => AuthDatabaseImpl());

    sl.registerLazySingleton<AppRestClient>(() {
      final client = AppRestClientImpl.create(
        baseURL: AppConfig.config.baseURL,
        apiKey: AppConfig.config.apiKey,
      );

      client.addInterceptors([
        ErrorInterceptor(),
        CoteNetworkServerUtils.interceptor,
        ChuckerFlutterUtils.interceptor,
        TokenInterceptor(authDatabase: sl<AuthDatabase>()),
        NetworkInfoInterceptor(networkInfo: sl<NetworkInfo>()),
      ]);

      return client;
    });

    AppLogger.info('AppModule initialized successfully.');
  }
}
