part of 'auth_bloc.dart';

sealed class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

final class AuthCheckRequestedEvent extends AuthEvent {}

final class AuthSignOutRequestedEvent extends AuthEvent {}
