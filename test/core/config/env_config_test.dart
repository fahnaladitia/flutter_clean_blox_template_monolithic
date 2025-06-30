import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_clean_blox_template/core/config/config.dart'; // pastikan path ini benar

void main() {
  group('EnvConfig', () {
    test('should create a valid instance with correct values', () {
      // ARRANGE
      const baseURL = 'https://api.example.com';
      const apiKey = 'ABC123';
      const sentryDSN = 'https://sentry.io/dsn';

      // ACT
      final config = EnvConfig(
        baseURL: baseURL,
        apiKey: apiKey,
        sentryDSN: sentryDSN,
      );

      // ASSERT
      expect(config.baseURL, baseURL);
      expect(config.apiKey, apiKey);
      expect(config.sentryDSN, sentryDSN);
    });

    test('should return correct string from toString()', () {
      // ARRANGE
      final config = EnvConfig(
        baseURL: 'https://api.example.com',
        apiKey: 'ABC123',
        sentryDSN: 'https://sentry.io/dsn',
      );

      // ACT
      final stringOutput = config.toString();

      // ASSERT
      expect(
        stringOutput,
        'EnvConfig(baseURL: https://api.example.com, apiKey: ABC123, sentryDSN: https://sentry.io/dsn)',
      );
    });
  });
}
