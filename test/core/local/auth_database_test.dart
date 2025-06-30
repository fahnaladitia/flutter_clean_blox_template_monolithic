import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter_clean_blox_template/core/core.dart'; // Ganti sesuai path ke AuthDatabase

class MockSecureStorage extends Mock implements FlutterSecureStorage {}

void main() {
  late MockSecureStorage mockStorage;
  late AuthDatabase authDatabase;

  setUp(() {
    mockStorage = MockSecureStorage();
    authDatabase = AuthDatabaseImpl(mockStorage);
  });

  group('AuthDatabaseImpl', () {
    test('saveAuth() stores userId, accessToken, and refreshToken', () async {
      // ARRANGE
      const userId = '123';
      const accessToken = 'access';
      const refreshToken = 'refresh';

      when(
        () => mockStorage.write(key: AuthDatabaseImpl.userIdKey, value: userId),
      ).thenAnswer((_) async {});
      when(
        () => mockStorage.write(
          key: AuthDatabaseImpl.accessTokenKey,
          value: accessToken,
        ),
      ).thenAnswer((_) async {});
      when(
        () => mockStorage.write(
          key: AuthDatabaseImpl.refreshTokenKey,
          value: refreshToken,
        ),
      ).thenAnswer((_) async {});

      // ACT
      await authDatabase.saveAuth(
        userId: userId,
        accessToken: accessToken,
        refreshToken: refreshToken,
      );

      // ASSERT
      verify(
        () => mockStorage.write(key: AuthDatabaseImpl.userIdKey, value: userId),
      ).called(1);
      verify(
        () => mockStorage.write(
          key: AuthDatabaseImpl.accessTokenKey,
          value: accessToken,
        ),
      ).called(1);
      verify(
        () => mockStorage.write(
          key: AuthDatabaseImpl.refreshTokenKey,
          value: refreshToken,
        ),
      ).called(1);
    });

    test('getAccessToken returns stored access token', () async {
      // ARRANGE
      const token = 'token123';
      when(
        () => mockStorage.read(key: AuthDatabaseImpl.accessTokenKey),
      ).thenAnswer((_) async => token);

      // ACT
      final result = await authDatabase.getAccessToken();

      // ASSERT
      expect(result, token);
      verify(
        () => mockStorage.read(key: AuthDatabaseImpl.accessTokenKey),
      ).called(1);
    });

    test('getRefreshToken returns stored refresh token', () async {
      // ARRANGE
      const token = 'refresh123';
      when(
        () => mockStorage.read(key: AuthDatabaseImpl.refreshTokenKey),
      ).thenAnswer((_) async => token);

      // ACT
      final result = await authDatabase.getRefreshToken();

      // ASSERT
      expect(result, token);
    });

    test('getUserId returns stored user id', () async {
      // ARRANGE
      const userId = 'user123';
      when(
        () => mockStorage.read(key: AuthDatabaseImpl.userIdKey),
      ).thenAnswer((_) async => userId);

      // ACT
      final result = await authDatabase.getUserId();

      // ASSERT
      expect(result, userId);
    });

    test('isAuthenticated returns true when access token exists', () async {
      // ARRANGE
      when(
        () => mockStorage.read(key: AuthDatabaseImpl.accessTokenKey),
      ).thenAnswer((_) async => 'exists');

      // ACT
      final result = await authDatabase.isAuthenticated();

      // ASSERT
      expect(result, true);
    });

    test('isAuthenticated returns false when access token is null', () async {
      // ARRANGE
      when(
        () => mockStorage.read(key: AuthDatabaseImpl.accessTokenKey),
      ).thenAnswer((_) async => null);

      // ACT
      final result = await authDatabase.isAuthenticated();

      // ASSERT
      expect(result, false);
    });

    test('clear() calls deleteAll', () async {
      // ARRANGE
      when(() => mockStorage.deleteAll()).thenAnswer((_) async {});

      // ACT
      await authDatabase.clear();

      // ASSERT
      verify(() => mockStorage.deleteAll()).called(1);
    });

    test('updateAccessToken writes new token', () async {
      // ARRANGE
      const newToken = 'newAccessToken';

      when(
        () => mockStorage.write(
          key: AuthDatabaseImpl.accessTokenKey,
          value: newToken,
        ),
      ).thenAnswer((_) async {});

      // ACT
      await authDatabase.updateAccessToken(newToken);

      // ASSERT
      verify(
        () => mockStorage.write(
          key: AuthDatabaseImpl.accessTokenKey,
          value: newToken,
        ),
      ).called(1);
    });
  });
}
