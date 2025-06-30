import 'package:flutter_clean_blox_template/features/auth/domain/models/auth.dart';
import 'package:flutter_clean_blox_template/features/auth/domain/usecases/sign_up_usecase/sign_up_usecase.dart';
import 'package:flutter_clean_blox_template/features/auth/domain/usecases/sign_up_usecase/sign_up_usecase_param.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_clean_blox_template/core/core.dart';

import '../../repositories/auth_repository_test.mocks.dart';

@GenerateMocks([SignUpUsecase])
void main() {
  late MockAuthRepository mockRepository;
  late SignUpUsecase usecase;

  setUp(() {
    mockRepository = MockAuthRepository();
    usecase = SignUpUsecase(repository: mockRepository);
  });

  final testParam = SignUpUsecaseParam(
    name: 'Jane Doe',
    email: 'jane@example.com',
    password: 'securePassword123',
    confirmPassword: 'securePassword123',
  );

  final testParamInvalid = SignUpUsecaseParam(
    name: 'Jane Doe',
    email: 'jane@example.com',
    password: 'securePassword123',
    confirmPassword: 'differentPassword123',
  );

  final testAuth = Auth(
    userId: 'user_001',
    accessToken: 'access_token_sample',
    refreshToken: 'refresh_token_sample',
  );

  group('SignUpUsecase', () {
    test(
      'should call signUp and saveAuth if user is not authenticated [SUCCESS]',
      () async {
        // ARRANGE
        when(mockRepository.isAuthenticated()).thenAnswer((_) async => false);
        when(
          mockRepository.signUp(
            name: testParam.name,
            email: testParam.email,
            password: testParam.password,
          ),
        ).thenAnswer((_) async => testAuth);
        when(
          mockRepository.saveAuth(testAuth),
        ).thenAnswer((_) async => Future.value());

        // ACT
        await usecase(testParam);

        // ASSERT
        verify(mockRepository.isAuthenticated()).called(1);
        verify(
          mockRepository.signUp(
            name: testParam.name,
            email: testParam.email,
            password: testParam.password,
          ),
        ).called(1);
        verify(mockRepository.saveAuth(testAuth)).called(1);
      },
    );

    test(
      'should throw BaseException with code ALREADY_AUTHENTICATED if user is already authenticated [ERROR]',
      () async {
        // ARRANGE
        when(mockRepository.isAuthenticated()).thenAnswer((_) async => true);

        // ACT & ASSERT
        expect(
          () => usecase(testParam),
          throwsA(
            isA<BaseException>()
                .having((e) => e.code, 'code', 'ALREADY_AUTHENTICATED')
                .having(
                  (e) => e.message,
                  'message',
                  'User is already authenticated. Please sign out first.',
                ),
          ),
        );

        verify(mockRepository.isAuthenticated()).called(1);
        verifyNever(
          mockRepository.signUp(
            name: anyNamed('name'),
            email: anyNamed('email'),
            password: anyNamed('password'),
          ),
        );
        verifyNever(mockRepository.saveAuth(any));
      },
    );

    test(
      'should throw exception from repository if signUp fails internally [ERROR]',
      () async {
        // ARRANGE
        when(mockRepository.isAuthenticated()).thenAnswer((_) async => false);
        when(
          mockRepository.signUp(
            name: testParam.name,
            email: testParam.email,
            password: testParam.password,
          ),
        ).thenThrow(
          BaseException(
            code: 'SIGN_UP_FAILED',
            message: 'Unable to sign up due to internal error.',
          ),
        );

        // ACT & ASSERT
        await expectLater(
          usecase(testParam),
          throwsA(
            isA<BaseException>()
                .having((e) => e.code, 'code', 'SIGN_UP_FAILED')
                .having(
                  (e) => e.message,
                  'message',
                  'Unable to sign up due to internal error.',
                ),
          ),
        );

        verify(mockRepository.isAuthenticated()).called(1);
        verify(
          mockRepository.signUp(
            name: testParam.name,
            email: testParam.email,
            password: testParam.password,
          ),
        ).called(1);
        verifyNever(mockRepository.saveAuth(any));
      },
    );
  });

  group('SignUpUsecaseParam Validation', () {
    test(
      'should throw ValidationException if parameters are invalid [ERROR]',
      () async {
        // ACT & ASSERT
        expect(
          () => usecase(testParamInvalid),
          throwsA(
            isA<ValidationException>()
                .having((e) => e.code, 'code', 'VALIDATION_ERROR')
                .having((e) => e.message, 'message', 'Validation failed')
                .having(
                  (e) => e.errors,
                  'errors',
                  contains(
                    isA<ValidatorFieldException>()
                        .having(
                          (e) => e.fieldName,
                          'fieldName',
                          'confirm_password',
                        )
                        .having(
                          (e) => e.message,
                          'message',
                          'Passwords do not match',
                        ),
                  ),
                ),
          ),
        );
      },
    );

    test(
      'should not throw exception if parameters are valid [SUCCESS]',
      () async {
        when(mockRepository.isAuthenticated()).thenAnswer((_) async => false);
        when(
          mockRepository.signUp(
            name: testParam.name,
            email: testParam.email,
            password: testParam.password,
          ),
        ).thenAnswer((_) async => testAuth);
        when(
          mockRepository.saveAuth(testAuth),
        ).thenAnswer((_) async => Future.value());
        // ACT & ASSERT
        expect(() => usecase(testParam), returnsNormally);
      },
    );
  });
}
