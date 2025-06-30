part of 'di.dart';

class CoreModule extends BaseModule {
  @override
  Future<void> registerDependencies() async {
    // Initialize core dependencies here
    await AppLogger.init();
    sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl());
  }
}
