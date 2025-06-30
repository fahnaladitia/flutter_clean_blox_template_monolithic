import 'package:flutter_clean_blox_template/features/auth/data/sources/local/entities/auth_entity.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_clean_blox_template/features/auth/domain/models/auth.dart';
import 'package:flutter_clean_blox_template/features/auth/data/sources/remote/dtos/res/sign_in_response.dart';
import 'package:flutter_clean_blox_template/features/auth/data/sources/remote/dtos/res/sign_up_response.dart';

void main() {
  group('AuthEntity', () {
    test('toJson returns correct map', () {
      // ARRANGE
      final entity = AuthEntity(
        userId: '123',
        accessToken: 'access_token',
        refreshToken: 'refresh_token',
      );

      // ACT
      final json = entity.toJson();

      // ASSERT
      expect(json, {
        'userId': '123',
        'accessToken': 'access_token',
        'refreshToken': 'refresh_token',
      });
    });

    test('fromSignInResponse returns correct entity', () {
      // ARRANGE
      final response = SignInResponse(
        data: SignInResponseData(
          userId: 'u123',
          accessToken: 'access_123',
          refreshToken: 'refresh_123',
        ),
      );

      // ACT
      final entity = AuthEntity.fromSignInResponse(response);

      // ASSERT
      expect(entity.userId, 'u123');
      expect(entity.accessToken, 'access_123');
      expect(entity.refreshToken, 'refresh_123');
    });

    test('fromSignUpResponse returns correct entity', () {
      // ARRANGE
      final response = SignUpResponse(
        data: SignUpResponseData(
          userId: 'u999',
          accessToken: 'access_999',
          refreshToken: 'refresh_999',
        ),
      );

      // ACT
      final entity = AuthEntity.fromSignUpResponse(response);

      // ASSERT
      expect(entity.userId, 'u999');
      expect(entity.accessToken, 'access_999');
      expect(entity.refreshToken, 'refresh_999');
    });

    test('fromDomain maps correctly from Auth model', () {
      // ARRANGE
      final auth = Auth(
        userId: 'dom123',
        accessToken: 'token123',
        refreshToken: 'refresh123',
      );

      // ACT
      final entity = AuthEntity.fromDomain(auth);

      // ASSERT
      expect(entity.userId, 'dom123');
      expect(entity.accessToken, 'token123');
      expect(entity.refreshToken, 'refresh123');
    });

    test('fromSignInResponse handles null data safely', () {
      // ARRANGE
      final response = SignInResponse(data: null);

      // ACT
      final entity = AuthEntity.fromSignInResponse(response);

      // ASSERT
      expect(entity.userId, '');
      expect(entity.accessToken, '');
      expect(entity.refreshToken, '');
    });
  });
}
