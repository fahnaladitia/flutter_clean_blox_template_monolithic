import 'package:flutter_clean_blox_template/features/auth/domain/usecases/refresh_access_token_usecase/refresh_access_token_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_clean_blox_template/core/core.dart';

import '../../repositories/auth_repository_test.mocks.dart';

void main() {
  late MockAuthRepository mockRepository;
  late RefreshAccessTokenUsecase usecase;

  setUp(() {
    mockRepository = MockAuthRepository();
    usecase = RefreshAccessTokenUsecase(repository: mockRepository);
  });

  test('should refresh and update token when user is authenticated', () async {
    // ARRANGE
    when(mockRepository.isAuthenticated()).thenAnswer((_) async => true);
    when(
      mockRepository.getRefreshToken(),
    ).thenAnswer((_) async => 'refresh_token');
    when(
      mockRepository.createNewAccessToken('refresh_token'),
    ).thenAnswer((_) async => 'new_access_token');
    when(
      mockRepository.updateAccessToken('new_access_token'),
    ).thenAnswer((_) async => Future.value());

    // ACT
    await usecase();

    // ASSERT
    verify(mockRepository.isAuthenticated()).called(1);
    verify(mockRepository.getRefreshToken()).called(1);
    verify(mockRepository.createNewAccessToken('refresh_token')).called(1);
    verify(mockRepository.updateAccessToken('new_access_token')).called(1);
  });

  test('should throw BaseException when user is not authenticated', () async {
    // ARRANGE
    when(mockRepository.isAuthenticated()).thenAnswer((_) async => false);

    // ACT & ASSERT
    expect(
      () => usecase(),
      throwsA(
        isA<BaseException>().having((e) => e.code, 'code', 'NOT_AUTHENTICATED'),
      ),
    );

    verify(mockRepository.isAuthenticated()).called(1);
    verifyNever(mockRepository.getRefreshToken());
  });

  test('should throw BaseException when refresh token is null', () async {
    // ARRANGE
    when(mockRepository.isAuthenticated()).thenAnswer((_) async => true);
    when(mockRepository.getRefreshToken()).thenAnswer((_) async => null);

    // ACT & ASSERT
    await expectLater(
      usecase(),
      throwsA(
        isA<BaseException>()
            .having((e) => e.code, 'code', 'NO_REFRESH_TOKEN')
            .having(
              (e) => e.message,
              'message',
              'No refresh token found. Please sign in again.',
            ),
      ),
    );

    verify(mockRepository.isAuthenticated()).called(1);
    verify(mockRepository.getRefreshToken()).called(1);
    verifyNever(mockRepository.createNewAccessToken(any));
  });
}
