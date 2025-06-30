part of 'auth_bloc.dart';

sealed class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];

  @override
  bool get stringify => true;
}

final class AuthInitialState extends AuthState {}

final class AuthLoadingState extends AuthState {}

final class AuthAuthenticatedState extends AuthState {}

final class AuthUnauthenticatedState extends AuthState {}

final class AuthErrorState extends AuthState {
  final UIError error;

  const AuthErrorState(this.error);

  @override
  List<Object> get props => [error];
}
