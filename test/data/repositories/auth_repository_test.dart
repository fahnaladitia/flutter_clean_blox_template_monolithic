import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:flutter_clean_blox_template/data/sources/remote/dto/requests/sign_in_request_dto.dart';
import 'package:flutter_clean_blox_template/data/sources/remote/dto/responses/sign_in_response_dto.dart';
import 'package:flutter_clean_blox_template/data/sources/local/entities/credential_entity.dart';
import 'package:flutter_clean_blox_template/domain/models/sign_in_request.dart';
import 'package:flutter_clean_blox_template/domain/models/credential.dart';
import 'package:flutter_clean_blox_template/data/sources/remote/api/auth_api.dart';
import 'package:flutter_clean_blox_template/data/sources/local/databases/auth_database.dart';
import 'package:flutter_clean_blox_template/data/repositories/auth_repository.dart';

// ==========================
// Mock and Fake Definitions
// ==========================

class MockAuthApi extends Mock implements AuthApi {}

class MockAuthDatabase extends Mock implements AuthDatabase {}

class FakeSignInRequestDto extends Fake implements SignInRequestDto {}

class FakeCredentialEntity extends Fake implements CredentialEntity {}

void main() {
  late AuthRepository authRepository;
  late MockAuthApi mockAuthApi;
  late MockAuthDatabase mockAuthDatabase;

  // Register fallback values for mocktail
  setUpAll(() {
    registerFallbackValue(FakeSignInRequestDto());
    registerFallbackValue(FakeCredentialEntity());
  });

  // Initialize repository and mocks before each test
  setUp(() {
    mockAuthApi = MockAuthApi();
    mockAuthDatabase = MockAuthDatabase();
    authRepository = AuthRepository(mockAuthDatabase, mockAuthApi);
  });

  group('AuthRepository', () {
    const signInRequest = SignInRequest(
      email: 'test@example.com',
      password: 'password123',
    );

    const signInResponseDto = SignInResponseDto(
      success: true,
      data: SignInResponseDtoData(
        userId: 'user-id',
        token: 'token',
        refreshToken: 'refresh-token',
      ),
    );

    final credentialEntity = CredentialEntity(
      userId: 'user-id',
      token: 'token',
      refreshToken: 'refresh-token',
    );

    test(
      'signInWithEmailAndPassword saves credentials on successful API call',
      () async {
        // Arrange
        when(
          () => mockAuthApi.signInWithEmailAndPassword(any()),
        ).thenAnswer((_) async => signInResponseDto);

        when(
          () => mockAuthDatabase.saveCredential(any()),
        ).thenAnswer((_) async {});

        // Act
        await authRepository.signInWithEmailAndPassword(signInRequest);

        // Assert
        verify(() => mockAuthApi.signInWithEmailAndPassword(any())).called(1);
        verify(() => mockAuthDatabase.saveCredential(any())).called(1);
      },
    );

    test(
      'getCredential returns mapped domain Credential when available',
      () async {
        // Arrange
        when(
          () => mockAuthDatabase.getCredential(),
        ).thenAnswer((_) async => credentialEntity);

        // Act
        final result = await authRepository.getCredential();

        // Assert
        expect(result, isA<Credential>());
        expect(result?.userId, equals('user-id'));
        expect(result?.token, equals('token'));
        expect(result?.refreshToken, equals('refresh-token'));
      },
    );

    test('isSignedIn returns true when user is authenticated', () async {
      // Arrange
      when(() => mockAuthDatabase.isSignedIn).thenAnswer((_) async => true);

      // Act
      final result = await authRepository.isSignedIn();

      // Assert
      expect(result, isTrue);
    });

    test('signOut clears stored credentials', () async {
      // Arrange
      when(() => mockAuthDatabase.clear()).thenAnswer((_) async => {});

      // Act
      await authRepository.signOut();

      // Assert
      verify(() => mockAuthDatabase.clear()).called(1);
    });
  });
}
