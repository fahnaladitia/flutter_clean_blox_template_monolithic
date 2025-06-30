import 'package:flutter_clean_blox_template/core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_blox_template/shared/themes/themes.dart';

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

    final themeDark = await MaterialTheme.loadDarkTheme();
    final themeLight = await MaterialTheme.loadLightTheme();

    // Color scheme and themes
    sl.registerLazySingleton<ThemeData>(
      () => themeLight ?? ThemeData.light(),
      instanceName: MaterialTheme.lightThemeInstance,
    );

    sl.registerLazySingleton<ThemeData>(
      () => themeDark ?? ThemeData.dark(),
      instanceName: MaterialTheme.darkThemeInstance,
    );

    AppLogger.info('AppModule initialized successfully.');
  }
}
