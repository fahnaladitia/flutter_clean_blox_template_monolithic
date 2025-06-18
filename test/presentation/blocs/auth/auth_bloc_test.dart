import 'package:flutter_clean_blox_template/domain/models/credential.dart';
import 'package:flutter_clean_blox_template/domain/usecases/auth/get_credential/get_credential_usecase.dart';
import 'package:flutter_clean_blox_template/domain/usecases/auth/is_signed_in/is_signed_in_usecase.dart';
import 'package:flutter_clean_blox_template/domain/usecases/auth/sign_out/sign_out_usecase.dart';
import 'package:flutter_clean_blox_template/presentation/blocs/auth/auth_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';

class MockGetCredentialUsecase extends Mock implements GetCredentialUsecase {}

class MockIsSignedInUsecase extends Mock implements IsSignedInUsecase {}

class MockSignOutUsecase extends Mock implements SignOutUsecase {}

void main() {
  late AuthBloc authBloc;
  late MockGetCredentialUsecase mockGetCredential;
  late MockIsSignedInUsecase mockIsSignedIn;
  late MockSignOutUsecase mockSignOut;

  setUp(() {
    mockGetCredential = MockGetCredentialUsecase();
    mockIsSignedIn = MockIsSignedInUsecase();
    mockSignOut = MockSignOutUsecase();

    authBloc = AuthBloc(
      getCredentialUsecase: mockGetCredential,
      isSignedInUsecase: mockIsSignedIn,
      signOutUsecase: mockSignOut,
    );
  });

  tearDown(() => authBloc.close());

  group('AuthBloc', () {
    const credential = Credential(
      token: 'token',
      refreshToken: 'refresh',
      userId: 'user-id',
    );

    blocTest<AuthBloc, AuthState>(
      'emits [AuthLoadingState, AuthAuthenticatedState] when user is signed in and credential exists',
      build: () {
        when(() => mockIsSignedIn()).thenAnswer((_) async => true);
        when(() => mockGetCredential()).thenAnswer((_) async => credential);
        return authBloc;
      },
      act: (bloc) => bloc.add(AuthCheckRequestedEvent()),
      expect: () => [AuthLoadingState(), AuthAuthenticatedState(credential)],
    );

    blocTest<AuthBloc, AuthState>(
      'emits [AuthLoadingState, AuthUnauthenticatedState] when user is not signed in',
      build: () {
        when(() => mockIsSignedIn()).thenAnswer((_) async => false);
        return authBloc;
      },
      act: (bloc) => bloc.add(AuthCheckRequestedEvent()),
      expect: () => [AuthLoadingState(), AuthUnauthenticatedState()],
    );

    blocTest<AuthBloc, AuthState>(
      'emits [AuthLoadingState, AuthUnauthenticatedState] when signed in but no credential',
      build: () {
        when(() => mockIsSignedIn()).thenAnswer((_) async => true);
        when(() => mockGetCredential()).thenAnswer((_) async => null);
        return authBloc;
      },
      act: (bloc) => bloc.add(AuthCheckRequestedEvent()),
      expect: () => [AuthLoadingState(), AuthUnauthenticatedState()],
    );

    blocTest<AuthBloc, AuthState>(
      'emits [AuthLoadingState, AuthErrorState] on AuthCheckRequested failure',
      build: () {
        when(() => mockIsSignedIn()).thenThrow(Exception('failure'));
        return authBloc;
      },
      act: (bloc) => bloc.add(AuthCheckRequestedEvent()),
      expect: () => [AuthLoadingState(), isA<AuthErrorState>()],
    );

    blocTest<AuthBloc, AuthState>(
      'emits [AuthLoadingState, AuthUnauthenticatedState] on signOut',
      build: () {
        when(() => mockSignOut()).thenAnswer((_) async => Future.value());
        return authBloc;
      },
      act: (bloc) => bloc.add(AuthSignOutRequestedEvent()),
      expect: () => [AuthLoadingState(), AuthUnauthenticatedState()],
    );

    blocTest<AuthBloc, AuthState>(
      'emits [AuthLoadingState, AuthErrorState] on signOut failure',
      build: () {
        when(() => mockSignOut()).thenThrow(Exception('logout failed'));
        return authBloc;
      },
      act: (bloc) => bloc.add(AuthSignOutRequestedEvent()),
      expect: () => [AuthLoadingState(), isA<AuthErrorState>()],
    );
  });
}
