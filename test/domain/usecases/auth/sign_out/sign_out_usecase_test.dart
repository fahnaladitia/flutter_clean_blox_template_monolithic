import 'package:flutter_clean_blox_template/domain/repositories/auth_repository.dart';
import 'package:flutter_clean_blox_template/domain/usecases/auth/sign_out/sign_out_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockAuthRepository extends Mock implements IAuthRepository {}

void main() {
  late SignOutUsecase usecase;
  late MockAuthRepository mockRepository;

  setUp(() {
    mockRepository = MockAuthRepository();
    usecase = SignOutUsecase(mockRepository);
  });

  test('should call signOut() on the repository', () async {
    // Arrange
    when(
      () => mockRepository.signOut(),
    ).thenAnswer((_) async => Future.value());

    // Act
    await usecase();

    // Assert
    verify(() => mockRepository.signOut()).called(1);
  });

  test('should throw exception when repository throws', () async {
    // Arrange
    when(() => mockRepository.signOut()).thenThrow(Exception('sign out error'));

    // Act & Assert
    expect(() => usecase(), throwsA(isA<Exception>()));
    verify(() => mockRepository.signOut()).called(1);
  });
}
