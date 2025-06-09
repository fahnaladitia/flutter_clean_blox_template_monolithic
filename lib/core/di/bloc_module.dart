part of 'injection.dart';

/// =========================================================
/// Created by Pahnal Aditia
/// GitHub  : https://github.com/fahnaladitia
/// LinkedIn: https://www.linkedin.com/in/pahnaladitia
/// =========================================================

class BlocModule {
  BlocModule._();

  static Future<void> init() async {
    getIt.registerLazySingleton(
      () => AuthBloc(
        getCredentialUsecase: getIt(),
        signOutUsecase: getIt(),
        isSignedInUsecase: getIt(),
      ),
    );
    getIt.registerFactory(
      () => SignInBloc(signInWithEmailAndPasswordUsecase: getIt()),
    );
    // Add more BLoC registrations as needed
  }
}
