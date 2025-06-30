import 'package:flutter_clean_blox_template/features/auth/domain/usecases/sign_out_usecase/sign_out_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../repositories/auth_repository_test.mocks.dart';

@GenerateMocks([SignOutUsecase])
void main() {
  late MockAuthRepository mockRepository;
  late SignOutUsecase usecase;

  setUp(() {
    mockRepository = MockAuthRepository();
    usecase = SignOutUsecase(repository: mockRepository);
  });

  test('should call signOut when user is authenticated', () async {
    // ARRANGE
    when(mockRepository.isAuthenticated()).thenAnswer((_) async => true);
    when(mockRepository.signOut()).thenAnswer((_) async => Future.value());

    // ACT
    await usecase();

    // ASSERT
    verify(mockRepository.isAuthenticated()).called(1);
    verify(mockRepository.signOut()).called(1);
  });

  test('should not call signOut when user is not authenticated', () async {
    // ARRANGE
    when(mockRepository.isAuthenticated()).thenAnswer((_) async => false);

    // ACT
    await usecase();

    // ASSERT
    verify(mockRepository.isAuthenticated()).called(1);
    verifyNever(mockRepository.signOut());
  });
}
