import 'package:flutter_clean_blox_template/features/auth/domain/usecases/get_access_token_usecase/get_access_token_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../repositories/auth_repository_test.mocks.dart';

@GenerateMocks([GetAccessTokenUsecase])
void main() {
  late MockAuthRepository mockRepository;
  late GetAccessTokenUsecase usecase;

  setUp(() {
    mockRepository = MockAuthRepository();
    usecase = GetAccessTokenUsecase(repository: mockRepository);
  });

  test('should return access token when user is authenticated', () async {
    // ARRANGE
    when(mockRepository.isAuthenticated()).thenAnswer((_) async => true);
    when(mockRepository.getAccessToken()).thenAnswer((_) async => 'mock_token');

    // ACT
    final result = await usecase();

    // ASSERT
    expect(result, 'mock_token');
    verify(mockRepository.isAuthenticated()).called(1);
    verify(mockRepository.getAccessToken()).called(1);
  });

  test('should return null when user is not authenticated', () async {
    // ARRANGE
    when(mockRepository.isAuthenticated()).thenAnswer((_) async => false);

    // ACT
    final result = await usecase();

    // ASSERT
    expect(result, isNull);
    verify(mockRepository.isAuthenticated()).called(1);
    verifyNever(mockRepository.getAccessToken());
  });
}
