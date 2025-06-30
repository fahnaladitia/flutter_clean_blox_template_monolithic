part of './di.dart';

abstract class BaseModule {
  /// Initializes the module.
  Future<void> init() async {
    AppLogger.info('Initializing module: $runtimeType');
    // Initialize dependencies, providers, and repositories here
    await registerDependencies();

    AppLogger.info('Module $runtimeType initialized successfully.');
  }

  Future<void> registerDependencies();
}
