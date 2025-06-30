import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_clean_blox_template/core/core.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'package:flutter_clean_blox_template/features/auth/presentation/blocs/sign_in/sign_in_bloc.dart';
import 'package:flutter_clean_blox_template/features/auth/domain/usecases/sign_in_usecase/sign_in_usecase_param.dart';

import '../../../domain/usecases/sign_in_usecase/sign_in_usecase_test.mocks.dart';

void main() {
  late MockSignInUsecase mockSignInUsecase;

  setUp(() {
    mockSignInUsecase = MockSignInUsecase();
  });

  group('SignInBloc', () {
    const email = 'test@example.com';
    const password = 'password123';
    final param = SignInUsecaseParam(email: email, password: password);

    blocTest<SignInBloc, SignInState>(
      'emits [SignInLoading, SignInSuccess] when SignInRequestedEvent is successful',
      build: () {
        when(
          mockSignInUsecase.call(param),
        ).thenAnswer((_) async => Future.value());
        return SignInBloc(signInUsecase: mockSignInUsecase);
      },
      act: (bloc) =>
          bloc.add(SignInRequestedEvent(email: email, password: password)),
      expect: () => [SignInLoading(), SignInSuccess()],
      verify: (_) {
        verify(mockSignInUsecase.call(param)).called(1);
      },
    );

    blocTest<SignInBloc, SignInState>(
      'emits [SignInLoading, SignInFailure] when SignInRequestedEvent throws error',
      build: () {
        when(mockSignInUsecase.call(param)).thenThrow(
          BaseException(
            code: 'INVALID_CREDENTIALS',
            message: 'Email or password is incorrect',
          ),
        );
        return SignInBloc(signInUsecase: mockSignInUsecase);
      },
      act: (bloc) =>
          bloc.add(SignInRequestedEvent(email: email, password: password)),
      expect: () => [
        SignInLoading(),
        isA<SignInFailure>()
            .having((s) => s.error.code, 'code', 'INVALID_CREDENTIALS')
            .having((s) => s.error.message, 'message', contains('incorrect')),
      ],
    );
  });
}
