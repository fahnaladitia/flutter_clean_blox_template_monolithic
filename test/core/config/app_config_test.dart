import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_clean_blox_template/core/config/config.dart'; // pastikan ini sesuai path kamu

void main() {
  setUp(() {
    AppConfig.resetForTest(); // ✅ pastikan state fresh
  });
  group('AppConfig', () {
    test('should load staging config correctly', () {
      // ARRANGE
      final expectedBaseUrl = 'https://staging.example.com/api';

      // ACT
      AppConfig.load(AppFlavor.staging);

      // ASSERT
      expect(AppConfig.flavor, AppFlavor.staging);
      expect(AppConfig.config.baseURL, expectedBaseUrl);
      expect(AppConfig.config.apiKey, isNotEmpty);
      expect(AppConfig.config.sentryDSN, isNotEmpty);
    });

    test('should load production config correctly', () {
      // ARRANGE
      final expectedApiKey = 'production-api-key';

      // ACT
      AppConfig.load(AppFlavor.production);

      // ASSERT
      expect(AppConfig.flavor, AppFlavor.production);
      expect(AppConfig.config.apiKey, expectedApiKey);
      expect(AppConfig.config.baseURL, isNotEmpty);
      expect(AppConfig.config.sentryDSN, isNotEmpty);
    });

    test('should throw error when accessing config before load', () {
      // ARRANGE
      // (no load call)

      // ACT & ASSERT
      expect(() => AppConfig.config, throwsA(isA<AssertionError>()));
      expect(() => AppConfig.flavor, throwsA(isA<AssertionError>()));
    });

    test('should throw error when reloading config', () {
      // ARRANGE
      AppConfig.load(AppFlavor.staging);

      // ACT & ASSERT
      expect(
        () => AppConfig.load(AppFlavor.production),
        throwsA(isA<AssertionError>()),
      );
    });
  });
}
