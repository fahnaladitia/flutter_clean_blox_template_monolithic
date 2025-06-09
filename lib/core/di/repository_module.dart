part of 'injection.dart';

/// ========================================================
/// Created by Pahnal Aditia
/// GitHub  : https://github.com/fahnaladitia
/// LinkedIn: https://www.linkedin.com/in/pahnaladitia
/// ========================================================

class RepositoryModule {
  RepositoryModule._();

  static Future<void> init() async {
    getIt.registerLazySingleton<IAuthRepository>(
      () => AuthRepository(getIt(), getIt()),
    );
    // Add more repository registrations as needed
  }
}
