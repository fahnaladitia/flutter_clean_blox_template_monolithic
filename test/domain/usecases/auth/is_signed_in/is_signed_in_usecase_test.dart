import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter_clean_blox_template/domain/repositories/auth_repository.dart';
import 'package:flutter_clean_blox_template/domain/usecases/auth/is_signed_in/is_signed_in_usecase.dart';

class MockAuthRepository extends Mock implements IAuthRepository {}

void main() {
  late IsSignedInUsecase usecase;
  late MockAuthRepository mockAuthRepository;

  setUp(() {
    mockAuthRepository = MockAuthRepository();
    usecase = IsSignedInUsecase(mockAuthRepository);
  });

  test('should return true when user is signed in', () async {
    // Arrange
    when(() => mockAuthRepository.isSignedIn()).thenAnswer((_) async => true);

    // Act
    final result = await usecase();

    // Assert
    expect(result, true);
    verify(() => mockAuthRepository.isSignedIn()).called(1);
  });

  test('should return false when user is not signed in', () async {
    // Arrange
    when(() => mockAuthRepository.isSignedIn()).thenAnswer((_) async => false);

    // Act
    final result = await usecase();

    // Assert
    expect(result, false);
    verify(() => mockAuthRepository.isSignedIn()).called(1);
  });
}
