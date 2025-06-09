import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_clean_blox_template/domain/usecases/auth/sign_in_with_email_and_password/sign_in_with_email_and_password_usecase.dart';
import 'package:flutter_clean_blox_template/presentation/utils/bloc_utils.dart';
import 'package:flutter_clean_blox_template/presentation/utils/ui_error.dart';

part 'sign_in_event.dart';
part 'sign_in_state.dart';

/// =========================================================
/// Created by Pahnal Aditia
/// GitHub  : https://github.com/fahnaladitia
/// LinkedIn: https://www.linkedin.com/in/pahnaladitia
/// =========================================================

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  final SignInWithEmailAndPasswordUsecase signInWithEmailAndPasswordUsecase;
  SignInBloc({required this.signInWithEmailAndPasswordUsecase})
    : super(SignInInitial()) {
    on<SignInRequestedEvent>(_onSignInRequested);
  }

  FutureOr<void> _onSignInRequested(
    SignInRequestedEvent event,
    Emitter<SignInState> emit,
  ) async {
    await runBlocExecutor(
      onInitialBuilder: () => emit(SignInLoading()),
      onLogicBuilder: () async {
        final param = SignInWithEmailAndPasswordParam(
          email: event.email,
          password: event.password,
        );
        await signInWithEmailAndPasswordUsecase(param);
        emit(SignInSuccess());
      },
      onErrorBuilder: (error) => emit(SignInFailure(error: error)),
    );
  }
}
