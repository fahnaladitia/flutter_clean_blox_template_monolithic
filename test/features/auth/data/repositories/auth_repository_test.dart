import 'package:flutter_clean_blox_template/features/auth/data/repositories/auth_repository.dart';
import 'package:flutter_clean_blox_template/features/auth/data/sources/local/auth_local_data_source.dart';
import 'package:flutter_clean_blox_template/features/auth/data/sources/local/entities/auth_entity.dart';
import 'package:flutter_clean_blox_template/features/auth/data/sources/remote/auth_remote_data_source.dart';
import 'package:flutter_clean_blox_template/features/auth/data/sources/remote/dtos/req/refresh_token_request.dart';
import 'package:flutter_clean_blox_template/features/auth/data/sources/remote/dtos/req/sign_in_request.dart';
import 'package:flutter_clean_blox_template/features/auth/data/sources/remote/dtos/req/sign_up_request.dart';
import 'package:flutter_clean_blox_template/features/auth/domain/models/auth.dart';
import 'package:flutter_clean_blox_template/features/auth/domain/repositories/auth_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'auth_repository_test.mocks.dart';

@GenerateMocks([AuthLocalDataSource, AuthRemoteDataSource])
void main() {
  late MockAuthLocalDataSource local;
  late MockAuthRemoteDataSource remote;
  late AuthRepository repo;

  setUp(() {
    local = MockAuthLocalDataSource();
    remote = MockAuthRemoteDataSource();
    repo = AuthRepositoryImpl(localDataSource: local, remoteDataSource: remote);
  });

  final authEntity = AuthEntity(
    userId: 'user123',
    accessToken: 'access_token',
    refreshToken: 'refresh_token',
  );

  final authModel = Auth(
    userId: 'user123',
    accessToken: 'access_token',
    refreshToken: 'refresh_token',
  );

  group('signIn', () {
    test('returns Auth after signIn', () async {
      when(remote.signIn(any)).thenAnswer((_) async => authEntity);

      final result = await repo.signIn(email: 'email', password: 'pass');

      expect(result.userId, authModel.userId);
      verify(
        remote.signIn(
          argThat(
            isA<SignInRequest>()
                .having((r) => r.email, 'email', 'email')
                .having((r) => r.password, 'password', 'pass'),
          ),
        ),
      ).called(1);
    });
  });

  group('signUp', () {
    test('returns Auth after signUp', () async {
      when(remote.signUp(any)).thenAnswer((_) async => authEntity);

      final result = await repo.signUp(
        name: 'name',
        email: 'email',
        password: 'pass',
      );

      expect(result.accessToken, authModel.accessToken);
      verify(
        remote.signUp(
          argThat(
            isA<SignUpRequest>()
                .having((r) => r.name, 'name', 'name')
                .having((r) => r.email, 'email', 'email')
                .having((r) => r.password, 'password', 'pass'),
          ),
        ),
      ).called(1);
    });
  });

  group('saveAuth', () {
    test('calls localDataSource.saveAuth with AuthEntity', () async {
      when(local.saveAuth(any)).thenAnswer((_) async => Future.value());

      await repo.saveAuth(authModel);

      verify(local.saveAuth(any)).called(1);
    });
  });

  group('createNewAccessToken', () {
    test('returns new token from remote', () async {
      when(remote.refreshAccessToken(any)).thenAnswer((_) async => 'new_token');

      final result = await repo.createNewAccessToken('refresh_token');

      expect(result, 'new_token');
      verify(
        remote.refreshAccessToken(
          argThat(
            isA<RefreshTokenRequest>().having(
              (r) => r.refreshToken,
              'refreshToken',
              'refresh_token',
            ),
          ),
        ),
      ).called(1);
    });
  });

  group('getAccessToken', () {
    test('returns token from local', () async {
      when(local.getToken()).thenAnswer((_) async => 'token');

      final token = await repo.getAccessToken();

      expect(token, 'token');
    });
  });

  group('getRefreshToken', () {
    test('returns refresh token from local', () async {
      when(local.getRefreshToken()).thenAnswer((_) async => 'refresh');

      final token = await repo.getRefreshToken();

      expect(token, 'refresh');
    });
  });

  group('getUserId', () {
    test('returns user id from local', () async {
      when(local.getUserId()).thenAnswer((_) async => 'uid');

      final result = await repo.getUserId();

      expect(result, 'uid');
    });
  });

  group('isAuthenticated', () {
    test('returns true from local', () async {
      when(local.isAuthenticated()).thenAnswer((_) async => true);

      final result = await repo.isAuthenticated();

      expect(result, isTrue);
    });
  });

  group('signOut', () {
    test('clears local storage', () async {
      when(local.clear()).thenAnswer((_) async => Future.value());

      await repo.signOut();

      verify(local.clear()).called(1);
    });
  });

  group('updateAccessToken', () {
    test('updates access token in local', () async {
      when(
        local.updateAccessToken(any),
      ).thenAnswer((_) async => Future.value());

      await repo.updateAccessToken('updated_token');

      verify(local.updateAccessToken('updated_token')).called(1);
    });
  });

  group('getAuth', () {
    test('returns null if no entity', () async {
      when(local.getAuth()).thenAnswer((_) async => null);

      final result = await repo.getAuth();

      expect(result, isNull);
    });

    test('returns Auth from entity if exists', () async {
      when(local.getAuth()).thenAnswer((_) async => authEntity);

      final result = await repo.getAuth();

      expect(result?.userId, authEntity.userId);
    });
  });
}
