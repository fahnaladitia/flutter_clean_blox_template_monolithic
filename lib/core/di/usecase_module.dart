part of 'injection.dart';

/// =========================================================
/// Created by Pahnal Aditia
/// GitHub  : https://github.com/fahnaladitia
/// LinkedIn: https://www.linkedin.com/in/pahnaladitia
/// =========================================================

class UseCaseModule {
  UseCaseModule._();

  static Future<void> init() async {
    await _authUseCases();

    // Add more use case registrations as needed
  }

  static Future<void> _authUseCases() async {
    getIt.registerLazySingleton<GetCredentialUsecase>(
      () => GetCredentialUsecase(getIt()),
    );

    getIt.registerLazySingleton<SignOutUsecase>(() => SignOutUsecase(getIt()));

    getIt.registerLazySingleton<IsSignedInUsecase>(
      () => IsSignedInUsecase(getIt()),
    );

    getIt.registerLazySingleton<SignInWithEmailAndPasswordUsecase>(
      () => SignInWithEmailAndPasswordUsecase(getIt()),
    );
  }
}
