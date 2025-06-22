import 'package:flutter_clean_blox_template/data/sources/remote/dto/requests/sign_in_request_dto.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('SignInRequestDto', () {
    const email = 'test@example.com';
    const password = 'password123';

    test('should support value comparison', () {
      const dto1 = SignInRequestDto(email: email, password: password);
      const dto2 = SignInRequestDto(email: email, password: password);

      expect(dto1, equals(dto2));
      expect(dto1.hashCode, equals(dto2.hashCode));
    });

    test('toJson returns correct map', () {
      const dto = SignInRequestDto(email: email, password: password);
      final json = dto.toJson();

      expect(json['email'], email);
      expect(json['password'], password);
    });

    test('fromJson returns correct object', () {
      final json = {'email': email, 'password': password};

      final dto = SignInRequestDto.fromJson(json);

      expect(dto.email, email);
      expect(dto.password, password);
    });

    test('toString returns correct format', () {
      const dto = SignInRequestDto(email: email, password: password);
      expect(dto.toString(), '$email, $password, ');
    });
  });
}
