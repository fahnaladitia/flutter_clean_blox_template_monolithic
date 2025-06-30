import 'dart:async';

import 'package:flutter_clean_blox_template/features/auth/domain/usecases/sign_up_usecase/sign_up_usecase.dart';
import 'package:flutter_clean_blox_template/features/auth/domain/usecases/sign_up_usecase/sign_up_usecase_param.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_clean_blox_template/shared/shared.dart';

part 'sign_up_event.dart';
part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  final SignUpUsecase signUpUsecase;
  SignUpBloc({required this.signUpUsecase}) : super(SignUpInitial()) {
    on<SignUpRequestedEvent>(_onSignUpRequested);
  }

  FutureOr<void> _onSignUpRequested(
    SignUpRequestedEvent event,
    Emitter<SignUpState> emit,
  ) async {
    await BlocUtils.runBlocExecutor(
      onInitialBuilder: () => emit(SignUpLoading()),
      onLogicBuilder: () async {
        await signUpUsecase(
          SignUpUsecaseParam(
            name: event.name,
            email: event.email,
            password: event.password,
            confirmPassword: event.confirmPassword,
          ),
        );
        emit(SignUpSuccess());
      },
      onErrorBuilder: (error) => emit(SignUpFailure(error: error)),
    );
  }
}
