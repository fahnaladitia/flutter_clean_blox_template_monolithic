import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_clean_blox_template/core/utils/utils.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'package:flutter_clean_blox_template/features/auth/presentation/blocs/sign_up/sign_up_bloc.dart';
import 'package:flutter_clean_blox_template/features/auth/domain/usecases/sign_up_usecase/sign_up_usecase_param.dart';

import '../../../domain/usecases/sign_up_usecase/sign_up_usecase_test.mocks.dart';

void main() {
  late MockSignUpUsecase mockSignUpUsecase;

  setUp(() {
    mockSignUpUsecase = MockSignUpUsecase();
  });

  group('SignUpBloc', () {
    const name = 'Pahnal Aditia';
    const email = 'test@example.com';
    const password = 'password123';
    const confirmPassword = 'password123';

    final param = SignUpUsecaseParam(
      name: name,
      email: email,
      password: password,
      confirmPassword: confirmPassword,
    );

    blocTest<SignUpBloc, SignUpState>(
      'emits [SignUpLoading, SignUpSuccess] when SignUpRequestedEvent succeeds',
      build: () {
        when(
          mockSignUpUsecase.call(param),
        ).thenAnswer((_) async => Future.value());
        return SignUpBloc(signUpUsecase: mockSignUpUsecase);
      },
      act: (bloc) => bloc.add(
        SignUpRequestedEvent(
          name: name,
          email: email,
          password: password,
          confirmPassword: confirmPassword,
        ),
      ),
      expect: () => [SignUpLoading(), SignUpSuccess()],
      verify: (_) {
        verify(mockSignUpUsecase.call(param)).called(1);
      },
    );

    blocTest<SignUpBloc, SignUpState>(
      'emits [SignUpLoading, SignUpFailure] when SignUpRequestedEvent throws error',
      build: () {
        when(mockSignUpUsecase.call(param)).thenThrow(
          BaseException(
            code: 'EMAIL_ALREADY_IN_USE',
            message: 'This email is already registered',
          ),
        );
        return SignUpBloc(signUpUsecase: mockSignUpUsecase);
      },
      act: (bloc) => bloc.add(
        SignUpRequestedEvent(
          name: name,
          email: email,
          password: password,
          confirmPassword: confirmPassword,
        ),
      ),
      expect: () => [
        SignUpLoading(),
        isA<SignUpFailure>()
            .having((s) => s.error.code, 'code', 'EMAIL_ALREADY_IN_USE')
            .having((s) => s.error.message, 'message', contains('already')),
      ],
    );
  });
}
