import 'package:flutter_clean_blox_template/data/sources/remote/dto/responses/sign_in_response_dto.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('SignInResponseDto', () {
    const userId = 'user-123';
    const token = 'token-abc';
    const refreshToken = 'refresh-token-xyz';

    final json = {
      "success": true,
      "data": {"userId": userId, "token": token, "refreshToken": refreshToken},
    };

    test('fromJson returns valid SignInResponseDto', () {
      final dto = SignInResponseDto.fromJson(json);

      expect(dto.success, true);
      expect(dto.data?.userId, userId);
      expect(dto.data?.token, token);
      expect(dto.data?.refreshToken, refreshToken);
    });

    test('should support value comparison', () {
      final dto1 = SignInResponseDto.fromJson(json);
      final dto2 = SignInResponseDto.fromJson(json);

      expect(dto1, equals(dto2));
      expect(dto1.hashCode, equals(dto2.hashCode));
    });

    test('toString returns correct format', () {
      final dto = SignInResponseDto.fromJson(json);
      expect(dto.toString(), '${dto.success}, ${dto.data}, ');
    });
  });

  group('SignInResponseDtoData', () {
    const userId = 'user-456';
    const token = 'token-xyz';
    const refreshToken = 'refresh-abc';

    final jsonData = {
      "userId": userId,
      "token": token,
      "refreshToken": refreshToken,
    };

    test('fromJson returns valid SignInResponseDtoData', () {
      final data = SignInResponseDtoData.fromJson(jsonData);

      expect(data.userId, userId);
      expect(data.token, token);
      expect(data.refreshToken, refreshToken);
    });

    test('should support value comparison', () {
      final data1 = SignInResponseDtoData.fromJson(jsonData);
      final data2 = SignInResponseDtoData.fromJson(jsonData);

      expect(data1, equals(data2));
      expect(data1.hashCode, equals(data2.hashCode));
    });

    test('toString returns correct format', () {
      final data = SignInResponseDtoData.fromJson(jsonData);
      expect(data.toString(), '$userId, $token, $refreshToken, ');
    });
  });
}
