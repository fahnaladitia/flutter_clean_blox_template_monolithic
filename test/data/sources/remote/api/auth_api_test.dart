import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:dio/dio.dart';

import 'package:flutter_clean_blox_template/data/sources/remote/api/auth_api.dart';
import 'package:flutter_clean_blox_template/data/sources/remote/dto/requests/sign_in_request_dto.dart';
import 'package:flutter_clean_blox_template/data/sources/remote/dto/responses/sign_in_response_dto.dart';

import 'auth_api_test.mocks.dart';

void main() {
  late MockDio mockDio;
  late AuthApi authApi;

  setUp(() {
    mockDio = MockDio();
    authApi = AuthApi(mockDio);
  });

  group('AuthApi', () {
    test('signInWithEmailAndPassword returns SignInResponseDto', () async {
      const email = 'test@example.com';
      const password = 'secret';

      final requestDto = SignInRequestDto(email: email, password: password);

      final mockResponseData = {
        'success': true,
        'data': {
          'userId': 'abc123',
          'token': 'token-xyz',
          'refreshToken': 'refresh-123',
        },
      };

      final response = Response(
        data: mockResponseData,
        statusCode: 200,
        requestOptions: RequestOptions(path: '/sign-in'),
      );

      when(
        mockDio.post('/sign-in', data: requestDto.toJson()),
      ).thenAnswer((_) async => response);

      final result = await authApi.signInWithEmailAndPassword(requestDto);

      expect(result, isA<SignInResponseDto>());
      expect(result.success, true);
      expect(result.data?.userId, 'abc123');
      expect(result.data?.token, 'token-xyz');
      expect(result.data?.refreshToken, 'refresh-123');
    });

    test('signInWithEmailAndPassword throws DioError on failure', () async {
      const email = 'wrong@example.com';
      const password = 'invalid';

      final requestDto = SignInRequestDto(email: email, password: password);

      final dioError = DioException(
        requestOptions: RequestOptions(path: '/sign-in'),
        type: DioExceptionType.badResponse,
        response: Response(
          statusCode: 401,
          data: {'message': 'Unauthorized'},
          requestOptions: RequestOptions(path: '/sign-in'),
        ),
      );

      when(
        mockDio.post('/sign-in', data: requestDto.toJson()),
      ).thenThrow(dioError);

      expect(
        () => authApi.signInWithEmailAndPassword(requestDto),
        throwsA(isA<DioException>()),
      );
    });
  });
}
