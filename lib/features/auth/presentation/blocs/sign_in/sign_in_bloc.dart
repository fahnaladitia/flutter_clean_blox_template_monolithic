import 'dart:async';

import 'package:flutter_clean_blox_template/features/auth/domain/usecases/sign_in_usecase/sign_in_usecase.dart';
import 'package:flutter_clean_blox_template/features/auth/domain/usecases/sign_in_usecase/sign_in_usecase_param.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_clean_blox_template/shared/shared.dart';

part 'sign_in_event.dart';
part 'sign_in_state.dart';

/// =========================================================
/// Created by Pahnal Aditia
/// GitHub  : https://github.com/fahnaladitia
/// LinkedIn: https://www.linkedin.com/in/pahnaladitia
/// =========================================================

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  final SignInUsecase signInUsecase;
  SignInBloc({required this.signInUsecase}) : super(SignInInitial()) {
    on<SignInRequestedEvent>(_onSignInRequested);
  }

  FutureOr<void> _onSignInRequested(
    SignInRequestedEvent event,
    Emitter<SignInState> emit,
  ) async {
    await BlocUtils.runBlocExecutor(
      onInitialBuilder: () => emit(SignInLoading()),
      onLogicBuilder: () async {
        final param = SignInUsecaseParam(
          email: event.email,
          password: event.password,
        );
        await signInUsecase(param);
        emit(SignInSuccess());
      },
      onErrorBuilder: (error) => emit(SignInFailure(error: error)),
    );
  }
}
