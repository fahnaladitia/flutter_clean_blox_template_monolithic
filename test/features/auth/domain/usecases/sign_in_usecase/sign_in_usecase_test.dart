import 'package:flutter_clean_blox_template/features/auth/domain/usecases/sign_in_usecase/sign_in_usecase.dart';
import 'package:flutter_clean_blox_template/features/auth/domain/usecases/sign_in_usecase/sign_in_usecase_param.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_clean_blox_template/core/core.dart';

import 'package:flutter_clean_blox_template/features/auth/domain/models/auth.dart';

import '../../repositories/auth_repository_test.mocks.dart';

@GenerateMocks([SignInUsecase])
void main() {
  late MockAuthRepository mockRepository;
  late SignInUsecase usecase;

  setUp(() {
    mockRepository = MockAuthRepository();
    usecase = SignInUsecase(repository: mockRepository);
  });

  final testParam = SignInUsecaseParam(
    email: 'test@email.com',
    password: 'password123',
  );

  final testAuth = Auth(
    userId: 'user123',
    accessToken: 'access-token',
    refreshToken: 'refresh-token',
  );

  test('should sign in and save auth if user not authenticated', () async {
    // ARRANGE
    when(mockRepository.isAuthenticated()).thenAnswer((_) async => false);
    when(
      mockRepository.signIn(
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
      mockRepository.signIn(
        email: testParam.email,
        password: testParam.password,
      ),
    ).called(1);
    verify(mockRepository.saveAuth(testAuth)).called(1);
  });

  test('should throw BaseException if user is already authenticated', () async {
    // ARRANGE
    when(mockRepository.isAuthenticated()).thenAnswer((_) async => true);

    // ACT & ASSERT
    expect(
      () => usecase(testParam),
      throwsA(
        isA<BaseException>().having(
          (e) => e.code,
          'code',
          'ALREADY_AUTHENTICATED',
        ),
      ),
    );

    verify(mockRepository.isAuthenticated()).called(1);
    verifyNever(
      mockRepository.signIn(
        email: anyNamed('email'),
        password: anyNamed('password'),
      ),
    );
    verifyNever(mockRepository.saveAuth(any));
  });
}
