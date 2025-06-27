import 'package:flutter_clean_blox_template/domain/usecases/auth/get_credential/get_credential_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter_clean_blox_template/domain/models/credential.dart';
import 'package:flutter_clean_blox_template/domain/repositories/auth_repository.dart';

class MockAuthRepository extends Mock implements IAuthRepository {}

void main() {
  late GetCredentialUsecase usecase;
  late MockAuthRepository mockAuthRepository;

  setUp(() {
    mockAuthRepository = MockAuthRepository();
    usecase = GetCredentialUsecase(mockAuthRepository);
  });

  test('should return Credential from repository', () async {
    // Arrange
    const credential = Credential(
      userId: '123',
      token: 'abc',
      refreshToken: 'def',
    );

    when(
      () => mockAuthRepository.getCredential(),
    ).thenAnswer((_) async => credential);

    // Act
    final result = await usecase();

    // Assert
    expect(result, credential);
    verify(() => mockAuthRepository.getCredential()).called(1);
  });

  test('should return null if no credential found', () async {
    // Arrange
    when(
      () => mockAuthRepository.getCredential(),
    ).thenAnswer((_) async => null);

    // Act
    final result = await usecase();

    // Assert
    expect(result, isNull);
    verify(() => mockAuthRepository.getCredential()).called(1);
  });
}
