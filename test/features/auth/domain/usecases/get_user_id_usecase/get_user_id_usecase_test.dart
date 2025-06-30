import 'package:flutter_clean_blox_template/features/auth/domain/usecases/get_user_id_usecase/get_user_id_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../repositories/auth_repository_test.mocks.dart';

@GenerateMocks([GetUserIdUsecase])
void main() {
  late MockAuthRepository mockRepository;
  late GetUserIdUsecase usecase;

  setUp(() {
    mockRepository = MockAuthRepository();
    usecase = GetUserIdUsecase(repository: mockRepository);
  });

  test('should return user ID when user is authenticated', () async {
    // ARRANGE
    when(mockRepository.isAuthenticated()).thenAnswer((_) async => true);
    when(mockRepository.getUserId()).thenAnswer((_) async => 'user_123');

    // ACT
    final result = await usecase();

    // ASSERT
    expect(result, 'user_123');
    verify(mockRepository.isAuthenticated()).called(1);
    verify(mockRepository.getUserId()).called(1);
  });

  test('should return null when user is not authenticated', () async {
    // ARRANGE
    when(mockRepository.isAuthenticated()).thenAnswer((_) async => false);

    // ACT
    final result = await usecase();

    // ASSERT
    expect(result, isNull);
    verify(mockRepository.isAuthenticated()).called(1);
    verifyNever(mockRepository.getUserId());
  });
}
