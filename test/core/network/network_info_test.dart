import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_clean_blox_template/core/network/network.dart'; // Sesuaikan path ke NetworkInfoImpl

class MockConnectivity extends Mock implements Connectivity {}

void main() {
  late MockConnectivity mockConnectivity;
  late NetworkInfoImpl networkInfo;

  setUp(() {
    mockConnectivity = MockConnectivity();
    networkInfo = NetworkInfoImpl(mockConnectivity);
  });

  group('NetworkInfoImpl', () {
    test('returns true when connected (wifi/mobile)', () async {
      // ARRANGE
      when(
        () => mockConnectivity.checkConnectivity(),
      ).thenAnswer((_) async => [ConnectivityResult.wifi]);

      // ACT
      final result = await networkInfo.isConnected;

      // ASSERT
      expect(result, true);
    });

    test('returns false when not connected', () async {
      // ARRANGE
      when(
        () => mockConnectivity.checkConnectivity(),
      ).thenAnswer((_) async => [ConnectivityResult.none]);

      // ACT
      final result = await networkInfo.isConnected;

      // ASSERT
      expect(result, false);
    });

    test('returns true for mobile data', () async {
      // ARRANGE
      when(
        () => mockConnectivity.checkConnectivity(),
      ).thenAnswer((_) async => [ConnectivityResult.mobile]);

      // ACT
      final result = await networkInfo.isConnected;

      // ASSERT
      expect(result, true);
    });
  });
}
