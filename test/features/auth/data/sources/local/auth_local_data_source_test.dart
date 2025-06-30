import 'package:flutter_clean_blox_template/core/core.dart';
import 'package:flutter_clean_blox_template/features/auth/data/sources/local/auth_local_data_source.dart';
import 'package:flutter_clean_blox_template/features/auth/data/sources/local/entities/auth_entity.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';

import 'auth_local_data_source_test.mocks.dart';

@GenerateMocks([AuthDatabase])
void main() {
  late MockAuthDatabase mockDatabase;
  late AuthLocalDataSource dataSource;

  final testEntity = AuthEntity(
    userId: 'uid123',
    accessToken: 'access_token',
    refreshToken: 'refresh_token',
  );

  setUp(() {
    mockDatabase = MockAuthDatabase();
    dataSource = AuthLocalDataSourceImpl(authDatabase: mockDatabase);
  });

  test('saveAuth calls database with correct data', () async {
    // ARRANGE
    when(
      mockDatabase.saveAuth(
        userId: anyNamed('userId'),
        accessToken: anyNamed('accessToken'),
        refreshToken: anyNamed('refreshToken'),
      ),
    ).thenAnswer((_) async => Future.value());

    // ACT
    await dataSource.saveAuth(testEntity);

    // ASSERT
    verify(
      mockDatabase.saveAuth(
        userId: testEntity.userId,
        accessToken: testEntity.accessToken,
        refreshToken: testEntity.refreshToken,
      ),
    ).called(1);
  });

  test('getToken returns access token', () async {
    // ARRANGE
    when(mockDatabase.getAccessToken()).thenAnswer((_) async => 'token');

    // ACT
    final result = await dataSource.getToken();

    // ASSERT
    expect(result, 'token');
  });

  test('getRefreshToken returns refresh token', () async {
    // ARRANGE
    when(mockDatabase.getRefreshToken()).thenAnswer((_) async => 'refresh');

    // ACT
    final result = await dataSource.getRefreshToken();

    // ASSERT
    expect(result, 'refresh');
  });

  test('getUserId returns user id', () async {
    // ARRANGE
    when(mockDatabase.getUserId()).thenAnswer((_) async => 'uid');

    // ACT
    final result = await dataSource.getUserId();

    // ASSERT
    expect(result, 'uid');
  });

  test('isAuthenticated returns true', () async {
    // ARRANGE
    when(mockDatabase.isAuthenticated()).thenAnswer((_) async => true);

    // ACT
    final result = await dataSource.isAuthenticated();

    // ASSERT
    expect(result, isTrue);
  });

  test('clear calls database.clear()', () async {
    // ARRANGE
    when(mockDatabase.clear()).thenAnswer((_) async => Future.value());

    // ACT
    await dataSource.clear();

    // ASSERT
    verify(mockDatabase.clear()).called(1);
  });

  test('updateAccessToken delegates to database', () async {
    // ARRANGE
    when(mockDatabase.updateAccessToken(any)).thenAnswer((_) async {});

    // ACT
    await dataSource.updateAccessToken('updated_token');

    // ASSERT
    verify(mockDatabase.updateAccessToken('updated_token')).called(1);
  });

  test('getAuth returns null if any data is null', () async {
    // ARRANGE
    when(mockDatabase.getUserId()).thenAnswer((_) async => null);
    when(mockDatabase.getAccessToken()).thenAnswer((_) async => 'a');
    when(mockDatabase.getRefreshToken()).thenAnswer((_) async => 'r');

    // ACT
    final result = await dataSource.getAuth();

    // ASSERT
    expect(result, isNull);
  });

  test('getAuth returns AuthEntity if all values are present', () async {
    // ARRANGE
    when(mockDatabase.getUserId()).thenAnswer((_) async => 'u');
    when(mockDatabase.getAccessToken()).thenAnswer((_) async => 'a');
    when(mockDatabase.getRefreshToken()).thenAnswer((_) async => 'r');

    // ACT
    final result = await dataSource.getAuth();

    // ASSERT
    expect(result, isA<AuthEntity>());
    expect(result!.userId, 'u');
    expect(result.accessToken, 'a');
    expect(result.refreshToken, 'r');
  });
}
