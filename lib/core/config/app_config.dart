part of 'config.dart';

class AppConfig {
  static EnvConfig? _config;
  static EnvConfig get config {
    assert(
      _config != null,
      'AppConfig must be initialized with a flavor before use.',
    );
    assert(
      _config!.baseURL.isNotEmpty,
      'Base URL must not be empty. Please set a valid base URL in the configuration.',
    );
    assert(
      _config!.apiKey.isNotEmpty,
      'API Key must not be empty. Please set a valid API Key in the configuration.',
    );
    assert(
      _config!.sentryDSN.isNotEmpty,
      'Sentry DSN must not be empty. Please set a valid Sentry DSN in the configuration.',
    );

    return _config!;
  }

  static AppFlavor? _flavor;
  static AppFlavor get flavor {
    assert(
      _flavor != null,
      'AppConfig must be initialized with a flavor before use.',
    );
    return _flavor!;
  }

  AppConfig._();

  static bool _withAuth = true;
  static bool get withAuth => _withAuth;

  static void load(AppFlavor selectedFlavor, {bool withAuth = true}) async {
    assert(
      _flavor == null,
      'AppConfig has already been initialized with a flavor. Cannot reinitialize.',
    );

    assert(
      _config == null,
      'AppConfig has already been initialized with a configuration. Cannot reinitialize.',
    );

    _flavor = selectedFlavor;
    _withAuth = withAuth;
    switch (selectedFlavor) {
      case AppFlavor.staging:
        _config = EnvConfig(
          baseURL: 'https://staging.example.com/api',
          apiKey: 'staging-api-key',
          sentryDSN: 'https://staging.sentry.io/123456',
        );
        break;
      case AppFlavor.production:
        _config = EnvConfig(
          baseURL: 'https://api.example.com',
          apiKey: 'production-api-key',
          sentryDSN: 'https://sentry.example.com/123456',
        );
        break;
    }
  }

  @visibleForTesting
  static void resetForTest() {
    _config = null;
    _flavor = null;
  }
}
