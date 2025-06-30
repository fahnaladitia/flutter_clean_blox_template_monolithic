import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_clean_blox_template/core/core.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_clean_blox_template/features/auth/presentation/blocs/auth/auth_bloc.dart';

import '../../../domain/usecases/get_access_token_usecase/get_access_token_usecase_test.mocks.dart';
import '../../../domain/usecases/sign_out_usecase/sign_out_usecase_test.mocks.dart';

void main() {
  late MockSignOutUsecase mockSignOutUsecase;
  late MockGetAccessTokenUsecase mockGetAccessTokenUsecase;

  setUp(() {
    mockSignOutUsecase = MockSignOutUsecase();
    mockGetAccessTokenUsecase = MockGetAccessTokenUsecase();
  });

  group('AuthBloc', () {
    blocTest<AuthBloc, AuthState>(
      'emits [AuthLoadingState, AuthAuthenticatedState] when AuthCheckRequestedEvent succeeds with valid token',
      build: () {
        when(
          mockGetAccessTokenUsecase.call(),
        ).thenAnswer((_) async => 'valid_token');
        return AuthBloc(
          signOutUsecase: mockSignOutUsecase,
          getAccessTokenUsecase: mockGetAccessTokenUsecase,
        );
      },
      act: (bloc) => bloc.add(AuthCheckRequestedEvent()),
      expect: () => [AuthLoadingState(), AuthAuthenticatedState()],
    );

    blocTest<AuthBloc, AuthState>(
      'emits [AuthLoadingState, AuthUnauthenticatedState] when AuthCheckRequestedEvent returns null token',
      build: () {
        when(mockGetAccessTokenUsecase.call()).thenAnswer((_) async => null);
        return AuthBloc(
          signOutUsecase: mockSignOutUsecase,
          getAccessTokenUsecase: mockGetAccessTokenUsecase,
        );
      },
      act: (bloc) => bloc.add(AuthCheckRequestedEvent()),
      expect: () => [AuthLoadingState(), AuthUnauthenticatedState()],
    );

    blocTest<AuthBloc, AuthState>(
      'emits [AuthLoadingState, AuthErrorState] when AuthCheckRequestedEvent throws error',
      build: () {
        when(mockGetAccessTokenUsecase.call()).thenThrow(
          BaseException(code: 'ERROR', message: 'Failed to get access token'),
        );
        return AuthBloc(
          signOutUsecase: mockSignOutUsecase,
          getAccessTokenUsecase: mockGetAccessTokenUsecase,
        );
      },
      act: (bloc) => bloc.add(AuthCheckRequestedEvent()),
      expect: () => [
        AuthLoadingState(),
        isA<AuthErrorState>().having(
          (s) => s.error.message,
          'message',
          contains('Failed to get access token'),
        ),
      ],
    );

    blocTest<AuthBloc, AuthState>(
      'emits [AuthLoadingState, AuthUnauthenticatedState] when AuthSignOutRequestedEvent succeeds',
      build: () {
        when(mockSignOutUsecase.call()).thenAnswer((_) async {});
        return AuthBloc(
          signOutUsecase: mockSignOutUsecase,
          getAccessTokenUsecase: mockGetAccessTokenUsecase,
        );
      },
      act: (bloc) => bloc.add(AuthSignOutRequestedEvent()),
      expect: () => [AuthLoadingState(), AuthUnauthenticatedState()],
    );

    blocTest<AuthBloc, AuthState>(
      'emits [AuthLoadingState, AuthErrorState] when AuthSignOutRequestedEvent throws error',
      build: () {
        when(mockSignOutUsecase.call()).thenThrow(
          BaseException(code: 'SIGN_OUT_ERROR', message: 'Failed to sign out'),
        );
        return AuthBloc(
          signOutUsecase: mockSignOutUsecase,
          getAccessTokenUsecase: mockGetAccessTokenUsecase,
        );
      },
      act: (bloc) => bloc.add(AuthSignOutRequestedEvent()),
      expect: () => [
        AuthLoadingState(),
        isA<AuthErrorState>().having(
          (s) => s.error.message,
          'message',
          contains('Failed to sign out'),
        ),
      ],
    );
  });
}
