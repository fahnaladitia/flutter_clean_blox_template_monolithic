import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_clean_blox_template/data/sources/remote/dto/responses/sign_in_response_dto.dart';
import 'package:flutter_clean_blox_template/data/mappers/sign_in_response_mapper.dart';

void main() {
  group('SignInResponseMapper', () {
    test('should convert SignInResponseDto with data to CredentialEntity', () {
      // Arrange
      final dto = SignInResponseDto(
        success: true,
        data: SignInResponseDtoData(
          userId: '123',
          token: 'access_token',
          refreshToken: 'refresh_token',
        ),
      );

      // Act
      final entity = dto.toEntity();

      // Assert
      expect(entity.userId, '123');
      expect(entity.token, 'access_token');
      expect(entity.refreshToken, 'refresh_token');
    });

    test(
      'should convert SignInResponseDto with null data to empty CredentialEntity',
      () {
        // Arrange
        final dto = SignInResponseDto(data: null, success: null);

        // Act
        final entity = dto.toEntity();

        // Assert
        expect(entity.userId, '');
        expect(entity.token, '');
        expect(entity.refreshToken, '');
      },
    );
  });
}
