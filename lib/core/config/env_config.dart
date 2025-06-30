part of 'config.dart';

class EnvConfig {
  final String baseURL;
  final String apiKey;
  final String sentryDSN;

  EnvConfig({
    required this.baseURL,
    required this.apiKey,
    required this.sentryDSN,
  });

  @override
  String toString() {
    return 'EnvConfig(baseURL: $baseURL, apiKey: $apiKey, sentryDSN: $sentryDSN)';
  }
}
