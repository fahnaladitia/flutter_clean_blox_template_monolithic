import 'dart:async';

import 'package:flutter_clean_blox_template/features/auth/domain/usecases/get_access_token_usecase/get_access_token_usecase.dart';
import 'package:flutter_clean_blox_template/features/auth/domain/usecases/sign_out_usecase/sign_out_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_clean_blox_template/shared/shared.dart';

part 'auth_event.dart';
part 'auth_state.dart';

/// =========================================================
/// Created by Pahnal Aditia
/// GitHub  : https://github.com/fahnaladitia
/// LinkedIn: https://www.linkedin.com/in/pahnaladitia
/// =========================================================

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final SignOutUsecase signOutUsecase;
  final GetAccessTokenUsecase getAccessTokenUsecase;
  AuthBloc({required this.signOutUsecase, required this.getAccessTokenUsecase})
    : super(AuthInitialState()) {
    on<AuthCheckRequestedEvent>(_onAuthCheckRequested);
    on<AuthSignOutRequestedEvent>(_onAuthSignOutRequested);
  }

  FutureOr<void> _onAuthCheckRequested(
    AuthCheckRequestedEvent event,
    Emitter<AuthState> emit,
  ) async {
    await BlocUtils.runBlocExecutor(
      onInitialBuilder: () => emit(AuthLoadingState()),
      onLogicBuilder: () async {
        final accessToken = await getAccessTokenUsecase();
        if (accessToken != null && accessToken.isNotEmpty) {
          emit(AuthAuthenticatedState());
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
    await BlocUtils.runBlocExecutor(
      onInitialBuilder: () => emit(AuthLoadingState()),
      onLogicBuilder: () async {
        await signOutUsecase();
        emit(AuthUnauthenticatedState());
      },
      onErrorBuilder: (error) => emit(AuthErrorState(error)),
    );
  }
}
