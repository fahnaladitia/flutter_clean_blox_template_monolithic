import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_clean_blox_template/domain/models/sign_in_request.dart';
import 'package:flutter_clean_blox_template/data/sources/remote/dto/requests/sign_in_request_dto.dart';
import 'package:flutter_clean_blox_template/data/mappers/sign_in_request_mapper.dart';

void main() {
  group('SignInRequestMapper', () {
    test('should convert SignInRequest to SignInRequestDto', () {
      // Arrange
      final domain = SignInRequest(
        email: 'user@example.com',
        password: 'securePass',
      );

      // Act
      final dto = domain.toDto();

      // Assert
      expect(dto.email, domain.email);
      expect(dto.password, domain.password);
    });

    test('should convert SignInRequestDto to SignInRequest', () {
      // Arrange
      final dto = SignInRequestDto(
        email: 'dto@example.com',
        password: 'dtoPass',
      );

      // Act
      final domain = dto.toDomain();

      // Assert
      expect(domain.email, dto.email);
      expect(domain.password, dto.password);
    });

    test(
      'should handle null values in SignInRequestDto to default empty string',
      () {
        // Arrange
        final dto = SignInRequestDto(email: null, password: null);

        // Act
        final domain = dto.toDomain();

        // Assert
        expect(domain.email, '');
        expect(domain.password, '');
      },
    );
  });
}
