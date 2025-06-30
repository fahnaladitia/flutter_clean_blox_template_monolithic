import 'package:flutter_clean_blox_template/features/auth/data/sources/local/entities/auth_entity.dart';
import 'package:flutter_clean_blox_template/features/auth/data/sources/remote/auth_remote_data_source.dart';
import 'package:flutter_clean_blox_template/features/auth/data/sources/remote/dtos/req/refresh_token_request.dart';
import 'package:flutter_clean_blox_template/features/auth/data/sources/remote/dtos/req/sign_in_request.dart';
import 'package:flutter_clean_blox_template/features/auth/data/sources/remote/dtos/req/sign_up_request.dart';
import 'package:flutter_clean_blox_template/features/auth/data/sources/remote/dtos/res/sign_up_response.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:mockito/annotations.dart';
import 'package:flutter_clean_blox_template/core/core.dart';
import 'package:mockito/mockito.dart';
import 'package:dio/dio.dart';

import 'auth_remote_data_source_test.mocks.dart'; // path ke AppRestClient

@GenerateMocks([AppRestClient])
void main() {
  late MockAppRestClient mockClient;
  late AuthRemoteDataSource dataSource;

  setUp(() {
    mockClient = MockAppRestClient();
    dataSource = AuthRemoteDataSourceImpl(client: mockClient);
  });

  group('signIn', () {
    test('returns mocked AuthEntity', () async {
      // ACT
      final result = await dataSource.signIn(
        SignInRequest(email: 'a', password: 'b'),
      );

      // ASSERT
      expect(result, isA<AuthEntity>());
      expect(result.accessToken, 'mock_access_token');
      expect(result.userId, 'mock_user_id');
    });
  });

  group('signUp', () {
    test('returns AuthEntity from signUp response', () async {
      // ARRANGE
      final request = SignUpRequest(email: 'a', password: 'b', name: 'c');
      final dto = SignUpResponse(
        data: SignUpResponseData(
          accessToken: 'signup_token',
          refreshToken: 'signup_refresh',
          userId: 'signup_user',
        ),
      );

      when(
        mockClient.post('/v1/auth/sign-up', data: request.toJson()),
      ).thenAnswer(
        (_) async => Response(
          data: dto,
          requestOptions: RequestOptions(path: ''),
        ),
      );

      // ACT
      final result = await dataSource.signUp(request);

      // ASSERT
      expect(result.userId, 'signup_user');
      expect(result.accessToken, 'signup_token');
    });
  });

  group('refreshAccessToken', () {
    test('returns access token from response', () async {
      // ARRANGE
      final request = RefreshTokenRequest(refreshToken: 'old_refresh');
      final dto = {
        'data': {'access_token': 'new_access_token'},
      };

      when(
        mockClient.post('/v1/auth/refresh-token', data: request.toJson()),
      ).thenAnswer(
        (_) async => Response(
          data: dto,
          requestOptions: RequestOptions(path: ''),
        ),
      );

      // ACT
      final token = await dataSource.refreshAccessToken(request);

      // ASSERT
      expect(token, 'new_access_token');
    });

    test('throws NetworkException when access token is null', () async {
      final dto = {
        'data': {'accessToken': null},
      };

      when(mockClient.post(any, data: anyNamed('data'))).thenAnswer(
        (_) async => Response(
          data: dto,
          requestOptions: RequestOptions(path: ''),
        ),
      );

      expect(
        () => dataSource.refreshAccessToken(
          RefreshTokenRequest(refreshToken: 'invalid'),
        ),
        throwsA(isA<NetworkException>()),
      );
    });
  });
}
