import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_clean_blox_template/data/sources/local/entities/credential_entity.dart';

void main() {
  group('CredentialEntity', () {
    const credential = CredentialEntity(
      userId: 'user-id',
      token: 'token123',
      refreshToken: 'refresh-token123',
    );

    test('supports equality', () {
      const other = CredentialEntity(
        userId: 'user-id',
        token: 'token123',
        refreshToken: 'refresh-token123',
      );

      expect(credential, equals(other));
    });

    test('toJson returns correct map', () {
      final json = credential.toJson();
      expect(json, {
        'userId': 'user-id',
        'token': 'token123',
        'refreshToken': 'refresh-token123',
      });
    });

    test('fromJson creates correct instance', () {
      final json = {
        'userId': 'user-id',
        'token': 'token123',
        'refreshToken': 'refresh-token123',
      };

      final result = CredentialEntity.fromJson(json);
      expect(result, credential);
    });

    test('fromJson works with missing refreshToken', () {
      final json = {
        'userId': 'user-id',
        'token': 'token123',
        // no refreshToken
      };

      final result = CredentialEntity.fromJson(json);
      expect(result.userId, 'user-id');
      expect(result.token, 'token123');
      expect(result.refreshToken, isNull);
    });
  });
}
