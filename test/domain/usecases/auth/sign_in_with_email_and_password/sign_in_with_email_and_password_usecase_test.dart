import 'package:flutter_clean_blox_template/core/common/exceptions/validator_exception.dart';
import 'package:flutter_clean_blox_template/domain/models/sign_in_request.dart';
import 'package:flutter_clean_blox_template/domain/repositories/auth_repository.dart';
import 'package:flutter_clean_blox_template/domain/usecases/auth/sign_in_with_email_and_password/sign_in_with_email_and_password_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockAuthRepository extends Mock implements IAuthRepository {}

class FakeSignInRequest extends Fake implements SignInRequest {}

void main() {
  late MockAuthRepository mockRepository;
  late SignInWithEmailAndPasswordUsecase usecase;

  // Register fallback values for mocktail
  setUpAll(() {
    registerFallbackValue(FakeSignInRequest());
  });

  setUp(() {
    mockRepository = MockAuthRepository();
    usecase = SignInWithEmailAndPasswordUsecase(mockRepository);
  });

  tearDown(() {
    mockRepository = MockAuthRepository();
    usecase = SignInWithEmailAndPasswordUsecase(mockRepository);
  });

  group('SignInWithEmailAndPasswordUsecase', () {
    final param = SignInWithEmailAndPasswordParam(
      email: 'user@example.com',
      password: 'password123',
    );

    test('should call repository with correct SignInRequest', () async {
      // Arrange
      when(
        () => mockRepository.signInWithEmailAndPassword(any()),
      ).thenAnswer((_) async {});

      // Act
      await usecase(param);

      // Assert
      verify(
        () => mockRepository.signInWithEmailAndPassword(
          SignInRequest(email: param.email, password: param.password),
        ),
      ).called(1);
    });

    test('should throw ValidatorException for invalid email', () {
      expect(
        () => SignInWithEmailAndPasswordParam(
          email: 'invalid',
          password: 'password123',
        ),
        throwsA(
          isA<ValidatorException>().having(
            (e) => e.fieldName,
            'field',
            equals('email'),
          ),
        ),
      );
    });

    test('should throw ValidatorException for invalid password', () {
      expect(
        () => SignInWithEmailAndPasswordParam(
          email: 'user@example.com',
          password: '',
        ),
        throwsA(
          isA<ValidatorException>().having(
            (e) => e.fieldName,
            'field',
            equals('password'),
          ),
        ),
      );
    });
  });
}
