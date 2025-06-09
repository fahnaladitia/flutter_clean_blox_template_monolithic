part of 'injection.dart';

/// =========================================================
/// Created by Pahnal Aditia
/// GitHub  : https://github.com/fahnaladitia
/// LinkedIn: https://www.linkedin.com/in/pahnaladitia
/// =========================================================

class DatabaseModule {
  DatabaseModule._();

  static Future<void> init() async {
    getIt.registerLazySingleton(() => AuthDatabase());

    // Add more database registrations as needed
  }
}
