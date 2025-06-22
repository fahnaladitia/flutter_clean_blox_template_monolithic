import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_clean_blox_template/domain/models/credential.dart';
import 'package:flutter_clean_blox_template/domain/usecases/auth/get_credential/get_credential_usecase.dart';
import 'package:flutter_clean_blox_template/domain/usecases/auth/is_signed_in/is_signed_in_usecase.dart';
import 'package:flutter_clean_blox_template/domain/usecases/auth/sign_out/sign_out_usecase.dart';
import 'package:flutter_clean_blox_template/presentation/utils/bloc_utils.dart';
import 'package:flutter_clean_blox_template/presentation/utils/ui_error.dart';

part 'auth_event.dart';
part 'auth_state.dart';

/// =========================================================
/// Created by Pahnal Aditia
/// GitHub  : https://github.com/fahnaladitia
/// LinkedIn: https://www.linkedin.com/in/pahnaladitia
/// =========================================================

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final GetCredentialUsecase getCredentialUsecase;
  final SignOutUsecase signOutUsecase;
  final IsSignedInUsecase isSignedInUsecase;
  AuthBloc({
    required this.getCredentialUsecase,
    required this.signOutUsecase,
    required this.isSignedInUsecase,
  }) : super(AuthInitialState()) {
    on<AuthCheckRequestedEvent>(_onAuthCheckRequested);
    on<AuthSignOutRequestedEvent>(_onAuthSignOutRequested);
  }

  FutureOr<void> _onAuthCheckRequested(
    AuthCheckRequestedEvent event,
    Emitter<AuthState> emit,
  ) async {
    await runBlocExecutor(
      onInitialBuilder: () => emit(AuthLoadingState()),
      onLogicBuilder: () async {
        final isSignedIn = await isSignedInUsecase();
        if (isSignedIn) {
          final credential = await getCredentialUsecase();
          if (credential != null) {
            emit(AuthAuthenticatedState(credential));
          } else {
            emit(AuthUnauthenticatedState());
          }
        } else {
          emit(AuthUnauthenticatedState());
        }
      },
      onErrorBuilder: (error) => emit(AuthErrorState(error)),
    );
  }

  FutureOr<void> _onAuthSignOutRequested(
    AuthSignOutRequestedEvent event,
    Emitter<AuthState> emit,
  ) async {
    await runBlocExecutor(
      onInitialBuilder: () => emit(AuthLoadingState()),
      onLogicBuilder: () async {
        await signOutUsecase();
        emit(AuthUnauthenticatedState());
      },
      onErrorBuilder: (error) => emit(AuthErrorState(error)),
    );
  }
}
