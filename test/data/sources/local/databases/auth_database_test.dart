import 'package:flutter_clean_blox_template/data/sources/local/databases/auth_database.dart';
import 'package:flutter_clean_blox_template/data/sources/local/entities/credential_entity.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockFlutterSecureStorage extends Mock implements FlutterSecureStorage {}

void main() {
  late MockFlutterSecureStorage mockStorage;
  late AuthDatabase authDatabase;

  const testCredential = CredentialEntity(
    token: 'token',
    refreshToken: 'refresh-token',
    userId: 'user-id',
  );

  setUp(() {
    mockStorage = MockFlutterSecureStorage();
    authDatabase = AuthDatabase(mockStorage);
  });

  group('AuthDatabase', () {
    test('saveCredential writes correct values', () async {
      // Arrange
      when(
        () => mockStorage.write(
          key: any(named: 'key'),
          value: any(named: 'value'),
        ),
      ).thenAnswer((_) async => {});

      // Act
      await authDatabase.saveCredential(testCredential);

      // Assert
      verify(
        () => mockStorage.write(key: 'auth_token', value: 'token'),
      ).called(1);
      verify(
        () => mockStorage.write(key: 'refresh_token', value: 'refresh-token'),
      ).called(1);
      verify(
        () => mockStorage.write(key: 'user_id', value: 'user-id'),
      ).called(1);
    });

    test('getCredential returns valid entity if values exist', () async {
      // Arrange
      when(
        () => mockStorage.read(key: 'auth_token'),
      ).thenAnswer((_) async => 'token');
      when(
        () => mockStorage.read(key: 'refresh_token'),
      ).thenAnswer((_) async => 'refresh-token');
      when(
        () => mockStorage.read(key: 'user_id'),
      ).thenAnswer((_) async => 'user-id');

      // Act
      final result = await authDatabase.getCredential();

      // Assert
      expect(result, isNotNull);
      expect(result?.token, 'token');
      expect(result?.refreshToken, 'refresh-token');
      expect(result?.userId, 'user-id');
    });

    test('getCredential returns null if token or userId is null', () async {
      // Arrange
      when(
        () => mockStorage.read(key: 'auth_token'),
      ).thenAnswer((_) async => null); // Simulasikan token null

      when(
        () => mockStorage.read(key: 'user_id'),
      ).thenAnswer((_) async => 'user-id'); // userId masih ada

      when(
        () => mockStorage.read(key: 'refresh_token'),
      ).thenAnswer((_) async => 'refresh-token'); // optional, bisa null juga

      // Act
      final result = await authDatabase.getCredential();

      // Assert
      expect(result, isNull);
    });

    test('isSignedIn returns true if token exists', () async {
      when(
        () => mockStorage.read(key: 'auth_token'),
      ).thenAnswer((_) async => 'token');

      final result = await authDatabase.isSignedIn;

      expect(result, isTrue);
    });

    test('clear calls deleteAll', () async {
      when(() => mockStorage.deleteAll()).thenAnswer((_) async => {});

      await authDatabase.clear();

      verify(() => mockStorage.deleteAll()).called(1);
    });
  });
}
