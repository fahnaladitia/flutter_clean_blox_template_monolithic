part of 'injection.dart';

/// =========================================================
/// Created by Pahnal Aditia
/// GitHub  : https://github.com/fahnaladitia
/// LinkedIn: https://www.linkedin.com/in/pahnaladitia
/// =========================================================

class NetworkModule {
  NetworkModule._();

  static Future<void> init({required String baseURL}) async {
    final dio = AppRestClient.instance(baseURL: baseURL);
    getIt.registerLazySingleton<Dio>(() => dio);

    getIt.registerLazySingleton(() => AuthApi(getIt()));

    // Add more network firebase service/api registrations as needed
  }
}
