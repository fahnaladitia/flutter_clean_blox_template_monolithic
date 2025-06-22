import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_clean_blox_template/data/sources/local/entities/credential_entity.dart';
import 'package:flutter_clean_blox_template/domain/models/credential.dart';
import 'package:flutter_clean_blox_template/data/mappers/credential_mapper.dart';

void main() {
  group('CredentialMapper', () {
    test('should convert Credential to CredentialEntity', () {
      // Arrange
      final domain = Credential(
        userId: '123',
        token: 'access_token',
        refreshToken: 'refresh_token',
      );

      // Act
      final entity = domain.toEntity();

      // Assert
      expect(entity.userId, domain.userId);
      expect(entity.token, domain.token);
      expect(entity.refreshToken, domain.refreshToken);
    });

    test('should convert CredentialEntity to Credential', () {
      // Arrange
      final entity = CredentialEntity(
        userId: '321',
        token: 'access_token_entity',
        refreshToken: 'refresh_token_entity',
      );

      // Act
      final domain = entity.toDomain();

      // Assert
      expect(domain.userId, entity.userId);
      expect(domain.token, entity.token);
      expect(domain.refreshToken, entity.refreshToken);
    });

    test('should handle null values in CredentialEntity', () {
      // Arrange
      final entity = CredentialEntity(
        userId: null,
        token: null,
        refreshToken: null,
      );

      // Act
      final domain = entity.toDomain();

      // Assert
      expect(domain.userId, '');
      expect(domain.token, '');
      expect(domain.refreshToken, '');
    });
  });
}
